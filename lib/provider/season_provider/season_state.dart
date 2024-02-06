import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:huskies_app/models/season_model/season.dart';
part 'season_state.freezed.dart';
part 'season_state.g.dart';

@freezed
class SeasonState with _$SeasonState {
  const factory SeasonState({
    Season? currentSeason,
    List<Season>? season,
  }) = _AppState;

  factory SeasonState.fromJson(Map<String, dynamic> json) => _$SeasonStateFromJson(json);
}
