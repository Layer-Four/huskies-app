// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'season.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SeasonImpl _$$SeasonImplFromJson(Map<String, dynamic> json) => _$SeasonImpl(
      league: json['league'] as String,
      matches: (json['matches'] as List<dynamic>)
          .map((e) => Matches.fromJson(e as Map<String, dynamic>))
          .toList(),
      teams: (json['teams'] as List<dynamic>)
          .map((e) => Team.fromJson(e as Map<String, dynamic>))
          .toList(),
      scores: json['scores'] as Map<String, dynamic>,
      seasonTitle: json['seasonTitle'] as String,
    );

Map<String, dynamic> _$$SeasonImplToJson(_$SeasonImpl instance) =>
    <String, dynamic>{
      'league': instance.league,
      'matches': instance.matches,
      'teams': instance.teams,
      'scores': instance.scores,
      'seasonTitle': instance.seasonTitle,
    };
