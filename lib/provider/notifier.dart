import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:huskies_app/constants/globals.dart';
import 'package:huskies_app/services/auth.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier() : super(AuthState.unAuthificated);
  final _authService = AuthRepository();

// TODO: do this in AuthNotivier?
  Stream<User?> reloadUser() async* {
    try {
      _authService.reloadUser();
      yield* _authService.userAuthState();
    } catch (e) {
      _authService.logger.e(e.toString());
      throw 'Error on reload user';
    }
  }

  void signOut() {
    try {
      // await _googleSignIn.signOut();
      _authService.signOut();
      state = AuthState.loggedOut;
      // log('state is :${state.toJson()}');
    } catch (e) {
      _authService.logger.e(e.toString());
      throw 'error on sign out';
    }
  }

  // TODO: have owen provider that listen on FirebaseAuth.
  // void loadUserDM({required User user}) {
  //   FirebaseAuth.instance.authStateChanges().listen(
  //     (userDB) {
  //       if (userDB != null) {
  //         log('user found to listen');
  //         log(userDB.toString());
  //         final newUser = UserModel(
  //             name: user.displayName ?? '',
  //             uID: user.uid,
  //             email: user.email ?? 'beispiel@email.etc');
  //         // state = state.copyWith(newUSer: );
  //       }
  //       log('no user to listen');
  //     },
  //   );
  // }

  Future<void> signInWithEmailAndPassword({required String email, required String password}) async {
    if (!validInput(email, password)) {
      Future.delayed(const Duration(seconds: 2)).then((value) {});
      return;
    }
    final user = await _authService.signInWithEmailPassword(email: email, password: password);
    if (user != null) {
      if (user.isLogIn) {
        state = AuthState.loggedIn;
        return;
      }
      // if (user) {}
    } // ref.read(authProvider).maybeMap(
    //       orElse: () => null,
    //       data: (_) {
    //       },
    //     );
  }

  //? on Staring app there is a Firebase instance in console with a uid? is this a logged in user?
  // void listentoFireBaseAuth() {
  //   final foundUser = _authService.getAuthProvider();
  //   if (foundUser != null) {
  //     state = state.copyWith(newUSer: UserVM(uID: foundUser,email: foundUser));
  //   }
  // }

  /// register a user request and listen to Backend service.
  Future<bool> registerUserWithEmailAndPassword(
      {required String email, required String password}) async {
    final isvalidInput = validInput(email, password);

    if (isvalidInput) {
      _authService.registerUserWithEmailAndPassword(email: email, password: password);
    }
    return isvalidInput;
  }

  bool validInput(String email, String password) {
    if (email.contains('@') && email.contains(RegExp(r'\.[a-z]{2,3}$'))) {
      if (password.length > 5 &&
          password.contains(RegExp(r'\w')) &&
          password.contains(RegExp(r'[.,&!?$@€]'))) {
        return true;
      } else {
        log('incorrenct input: "$password" is not valid');
      }
    } else {
      log('incorrenct input: "$email" is not valid');
    }
    return false;
  }
}

  //   void sendEmailVerification() {
//     try {
//       _auth.sendEmailVerification();
//     } catch (e) {
//       _auth.logger.e(e.toString());
//       throw "Email can't be sendet";
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
//       // await _googleSignIn.signOut();
//       _auth.signOut();
//     } catch (e) {
//       _auth.logger.e(e.toString());
//       throw 'error on sign out';
//     }
//   }
