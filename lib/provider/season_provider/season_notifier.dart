import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:huskies_app/provider/season_provider/season_state.dart';

class SeassonNotifier extends StateNotifier<SeasonState> {
  SeassonNotifier([super._state = const SeasonState()]);
}
