import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:huskies_app/logic/classes/app_state.dart';

class AppStateNotifier extends StateNotifier<AppState> {
  AppStateNotifier(super._state);
  void changeView({required int nextView}) => state = state.copyWith(currentViewIndex: nextView);
}
