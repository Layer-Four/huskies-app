import 'package:flutter/material.dart';
import 'package:huskies_app/views/tab_bar_view/team_huskies.dart';

class MyTabBar extends StatelessWidget {
  const MyTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: const Text('Huskies Team'),
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.directions_bus),
              ),
              Tab(
                icon: Icon(Icons.directions_train),
              ),
              Tab(
                icon: Icon(Icons.work_off_rounded),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Center(child: Text("bus")),
            Center(child: Text("train")),
            WebTeamContainer(),
          ],
        ),
      ),
    );
  }
}
