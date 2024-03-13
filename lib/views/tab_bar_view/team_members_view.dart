import 'package:flutter/material.dart';

class TeamMemberGrid extends StatelessWidget {
  final List<Map<String, dynamic>> jsonData;

  const TeamMemberGrid({super.key, required this.jsonData});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              "MEET THE TEAM",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              "UNSER RUDEL",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          for (var roleData in jsonData)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      roleData['title'],
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),
                ),
                SizedBox(
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(), // Disable GridView scrolling
                    shrinkWrap: true, // Allow GridView to occupy minimum space
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemCount: roleData['members'].length,
                    itemBuilder: (BuildContext context, int index) {
                      return _playerCard(context, roleData, index);
                    },
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }

  Widget _playerCard(BuildContext ctx, Map<String, dynamic> roleData, int index) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.network(
            roleData['members'][index]['image'],
            width: 100,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 6.0),
            child: Text(
              roleData['members'][index]['name'],
              style: Theme.of(ctx).textTheme.labelLarge,
            ),
          ),
          Image.asset(
            'assets/images/l_s.png',
            height: 20,
          )
        ],
      ),
    );
  }
}
