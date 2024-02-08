// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlayerImpl _$$PlayerImplFromJson(Map<String, dynamic> json) => _$PlayerImpl(
      activePlayer: json['activePlayer'] as bool,
      age: json['age'] as int,
      currentTeam: Team.fromJson(json['currentTeam'] as Map<String, dynamic>),
      goals: json['goals'] as int,
      name: json['name'] as String,
      playerNumber: json['playerNumber'] as int,
    );

Map<String, dynamic> _$$PlayerImplToJson(_$PlayerImpl instance) =>
    <String, dynamic>{
      'activePlayer': instance.activePlayer,
      'age': instance.age,
      'currentTeam': instance.currentTeam,
      'goals': instance.goals,
      'name': instance.name,
      'playerNumber': instance.playerNumber,
    };
