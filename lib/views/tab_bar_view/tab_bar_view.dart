import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:huskies_app/constants/app_theme.dart';
import 'package:huskies_app/views/tab_bar_view/spiel_plan.dart';
import 'package:huskies_app/views/tab_bar_view/team_huskies.dart';
import 'package:huskies_app/views/view_widgets/score_board_widgets/scoreboard_widget.dart';

class MyTabBar extends StatefulWidget {
  const MyTabBar({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyTabBarState createState() => _MyTabBarState();
}

class _MyTabBarState extends State<MyTabBar> with SingleTickerProviderStateMixin {
  TabController? _tabController;
  List<Map<String, dynamic>> jsonData = [
    {
      "title": "TORHÜTER",
      "members": [
        {"name": "Philipp Maurer", "image": "https://www.kassel-huskies.de/fileadmin/user_upload/Maurer_Philipp_199_frontal.png"},
        {"name": "Kristian Hufsky", "image": "https://www.kassel-huskies.de/fileadmin/user_upload/Hufsky_Kristian_241_frontal.png"},
        {"name": "Brandon Maxwell", "image": "https://www.kassel-huskies.de/fileadmin/user_upload/Maxwell_Brandon_099_frontal.png"},
        {"name": "Alexander Pankraz", "image": "https://www.kassel-huskies.de/fileadmin/user_upload/Portrait-Pankraz.png"}
      ]
    },
    {
      "title": "VERTEIDIGER",
      "members": [
        {"name": "Joel Keussen", "image": "https://www.kassel-huskies.de/fileadmin/user_upload/Keussen_Joel_129_frontal.png"},
        {"name": "Marco Müller", "image": "https://www.kassel-huskies.de/fileadmin/user_upload/Mueller_Marco_147_frontal.png"},
        {"name": "Max Faber", "image": "https://www.kassel-huskies.de/fileadmin/user_upload/Faber_Max_135_frontal.png"},
        {"name": "Steven Seigo", "image": "https://www.kassel-huskies.de/fileadmin/user_upload/Seigo_Steven_093_frontal.png"},
        {"name": "Samuel Dotter", "image": "https://www.kassel-huskies.de/fileadmin/user_upload/Dotter_Samuel_217_frontal.png"},
        {"name": "Andrew Bodnarchuk", "image": "https://www.kassel-huskies.de/fileadmin/user_upload/Bodnarchuck_Andrew_117_frontal.png"},
        {"name": "Markus Freis", "image": "https://www.kassel-huskies.de/fileadmin/user_upload/Freis_Markus_211_frontal.png"},
        {"name": "Rayan Bettahar", "image": "https://www.kassel-huskies.de/fileadmin/user_upload/Portrait-BETTAHAR.png"},
        {"name": "Guillaume Naud", "image": "https://www.kassel-huskies.de/fileadmin/user_upload/Portrait-NAUD.png"}
      ]
    },
    {
      "title": "STÜRMER",
      "members": [
        {"name": "Hans Detsch", "image": "https://www.kassel-huskies.de/fileadmin/user_upload/Detsch_Hans_175_frontal.png"},
        {"name": "Lois Spitzner", "image": "https://www.kassel-huskies.de/fileadmin/user_upload/Spitzner_Lois_141_frontal.png"},
        {"name": "Jake Weidner", "image": "https://www.kassel-huskies.de/fileadmin/user_upload/Weidner_Jake_259_frontal.png"},
        {"name": "Pierre Preto", "image": "https://www.kassel-huskies.de/fileadmin/user_upload/Preto_Pierre_205_frontal.png"},
        {"name": "Lars Reuß", "image": "https://www.kassel-huskies.de/fileadmin/user_upload/Reuss_Lars_181_frontal.png"},
        {"name": "Alec Ahlroth", "image": "https://www.kassel-huskies.de/fileadmin/user_upload/Ahlroth_Alec_229_frontal.png"},
        {"name": "Darren Mieszkowski", "image": "https://www.kassel-huskies.de/fileadmin/user_upload/Mieszkowski_Darren_193_frontal.png"},
        {"name": "Tristan Keck", "image": "https://www.kassel-huskies.de/fileadmin/user_upload/Keck_Tristan_111_frontal.png"},
        {"name": "Joel Lowry", "image": "https://www.kassel-huskies.de/fileadmin/user_upload/Lowry_Joel_105_frontal.png"},
        {"name": "Oleg Tschwanow", "image": "https://www.kassel-huskies.de/fileadmin/user_upload/Tschwanow_Oleg_187_frontal.png"},
        {"name": "Connor Korte", "image": "https://www.kassel-huskies.de/fileadmin/user_upload/Korte_Connor_265_frontal.png"},
        {"name": "Yannik Valenti", "image": "https://www.kassel-huskies.de/fileadmin/user_upload/Valenti_Yannik_169_frontal.png"},
        {"name": "Louis Brune", "image": "https://www.kassel-huskies.de/fileadmin/user_upload/Brune_Louis_247_frontal.png"},
        {"name": "Ryan Olsen", "image": "https://www.kassel-huskies.de/fileadmin/user_upload/Portrait-Olsen.png"},
        {"name": "Carson McMillan", "image": "https://www.kassel-huskies.de/fileadmin/user_upload/McMillan_Carson_frontal.png"},
        {"name": "Rylan Schwartz", "image": "https://www.kassel-huskies.de/fileadmin/user_upload/Portrait-Schwartz.png"},
        {"name": "Daniel Weiß", "image": "https://www.kassel-huskies.de/fileadmin/user_upload/Portrait-Weiss.png"},
        {"name": "Stephen MacAulay", "image": "https://www.kassel-huskies.de/fileadmin/user_upload/Portrait-MacAulay.png"}
      ]
    },
    {
      "title": "TRAINER / SPORTLICHE LEITUNG",
      "members": [
        {"name": "Bill Stewart", "image": "https://www.kassel-huskies.de/fileadmin/user_upload/placeholder-image-player.png"},
        {"name": "Hugo Boisvert", "image": "https://www.kassel-huskies.de/fileadmin/user_upload/Portrait-BOISVERT.png"},
        {"name": "Manuel Klinge", "image": "https://www.kassel-huskies.de/fileadmin/user_upload/Portrait-KLINGE__1_.png"},
        {"name": "Jörn Perlwitz", "image": "https://www.kassel-huskies.de/fileadmin/user_upload/Portrait-PERLWITZ__2_.png"}
      ]
    },
    {
      "title": "MEDIZINISCHE ABTEILUNG",
      "members": [
        {"name": "Dr.Hans Schafdecker", "image": "https://www.kassel-huskies.de/fileadmin/user_upload/bilder/team/hschafdecker/Hans-Schafdecker_Portrait_Website.png"},
        {"name": "Dr.Sven Dallmann", "image": "https://www.kassel-huskies.de/fileadmin/user_upload/bilder/team/sdallmann/Sven-Dallmann_Portrait_Website.png"},
        {"name": "Witali Krieger", "image": "https://www.kassel-huskies.de/fileadmin/user_upload/bilder/team/wkrieger/Witali-Krieger_Portrait_Website.png"},
        {"name": "Dr.Christian Gröll", "image": "https://www.kassel-huskies.de/fileadmin/user_upload/Groell_Christian_Portrait.png"},
        {"name": "Dr.Michael Claar", "image": "https://www.kassel-huskies.de/fileadmin/user_upload/Dr-Michael_Claar_Portrait.png"},
        {"name": "Nicole Ellermann", "image": "https://www.kassel-huskies.de/fileadmin/user_upload/bilder/team/nellermann/Nicole-Ellermann_Portrait_Website.png"},
        {"name": "Markus Endert", "image": "https://www.kassel-huskies.de/fileadmin/user_upload/bilder/team/mendert/Markus-Endert_Portrait_Website.png"},
        {"name": "Kathrin Höhle", "image": "https://www.kassel-huskies.de/fileadmin/user_upload/bilder/team/khoehle/Kathrin-Hoehle_Portrait_Website.png"}
      ]
    },
    {
      "title": "BETREUER",
      "members": [
        {"name": "Fabian Körber", "image": "https://www.kassel-huskies.de/fileadmin/user_upload/Portrait-Koerber.png"},
        {"name": "Brent Davis", "image": "https://www.kassel-huskies.de/fileadmin/user_upload/Portrait-Brent-Davis.png"},
        {"name": "Frank Schönewolf", "image": "https://www.kassel-huskies.de/fileadmin/user_upload/Portrait-Schoenewolf.png"}
      ]
    }
  ];

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 45,
          decoration: BoxDecoration(
            color: AppTheme.primary,
            borderRadius: BorderRadius.circular(2),
          ),
          child: TabBar(
            controller: _tabController,
            indicatorColor: AppTheme.primary,
            labelColor: AppTheme.black,
            unselectedLabelColor: AppTheme.white,
            indicatorSize: TabBarIndicatorSize.tab, // Set indicator size to label
            indicator: BoxDecoration(
              // Use BoxDecoration for custom indicator
              color: AppTheme.huskiesPuzzle,
              borderRadius: BorderRadius.circular(2), // Adjust as needed
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
            ],
          ),
        ),
        Expanded(
          child: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            controller: _tabController,
            children: [
              WebTeamSpielPlan(),
              ScoreboardViewWidget(),
              TeamMemberGrid(jsonData: jsonData),
            ],
          ),
        )
      ],
    );
  }
}

