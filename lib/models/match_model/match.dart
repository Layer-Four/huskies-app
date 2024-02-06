import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:huskies_app/models/game_report/game_report.dart';
import 'package:huskies_app/models/team/team.dart';
part 'match.freezed.dart';
part 'match.g.dart';

@freezed
class Matches with _$Matches {
  const factory Matches({
    String? endScore,
    GameReport? gameReport,
    Map? goals,
    Team? home,
    Team? visitor,
    Team? winner,
  }) = _Matches;

  // factory Match.pastMatch({
  //   required String endScore,
  //   required GameReport gameReports,
  //   required Map goals,
  //   required Team home,
  //   required Team visitor,
  //   required Team winner,
  // }) = PastMatch;
  // factory Match.nextMatch({
  //   required Team home,
  //   required Team visitor,
  // }) = NextMatch;
  factory Matches.fromJson(Map<String, dynamic> json) => _$MatchesFromJson(json);
}
