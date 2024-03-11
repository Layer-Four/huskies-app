import 'package:flutter_test/flutter_test.dart';
import 'package:huskies_app/models/player_model/player.dart';
import 'package:huskies_app/models/team/team.dart';

void main() {
  const bool activePlayer = true;
  const int age = 25;
  const int goals = 10;
  const String playerName = 'John Doe';
  const int playerNumber = 7;
  const Team currentTeam = Team(
    name: 'Test Team',
    tablePosition: 1,
    statistic: {'wins': 10, 'losses': 5},
    players: [],
  );

  const testPlayer = Player(
    activePlayer: activePlayer,
    age: age,
    currentTeam: currentTeam,
    goals: goals,
    name: playerName,
    playerNumber: playerNumber,
  );

  test('create Player', () {
    expect(testPlayer.activePlayer, activePlayer);
    expect(testPlayer.age, age);
    expect(testPlayer.goals, goals);
    expect(testPlayer.name, playerName);
    expect(testPlayer.playerNumber, playerNumber);
    expect(testPlayer.currentTeam, currentTeam);
  });

  test('player -> toJson() -> fromJson(-> Player)', () {
    final Map<String, dynamic> playerJson = testPlayer.toJson();
    final decodedPlayer = Player.fromJson(playerJson);
    expect(decodedPlayer, testPlayer);
  });
}
