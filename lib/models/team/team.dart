import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:huskies_app/models/player_model/player.dart';

part 'team.freezed.dart';
part 'team.g.dart';

@freezed
class Team with _$Team {
  const factory Team({
    required String name,
    required int tablePosition,
    required Map statistic,
    required List<Player> players,
  }) = _Team;
  factory Team.fromJson(Map<String, dynamic> json) => _$TeamFromJson(json);
}
