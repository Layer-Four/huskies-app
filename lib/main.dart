import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:huskies_app/gui/views/home_view.dart';
import 'package:huskies_app/gui/views/match_statisctics_view.dart';
import 'package:huskies_app/gui/views/ticket_views/ticket_main_view.dart';
import 'package:huskies_app/gui/views/widgets/nav_layer.dart';
import 'package:huskies_app/gui/views/widgets/shop_widgets/products_view.dart';
import 'package:huskies_app/logic/app_state.dart';
import 'package:huskies_app/logic/helpers/provider.dart';

final provider = StateNotifierProvider<AppStateNotifier, AppState>(
  (ref) => AppStateNotifier(
    AppState(
      views: [
        HomeView(),
        TicketView(),
        MatchStatisticsView(),
        ProductsView(),
      ],
    ),
  ),
);
void main() => runApp(
      const ProviderScope(child: MyApp()),
    );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: ViewNavigator(),
        ),
      ),
    );
  }
}
