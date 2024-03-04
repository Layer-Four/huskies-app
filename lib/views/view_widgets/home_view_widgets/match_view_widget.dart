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
                "Viertelfinale",
                style: Theme.of(context).textTheme.labelLarge,
              ),
              Text(
                "Sonntag, 17.03.2024. \n17.00 Uhr",
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
              Text(
                'Nordhessen Arena',
                style: Theme.of(context).textTheme.labelMedium,
              )
            ],
          ),
        ),
        imageVisitor == null
            ? Image.asset(
                'assets/images/playoffs.png',
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
