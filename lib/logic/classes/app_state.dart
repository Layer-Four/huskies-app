import 'package:flutter/material.dart';
import 'package:huskies_app/gui/views/home_view.dart';
import 'package:huskies_app/gui/views/match_statisctics_view.dart';
import 'package:huskies_app/gui/views/ticket_views/ticket_main_view.dart';
import 'package:huskies_app/gui/views/widgets/shop_widgets/products_view.dart';
import 'package:huskies_app/logic/classes/season.dart';
import 'package:huskies_app/logic/globals.dart';

class AppState {
  final int _currentViewIndex;
  final List<Widget> _views;
  final List<Map> _shopItems;
  final List<Season> _seasons;
  final int _currentSeason;
  AppState({views, currentView, products, season, currentSeason})
      : _currentSeason = currentSeason ??= 0,
        _currentViewIndex = currentView ??= 0,
        _views = views ??= [HomeView(), TicketView(), MatchStatisticsView(), ProductsView()],
        _seasons = season ??= <Season>[],
        _shopItems = products ??= productsList;

  int get currentseason => _currentSeason;
  int get currentView => _currentViewIndex;
  List<Map> get products => _shopItems;
  List<Season> get season => _seasons;
  List<Widget> get view => _views;

  AppState copyWith({
    int? currentViewIndex,
    Season? choisenSeason,
    // List<Widget>?viewsList,
  }) =>
      AppState(
          views: view,
          currentView: currentViewIndex ?? currentView,
          season: choisenSeason ?? season);
}
