import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:huskies_app/models/season_model/season.dart';
part 'appstate.freezed.dart';
part 'appstate.g.dart';

@freezed
class SeasonState with _$AppState {
  const factory SeasonState({
    Season? currentSeason,
    List<Season>? season,
  }) = _AppState;

  factory SeasonState.fromJson(Map<String, dynamic> json) => _$AppStateFromJson(json);
}
