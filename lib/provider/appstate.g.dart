// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appstate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppState _$AppStateFromJson(Map<String, dynamic> json) => AppState(
      currentSeason: json['currentSeason'] == null
          ? null
          : Season.fromJson(json['currentSeason'] as Map<String, dynamic>),
      currentView: json['currentView'] as int?,
      products: json['products'],
      season: (json['season'] as List<dynamic>?)
          ?.map((e) => Season.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AppStateToJson(AppState instance) => <String, dynamic>{
      'currentSeason': instance.currentSeason,
      'currentView': instance.currentView,
      'products': instance.products,
      'season': instance.season,
    };
