// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MatchesImpl _$$MatchesImplFromJson(Map<String, dynamic> json) => _$MatchesImpl(
      endScore: json['endScore'] as String?,
      gameReport: (json['gameReport'] as List<dynamic>)
          .map((e) => _$recordConvertNullable(
                e,
                ($jsonValue) => (
                  $jsonValue[r'$1'] as int,
                  $jsonValue[r'$2'] as String,
                ),
              ))
          .toList(),
      goals: json['goals'] as Map<String, dynamic>?,
      home: json['home'] == null ? null : Team.fromJson(json['home'] as Map<String, dynamic>),
      visitor:
          json['visitor'] == null ? null : Team.fromJson(json['visitor'] as Map<String, dynamic>),
      winner: json['winner'] == null ? null : Team.fromJson(json['winner'] as Map<String, dynamic>),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$MatchesImplToJson(_$MatchesImpl instance) => <String, dynamic>{
      'endScore': instance.endScore,
      'gameReport': instance.gameReport
          .map((e) => e == null
              ? null
              : {
                  r'$1': e.$1,
                  r'$2': e.$2,
                })
          .toList(),
      'goals': instance.goals,
      'home': instance.home,
      'visitor': instance.visitor,
      'winner': instance.winner,
      'runtimeType': instance.$type,
    };

$Rec? _$recordConvertNullable<$Rec>(
  Object? value,
  $Rec Function(Map) convert,
) =>
    value == null ? null : convert(value as Map<String, dynamic>);

_$PastMatchImpl _$$PastMatchImplFromJson(Map<String, dynamic> json) => _$PastMatchImpl(
      endScore: json['endScore'] as String,
      gameReports: (json['gameReports'] as List<dynamic>)
          .map((e) => _$recordConvert(
                e,
                ($jsonValue) => (
                  $jsonValue[r'$1'] as int,
                  $jsonValue[r'$2'] as String,
                ),
              ))
          .toList(),
      goals: json['goals'] as Map<String, dynamic>,
      home: Team.fromJson(json['home'] as Map<String, dynamic>),
      visitor: Team.fromJson(json['visitor'] as Map<String, dynamic>),
      winner: Team.fromJson(json['winner'] as Map<String, dynamic>),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$PastMatchImplToJson(_$PastMatchImpl instance) => <String, dynamic>{
      'endScore': instance.endScore,
      'gameReports': instance.gameReports
          .map((e) => {
                r'$1': e.$1,
                r'$2': e.$2,
              })
          .toList(),
      'goals': instance.goals,
      'home': instance.home,
      'visitor': instance.visitor,
      'winner': instance.winner,
      'runtimeType': instance.$type,
    };

$Rec _$recordConvert<$Rec>(
  Object? value,
  $Rec Function(Map) convert,
) =>
    convert(value as Map<String, dynamic>);

_$NextMatchImpl _$$NextMatchImplFromJson(Map<String, dynamic> json) => _$NextMatchImpl(
      home: Team.fromJson(json['home'] as Map<String, dynamic>),
      visitor: Team.fromJson(json['visitor'] as Map<String, dynamic>),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$NextMatchImplToJson(_$NextMatchImpl instance) => <String, dynamic>{
      'home': instance.home,
      'visitor': instance.visitor,
      'runtimeType': instance.$type,
    };
