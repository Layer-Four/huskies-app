import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:huskies_app/models/match_model/match.dart';
import 'package:huskies_app/models/team/team.dart';

part 'season.freezed.dart';
part 'season.g.dart';

@freezed
class Season with _$Season {
  const factory Season({
    required String league,
    required List<Matches> matches,
    required List<Team> teams,
    required Map scores,
    required String seasonTitle,
  }) = _Season;
  factory Season.fromJson(Map<String, dynamic> json) => _$SeasonFromJson(json);
}
