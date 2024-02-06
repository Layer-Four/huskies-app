// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MatchesImpl _$$MatchesImplFromJson(Map<String, dynamic> json) =>
    _$MatchesImpl(
      endScore: json['endScore'] as String?,
      gameReport: json['gameReport'] == null
          ? null
          : GameReport.fromJson(json['gameReport'] as Map<String, dynamic>),
      goals: json['goals'] as Map<String, dynamic>?,
      home: json['home'] == null
          ? null
          : Team.fromJson(json['home'] as Map<String, dynamic>),
      visitor: json['visitor'] == null
          ? null
          : Team.fromJson(json['visitor'] as Map<String, dynamic>),
      winner: json['winner'] == null
          ? null
          : Team.fromJson(json['winner'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$MatchesImplToJson(_$MatchesImpl instance) =>
    <String, dynamic>{
      'endScore': instance.endScore,
      'gameReport': instance.gameReport,
      'goals': instance.goals,
      'home': instance.home,
      'visitor': instance.visitor,
      'winner': instance.winner,
    };
