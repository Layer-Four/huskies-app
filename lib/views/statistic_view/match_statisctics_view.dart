import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:huskies_app/constants/app_theme.dart';
import 'package:huskies_app/views/view_widgets/headline_widget.dart';
import 'package:huskies_app/views/view_widgets/score_board_widgets/match_card_widget.dart';
import 'package:huskies_app/views/view_widgets/score_board_widgets/scoreboard_footer_widget.dart';
import 'package:huskies_app/views/view_widgets/score_board_widgets/scoreboard_widget.dart';
import 'package:huskies_app/views/view_widgets/user_view_widgets/user_icon_widget.dart';

class MatchStatisticsView extends ConsumerWidget {
  static const MatchStatisticsView _instance = MatchStatisticsView._();
  factory MatchStatisticsView() {
    return _instance;
  }
  // const MatchStatisticsView();
  const MatchStatisticsView._();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const String season = 'SAISON 23/24';
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const HeadWidget(
          center: Row(
            mainAxisAlignment: AppTheme.mainAlignCenter,
            children: [
              Text(season, style: AppTheme.titleBlack),
              UserIconWidget(),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: AppTheme.defaultHorizontalDistance,
          child: const Column(
            children: [
              MatchCard(
                homeScore: 3,
                visitorScore: 1,
                homeImage: 'huskies.png',
                visitorImage: 'fuechse.png',
              ),
              AppTheme.sizedBox14,
              ScoreboardViewWidget(),
              AppTheme.sizedBox14,
              GameStaticsFooterWidget(season: season)
            ],
          ),
        ),
      ),
    );
  }
}
