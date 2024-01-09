import 'package:flutter/material.dart';

class AppState {
  final int _currentViewIndex;
  final List<Widget> _views;
  const AppState({views, currentView})
      : _views = views,
        _currentViewIndex = currentView ?? 0;

  List<Widget> get view => _views;
  int get currentView => _currentViewIndex;

  AppState copyWith({
    int? currentViewIndex,
    // List<Widget>?viewsList,
  }) =>
      AppState(
        views: view,
        currentView: currentViewIndex ?? currentView,
      );
}
