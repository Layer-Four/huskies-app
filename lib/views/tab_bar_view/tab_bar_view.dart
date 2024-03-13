import 'package:flutter/material.dart';
import 'package:huskies_app/constants/app_theme.dart';
import 'package:huskies_app/constants/globals.dart';
import 'package:huskies_app/views/tab_bar_view/spiel_plan.dart';
import 'package:huskies_app/views/tab_bar_view/team_huskies.dart';
import 'package:huskies_app/views/tab_bar_view/team_members_view.dart';
import 'package:huskies_app/views/view_widgets/score_board_widgets/scoreboard_widget.dart';

class MyTabBar extends StatefulWidget {
  const MyTabBar({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyTabBarState createState() => _MyTabBarState();
}

class _MyTabBarState extends State<MyTabBar> with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 45,
          decoration: const BoxDecoration(
            color: AppTheme.primary,
          ),
          child: TabBar(
            controller: _tabController,
            indicatorColor: AppTheme.primary,
            labelColor: AppTheme.black,
            unselectedLabelColor: AppTheme.white,
            indicatorSize: TabBarIndicatorSize.tab, // Set indicator size to label
            indicator: const BoxDecoration(
              color: AppTheme.huskiesPuzzle,
            ),
            tabs: const [
              Tab(
                child: Text("Spiel Plan"),
              ),
              Tab(
                child: Text("Tabelle"),
              ),
              Tab(
                child: Text("Team"),
              ),
              Tab(
                child: Text("Team2"),
              ),
            ],
          ),
        ),
        Expanded(
          child: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            controller: _tabController,
            children: [
              const WebTeamSpielPlan(),
              const ScoreboardViewWidget(),
              const WebTeamContainer(),
              TeamMemberGrid(jsonData: jsonData),
            ],
          ),
        )
      ],
    );
  }
}
