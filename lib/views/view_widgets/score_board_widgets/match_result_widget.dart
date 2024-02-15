import 'package:flutter/material.dart';
import 'package:huskies_app/constants/app_theme.dart';

class LastMatchResultWidget extends StatelessWidget {
  final int? homeScore;
  final int? visitiorScore;
  final String? homeImage;
  final String? visitorImage;
  const LastMatchResultWidget({
    super.key,
    this.homeScore,
    this.visitiorScore,
    this.homeImage,
    this.visitorImage,
  });

  @override
  Widget build(BuildContext context) => SizedBox(
        width: 250,
        child: Row(
          mainAxisAlignment: AppTheme.mainAlignEvenly,
          children: [
            homeImage != null
                ? Image.network(
                    homeImage!,
                    width: 60,
                    height: 60,
                  )
                : Image.asset(
                    'assets/images/huskies.png',
                    width: 60,
                    height: 60,
                  ),
            Center(
              child: Column(children: [
                Text(
                  homeScore != null && visitiorScore != null
                      ? '$homeScore : $visitiorScore'
                      : '- : -',
                  style: AppTheme.defaultText,
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
            visitorImage != null
                ? Image.network(
                    visitorImage!,
                    width: 60,
                    height: 60,
                  )
                : Image.asset(
                    'assets/images/fuechse.png',
                    width: 60,
                    height: 60,
                  )
          ],
        ),
      );
}
