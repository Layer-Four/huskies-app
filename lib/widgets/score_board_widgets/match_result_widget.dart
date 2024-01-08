import 'package:flutter/material.dart';

class LastMatchResultWidget extends StatelessWidget {
  final int? homeScore;
  final int? visitiorScore;
  final String? homeImageSource;
  final String? visitorImageSource;
  const LastMatchResultWidget({
    super.key,
    this.homeScore,
    this.visitiorScore,
    this.homeImageSource,
    this.visitorImageSource,
  });

  @override
  Widget build(BuildContext context) => SizedBox(
        width: 250,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              'assets\\$homeImageSource',
              width: 45,
              height: 45,
            ),
            Center(
              child: Column(children: [
                Text(
                  homeScore != null && visitiorScore != null
                      ? '$homeScore : $visitiorScore'
                      : '- : -',
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                Text(
                  homeScore != null && visitiorScore != null
                      ? homeScore! < visitiorScore!
                          ? 'Verloren'
                          : 'Gewonnen'
                      : '',
                )
              ]),
            ),
            Image.asset(
              'assets\\$visitorImageSource',
              width: 45,
              height: 45,
            )
          ],
        ),
      );
}
