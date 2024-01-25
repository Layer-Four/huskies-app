import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:huskies_app/provider/appstate.dart';
import 'package:huskies_app/provider/static_provider.dart';
import 'package:huskies_app/services/auth.dart';
import 'package:huskies_app/views/home/home_view.dart';
import 'package:huskies_app/views/shop/shop_view.dart';
import 'package:huskies_app/views/ticket_views/ticket_view.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../views/widgets/statistic_view/match_statisctics_view.dart';
part 'notifier.g.dart';

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

// }
@riverpod
class AppStateNotifier extends _$AppStateNotifier {
  AppStateNotifier();
  final _authService = AuthRepository();
  @override
  AppState build() {
    _authService.getAuthProvider;
    return AppState(
      views: [
        const HomeView(),
        const TicketView(),
        const MatchStatisticsView(season: 'Saison 23/24'),
        const ShopView(),
      ],
    );
  }

  void changeView({required int nextView}) =>
      state = state.copyWith(currentViewIndex: () => nextView);

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
      ref.read(statusProvider.notifier).state = AuthState.loggedOut;
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

  Future<bool> signInWithEmailAndPassword({required String email, required String password}) async {
    if (!validInput(email, password)) return false;
    final user = await _authService.signInWithEmailPassword(email: email, password: password);
    ref.read(authProvider).maybeMap(
          orElse: () => null,
          data: (_) {
            ref.read(statusProvider.notifier).state = AuthState.loggedIn;
          },
        );
    return user != null;
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
