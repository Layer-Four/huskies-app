// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'season_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SeasonStateImpl _$$SeasonStateImplFromJson(Map<String, dynamic> json) =>
    _$SeasonStateImpl(
      currentSeason: json['currentSeason'] == null
          ? null
          : Season.fromJson(json['currentSeason'] as Map<String, dynamic>),
      season: (json['season'] as List<dynamic>?)
          ?.map((e) => Season.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$SeasonStateImplToJson(_$SeasonStateImpl instance) =>
    <String, dynamic>{
      'currentSeason': instance.currentSeason,
      'season': instance.season,
    };
