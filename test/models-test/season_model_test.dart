import 'package:flutter_test/flutter_test.dart';
import 'package:huskies_app/models/team/team.dart';
import 'package:huskies_app/models/season_model/season.dart';
import 'package:huskies_app/models/player_model/player.dart';

void main() {
  group('Season', () {
    test('fromJson and toJson', () {
      const team1 = Team(
        name: 'Team 1',
        tablePosition: 1,
        statistic: {'wins': 2, 'losses': 1},
        players: [
          Player(
            activePlayer: true,
            age: 25,
            currentTeam: Team(name: 'Team 1', tablePosition: 1, statistic: {}, players: []),
            goals: 5,
            name: 'Player 1',
            playerNumber: 10,
          ),
          // Add more players if needed
        ],
      );

      const team2 = Team(
        name: 'Team 2',
        tablePosition: 2,
        statistic: {'wins': 1, 'losses': 2},
        players: [
          Player(
            activePlayer: true,
            age: 28,
            currentTeam: Team(name: 'Team 2', tablePosition: 2, statistic: {}, players: []),
            goals: 3,
            name: 'Player 2',
            playerNumber: 7,
          ),
          // Add more players if needed
        ],
      );

      const season = Season(
        league: 'Test League',
        matches: [],
        teams: [team1, team2], // Include the constructed teams here
        scores: {},
        seasonTitle: 'Test Season',
      );

      final json = season.toJson();
      final fromJson = Season.fromJson(json);

      expect(fromJson, equals(season));
    });
  });
}
