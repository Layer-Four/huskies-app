import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:huskies_app/constants/app_theme.dart';
import 'package:huskies_app/views/view_widgets/score_board_widgets/match_card_widget.dart';
import 'package:huskies_app/views/view_widgets/score_board_widgets/scoreboard_footer_widget.dart';
import 'package:huskies_app/views/view_widgets/score_board_widgets/scoreboard_widget.dart';

class MatchStatisticsView extends ConsumerWidget {
  static const MatchStatisticsView _instance = MatchStatisticsView._();
  factory MatchStatisticsView() {
    return _instance;
  }
  const MatchStatisticsView._();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const String season = 'SAISON 23/24';
    return SingleChildScrollView(
      child: Container(
        padding: AppTheme.padding16_0,
        child: const Column(
          children: [
            MatchCard(
              homeScore: 3,
              visitorScore: 1,
            ),
            Padding(
              padding: AppTheme.paddinVerticalSmall,
              child: ScoreboardViewWidget(),
            ),
            GameStaticsFooterWidget(season: season)
          ],
        ),
      ),
    );
  }
}
