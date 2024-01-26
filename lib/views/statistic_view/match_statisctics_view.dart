import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:huskies_app/views/widgets/headline_widget.dart';
import 'package:huskies_app/views/widgets/score_board_widgets/match_card_widget.dart';
import 'package:huskies_app/views/widgets/score_board_widgets/scoreboard_footer_widget.dart';
import 'package:huskies_app/views/widgets/score_board_widgets/scoreboard_widget.dart';
import 'package:huskies_app/views/widgets/user_icon_widget.dart';

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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                season,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              UserIconWidget(image: 'da.jpg'),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: const Column(
            children: [
              MatchCard(
                homeScore: 3,
                visitorScore: 1,
                homeImage: 'huskies.png',
                visitorImage: 'fuechse.png',
              ),
              SizedBox(height: 12),
              ScoreboardViewWidget(),
              SizedBox(height: 6),
              GameStaticsFooterWidget(season: season)
            ],
          ),
        ),
      ),
    );
  }
}
