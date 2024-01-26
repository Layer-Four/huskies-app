// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appstate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppStateImpl _$$AppStateImplFromJson(Map<String, dynamic> json) =>
    _$AppStateImpl(
      currentSeason: json['currentSeason'] == null
          ? null
          : Season.fromJson(json['currentSeason'] as Map<String, dynamic>),
      season: (json['season'] as List<dynamic>?)
          ?.map((e) => Season.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$AppStateImplToJson(_$AppStateImpl instance) =>
    <String, dynamic>{
      'currentSeason': instance.currentSeason,
      'season': instance.season,
    };
