import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:huskies_app/logic/classes/app_state.dart';
import 'package:huskies_app/logic/classes/user.dart';

class AppStateNotifier extends StateNotifier<AppState> {
  AppStateNotifier(super._state);
  void changeView({required int nextView}) => state = state.copyWith(currentViewIndex: nextView);
  void login(User user) => state = state.copyWith(newUSer: user);
}
