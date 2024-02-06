// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:huskies_app/gui/views/widgets/score_board_widgets/match_card_widget.dart';
import 'package:huskies_app/gui/views/widgets/score_board_widgets/scoreboard_footer_widget.dart';
import 'package:huskies_app/gui/views/widgets/score_board_widgets/scoreboard_widget.dart';
import 'package:huskies_app/logic/helper/app_theme.dart';

class MatchStatisticsView extends ConsumerWidget {
  final String season;

  // const MatchStatisticsView();
  const MatchStatisticsView({super.key, required this.season});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const String season = 'SAISON 23/24';
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisAlignment: AppTheme.mainCenter,
          children: [
            Text(
              season,
              style: AppTheme.titleBlack,
            ),
            const SizedBox(width: 12),
            Container(
              width: 50,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(shape: BoxShape.circle),
              child: Image.asset(
                'assets/da.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: AppTheme.defaultHorizontalDistance,
          child: Column(
            children: [
              const MatchCard(
                homeScore: 3,
                visitorScore: 1,
                homeImage: 'huskies.png',
                visitorImage: 'fuechse.png',
              ),
              AppTheme.sizedBox14,
              const ScoreboardViewWidget(),
              AppTheme.sizedBox14,
              GameStaticsFooterWidget(season: season)
            ],
          ),
        ),
      ),
    );
  }
}
