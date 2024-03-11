import 'package:flutter_test/flutter_test.dart';
import 'package:huskies_app/models/match_model/match.dart';
import 'package:huskies_app/models/team/team.dart';

void main() {
  group('Matches', () {
    test('fromJson and toJson for PastMatch', () {
      final pastMatch = PastMatch(
        endScore: '2-1',
        gameReports: [(1, 'Goal'), (2, 'Assist')],
        goals: {'home': 2, 'visitor': 1},
        home: const Team(name: 'Home Team', tablePosition: 1, statistic: {}, players: []),
        visitor: const Team(name: 'Visitor Team', tablePosition: 2, statistic: {}, players: []),
        winner: const Team(name: 'Winner Team', tablePosition: 1, statistic: {}, players: []),
      );

      final json = pastMatch.toJson();
      final fromJson = PastMatch.fromJson(json);

      expect(fromJson, equals(pastMatch));
    });

    test('fromJson and toJson for NextMatch', () {
      final nextMatch = NextMatch(
        home: const Team(name: 'Home Team', tablePosition: 1, statistic: {}, players: []),
        visitor: const Team(name: 'Visitor Team', tablePosition: 2, statistic: {}, players: []),
      );

      final json = nextMatch.toJson();
      final fromJson = NextMatch.fromJson(json);

      expect(fromJson, equals(nextMatch));
    });

    test('fromJson and toJson for Matches', () {
      const matches = Matches(
        endScore: '2-1',
        gameReport: [],
        goals: {},
        home: Team(name: 'Home Team', tablePosition: 1, statistic: {}, players: []),
        visitor: Team(name: 'Visitor Team', tablePosition: 2, statistic: {}, players: []),
        winner: Team(name: 'Winner Team', tablePosition: 1, statistic: {}, players: []),
      );

      final json = matches.toJson();
      final fromJson = Matches.fromJson(json);

      expect(fromJson, equals(matches));
    });
  });
}
