import 'package:flutter/material.dart';
import 'package:huskies_app/gui/views/home_view.dart';
import 'package:huskies_app/gui/views/match_statisctics_view.dart';
import 'package:huskies_app/gui/views/shop_view.dart';
import 'package:huskies_app/gui/views/ticket_views/ticket_shop_view.dart';
import 'package:huskies_app/logic/classes/season.dart';
import 'package:huskies_app/logic/classes/user.dart';
import 'package:huskies_app/logic/globals.dart';

class AppState {
  final int _currentViewIndex;
  final List<Widget> _views;
  final List<Map> _shopItems;
  final List<Season> _seasons;
  final int _currentSeason;
  final User? _user;
  AppState({
    currentSeason,
    currentView,
    products,
    season,
    user,
    views,
  })  : _currentSeason = currentSeason ??= 0,
        _currentViewIndex = currentView ??= 0,
        _seasons = season ??= <Season>[],
        _shopItems = products ??= productsList,
        _views = views ??= [
          HomeView(),
          TicketShopView(
            gamesInSeason: List.generate(10, (index) => null),
          ),
          MatchStatisticsView(),
          ShopView(),
        ],
        _user = user;

  int get currentseason => _currentSeason;
  int get currentView => _currentViewIndex;
  List<Map> get products => _shopItems;
  List<Season> get season => _seasons;
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
        season: choisenSeason ?? season,
        user: newUSer ?? user,
      );
}
