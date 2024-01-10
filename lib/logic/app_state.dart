import 'package:flutter/material.dart';
import 'package:huskies_app/gui/views/home_view.dart';
import 'package:huskies_app/gui/views/match_statisctics_view.dart';
import 'package:huskies_app/gui/views/ticket_views/ticket_main_view.dart';
import 'package:huskies_app/gui/views/widgets/shop_widgets/products_view.dart';
import 'package:huskies_app/logic/globals.dart';

class AppState {
  final int _currentViewIndex;
  final List<Widget> _views;
  final List<Map> _shopItems;
  AppState({views, currentView, products})
      : _views = views ??= [HomeView(), TicketView(), MatchStatisticsView(), ProductsView()],
        _currentViewIndex = currentView ??= 0,
        _shopItems = products ??= productsList;

  List<Widget> get view => _views;
  int get currentView => _currentViewIndex;
  List<Map> get products => _shopItems;

  AppState copyWith({
    int? currentViewIndex,
    // List<Widget>?viewsList,
  }) =>
      AppState(
        views: view,
        currentView: currentViewIndex ?? currentView,
      );
}
