import 'package:flutter/material.dart';
import 'package:huskies_app/constants/app_theme.dart';

class MatchViewWidget extends StatelessWidget {
  final String? imageHome;
  final String? imageVisitor;
  const MatchViewWidget({
    super.key,
    this.imageHome,
    this.imageVisitor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: AppTheme.mainAlignEvenly,
      children: [
        imageHome == null
            ? Image.asset(
                'assets/images/huskies.png',
                height: 90,
                width: 90,
              )
            : Image.network(
                imageHome!,
                height: 90,
                width: 90,
              ),
        Container(
          margin: const EdgeInsets.only(right: 12),
          child: Column(
            children: [
              Text(
                "VS",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Text(
                "Freitag, 01.03.2024. \n19.30 Uhr",
                style: AppTheme.textMedium,
                textAlign: TextAlign.center,
              ),
              Text('Nordhessen Arena')
            ],
          ),
        ),
        imageVisitor == null
            ? Image.asset(
                'assets/images/rosenheim.png',
                height: 90,
                width: 90,
              )
            : Image.network(
                imageVisitor!,
                height: 90,
                width: 90,
              ),
      ],
    );
  }
}
