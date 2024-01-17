import 'package:flutter/material.dart';
import 'package:huskies_app/logic/classes/season.dart';
import 'package:huskies_app/logic/classes/user.dart';
import 'package:huskies_app/logic/globals.dart';

class AppState {
  final Season? _currentSeason;
  final int _currentViewIndex;
  final List<Map> _shopItems;
  final List<Season>? _seasons;
  final User? _user;
  final List<Widget> _views;
  const AppState({
    Season? currentSeason,
    int? currentView,
    products,
    List<Season>? season,
    User? user,
    required List<Widget> views,
  })  : _currentSeason = currentSeason,
        _currentViewIndex = currentView ?? 0,
        _seasons = season,
        _shopItems = products ?? productsList,
        _views = views,
        _user = user;

  Season? get currentseason => _currentSeason;
  int get currentView => _currentViewIndex;
  List<Map> get products => _shopItems;
  List<Season>? get season => _seasons;
  List<Widget> get view => _views;
  User? get user => _user;

  AppState copyWith({
    int? currentViewIndex,
    Season? choisenSeason,
    User? newUSer,
    // List<Widget>?viewsList,
  }) =>
      AppState(
        views: view,
        currentView: currentViewIndex ?? currentView,
        currentSeason: choisenSeason ?? currentseason,
        user: newUSer ?? user,
      );
}
