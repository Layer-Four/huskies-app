import 'dart:async';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:huskies_app/provider/error_provider/error_provider.dart';
import 'package:huskies_app/services/auth.dart';

enum AuthState {
  loading,
  loggedIn,
  loggedOut,
  onError,
  onRegistration,
}

class AuthNotifier extends Notifier<AuthState> {
  final _authService = AuthRepository();
  @override
  AuthState build() {
    return AuthState.loggedOut;
  }

  void onError() => state = AuthState.onError;
  void reRouteToLogin() => state = AuthState.loggedOut;

  /// register a user request and listen to Backend service.
  Future<bool> registerUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    final isvalidInput = validInput(email, password);
    if (isvalidInput) {
      state = AuthState.loggedOut;
      final errorMessage =
          await _authService.registerUserWithEmailAndPassword(email: email, password: password);
      if (errorMessage != null) {
        ref.read(errorProvider.notifier).catchError(errorMessage);
      }
    }
    return isvalidInput;
  }

  Stream<User?> reloadUser() async* {
    try {
      _authService.reloadUser();
      yield* _authService.userAuthState();
    } catch (e) {
      _authService.logger.e(e.toString());
      throw 'Error on reload user';
    }
  }

  Future<void> signInWithEmailAndPassword({required String email, required String password}) async {
    state = AuthState.loading;
    if (!validInput(email, password)) {
      Future.delayed(const Duration(seconds: 2)).then((value) {
        state = AuthState.loggedOut;
      });
      return;
    }
    final response = await _authService.signInWithEmailPassword(email: email, password: password);
    if (response.$1 != null && response.$2 != null) {
      ref.read(errorProvider.notifier).catchError(throw Exception('''dont return two values!
      be shure just return a UserModel || String  '''));
    }
    if (response.$2 != null) {
      if (response.$2 == 'NO USER') {
        ref.read(errorProvider.notifier).catchError(
            'Es wurde kein Nutzer mit dieser Email gefunde\n Bitte kontrollier deine Email-Adresse oder Registriere dich');
      }
      ref.read(errorProvider.notifier).catchError(response.$2!);
      return;
    }
    if (response.$1 != null && response.$1 == false) {
      state = AuthState.onRegistration;
      return;
    }
    state = AuthState.loggedIn;
    return;
  }

  //? on Staring app there is a Firebase instance in console with a uid? is this a logged in user?
  // void listenToFireBaseAuth() {
  //   final foundUser = _authService.getAuthProvider();
  //   if (foundUser != null) {
  //     state = state.copyWith(newUSer: UserVM(uID: foundUser,email: foundUser));
  //   }
  // }

  FutureOr signOut() async {
    try {
      state = AuthState.loading;
      // await _googleSignIn.signOut();
      _authService.signOut();
      state = AuthState.loggedOut;
      // log('state is :${state.toJson()}');
    } catch (e) {
      _authService.logger.e(e.toString());
      throw 'error on sign out';
    }
  }

  bool validInput(String email, String password) {
    if (email.contains('@') && email.contains(RegExp(r'\.[a-z]{2,3}$'))) {
      if (password.length > 5 &&
          password.contains(RegExp(r'\w')) &&
          password.contains(RegExp(r'[.,&!?$@€]'))) {
        return true;
      } else {
        log('incorrect input: "$password" is not valid');
      }
    } else {
      log('incorrect input: "$email" is not valid');
    }
    return false;
  }

  void waitOnRegistration() async => state = AuthState.onRegistration;

  void onLogIn() => state = AuthState.loggedIn;
  void onLoading({Duration? duration}) {
    state = AuthState.loading;
    if (duration != null) {
      Future.delayed(duration).then((_) {
        state = AuthState.loggedIn;
      });
    }
  }
}

  //   void sendEmailVerification() {
//     try {
//       _auth.sendEmailVerification();
//     } catch (e) {
//       _auth.logger.e(e.toString());
//       throw "Email can't be send";
//     }
//   }

//   void resetPassword({required String email}) {
//     try {
//       _auth.resetPassword(email: email);
//     } catch (e) {
//       _auth.logger.e(e.toString());
//       throw 'Error on reset password';
//     }
//   }

//   void signOut() {
//     try {
//        await _googleSignIn.signOut();
//       _auth.signOut();
//     } catch (e) {
//       _auth.logger.e(e.toString());
//       throw 'error on sign out';
//     }
//   }
