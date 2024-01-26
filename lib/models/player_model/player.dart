import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:huskies_app/models/team/team.dart';
import 'package:json_annotation/json_annotation.dart';
part 'player.freezed.dart';
part 'player.g.dart';

@freezed
class Player with _$Player {
  const factory Player({
    required bool activePlayer,
    required int age,
    required Team currentTeam,
    required int goals,
    required String name,
    required int playerNumber,
  }) = _Player;
  factory Player.fromJson(Map<String, dynamic> json) => _$PlayerFromJson(json);
}
