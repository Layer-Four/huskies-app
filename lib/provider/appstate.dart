import 'package:flutter/material.dart';
import 'package:huskies_app/constants/globals.dart';
import 'package:huskies_app/models/leage_classes/season.dart';
import 'package:json_annotation/json_annotation.dart';
part 'appstate.g.dart';

/// different options for the user status.
enum AuthState { authificated, loggedIn, loggedOut, onRegistation, unAuthificated }

@JsonSerializable()
class AppState {
  final Season? _currentSeason;
  final int _currentViewIndex;
  final List<Map> _shopItems;
  final List<Season>? _seasons;
  final List<Widget> _views;
  AppState({
    Season? currentSeason,
    int? currentView,
    products,
    List<Season>? season,
    AuthState userState = AuthState.unAuthificated,
    List<Widget>? views,
  })  : _currentSeason = currentSeason,
        _currentViewIndex = currentView ?? 0,
        _seasons = season,
        _shopItems = products ?? productsList,
        _views = views ?? [];

  Season? get currentSeason => _currentSeason;
  int get currentView => _currentViewIndex;
  List<Map> get products => _shopItems;
  List<Season>? get season => _seasons;
  List<Widget> get view => _views;

  AppState copyWith({
    int? Function()? currentViewIndex,
    Season? Function()? choicenSeason,
    // List<Widget>?viewsList,
  }) =>
      AppState(
        views: view,
        currentView: currentViewIndex != null ? currentViewIndex() : _currentViewIndex,
        currentSeason: choicenSeason != null ? choicenSeason() : _currentSeason,
      );

  factory AppState.fromJson(Map<String, dynamic> json) => _$AppStateFromJson(json);
  Map<String, dynamic> toJson() => _$AppStateToJson(this);
}
