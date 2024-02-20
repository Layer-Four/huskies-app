import 'package:flutter/material.dart';
import 'package:huskies_app/constants/app_theme.dart';

Widget fakeHomeView() {
  return Container(
    color: AppTheme.fakeHomeViewColor,
    child: const Center(
      child: Text(
        'Fake-Home-View',
        style: TextStyle(
          fontSize: 35,
          color: AppTheme.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}

enum ViewPage {
  home,
  shop,
  table,
  ticket,
  newsFeed,
  myTabBar,
  error,
  loading,
}
