import 'package:flutter/material.dart';

class TeamMemberGrid extends StatelessWidget {
  final List<Map<String, dynamic>> jsonData;

  TeamMemberGrid({required this.jsonData});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20), // Extra space above "MEET THE TEAM UNSER RUDEL" title
          Text(
            "MEET THE TEAM",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10), // Space between titles
          Text(
            "UNSER RUDEL",
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20), // Space between titles and grids
          for (var roleData in jsonData)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    roleData['title'],
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 200,
                  child: GridView.builder(
                    physics: NeverScrollableScrollPhysics(), // Disable GridView scrolling
                    shrinkWrap: true, // Allow GridView to occupy minimum space
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                    ),
                    itemCount: roleData['members'].length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        width: 100,
                        height: 100,
                        child: Column(
                          children: [
                            Image.network(
                              roleData['members'][index]['image'],
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(height: 4),
                            Text(roleData['members'][index]['name']),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
