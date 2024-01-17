// import 'dart:developer';

// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:huskies_app/auth/auth.dart';
import 'package:huskies_app/gui/views/home/home_view.dart';
import 'package:huskies_app/gui/views/shop/shop_view.dart';
import 'package:huskies_app/gui/views/ticket_views/ticket_view.dart';
import 'package:huskies_app/gui/views/widgets/statistic_view/match_statisctics_view.dart';
import 'package:huskies_app/logic/classes/app_state.dart';
import 'package:huskies_app/logic/classes/user.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';

// @riverpod
// class AppStateNotifier extends _$AppStateNotifier {
//   final FirebaseAuthRepository _auth = FirebaseAuthRepository();

//   Future<AppState> _fetchState() async {
//     _auth.getAuthProvider;
//     // TODO: implement Firebase API for loading optinal data from DB.
//     return AppState(
//       views: [HomeView(), TicketView(), MatchStatisticsView(season: 'Saison 23/24'), ShopView()],
//     );
//   }

//   @override
//   FutureOr<AppState> build() async {
//     return _fetchState();
//   }

//   void reloadUser() {
//     try {
//       _auth.reloadUser();
//     } catch (e) {
//       _auth.logger.e(e.toString());
//       throw 'Error on reload user';
//     }
//   }

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

// void changeView({required int nextView}) {}
// => state = state.copyWith(currentViewIndex: nextView);
// }
class AppStateNotifier extends StateNotifier<AppState> {
  AppStateNotifier([
    super.state = const AppState(
      views: [HomeView(), TicketView(), MatchStatisticsView(season: 'Saison 23/24'), ShopView()],
    ),
  ]);
  AppState build() => const AppState(
      views: [HomeView(), TicketView(), MatchStatisticsView(season: 'Saison 23/24'), ShopView()]);
  void changeView({required int nextView}) => state = state.copyWith(currentViewIndex: nextView);
  void login(User? user) => state = state.copyWith(newUSer: user!);
}
