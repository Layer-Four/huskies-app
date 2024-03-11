import 'package:flutter_test/flutter_test.dart';
import 'package:huskies_app/models/team/team.dart';
import 'package:huskies_app/models/player_model/player.dart';

void main() {
  const String teamName = 'Test Team';
  const int tablePosition = 1;
  final Map<String, dynamic> statistic = {'wins': 10, 'losses': 5};
  final List<Player> players = [];

  final testTeam = Team(
    name: teamName,
    tablePosition: tablePosition,
    statistic: statistic,
    players: players,
  );

  test('create Team', () {
    expect(testTeam.name, teamName);
    expect(testTeam.tablePosition, tablePosition);
    expect(testTeam.statistic, statistic);
    expect(testTeam.players, players);
  });

  test('team -> toJson() -> fromJson(-> Team)', () {
    final Map<String, dynamic> teamJson = testTeam.toJson();
    final decodedTeam = Team.fromJson(teamJson);
    expect(decodedTeam, testTeam);
  });
}
