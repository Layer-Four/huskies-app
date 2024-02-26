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
                'assets/images/fuechse.png',
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
          height: 90,
          child: const Column(
            children: [
              Text(
                "VS",
                style: AppTheme.defaultText,
              ),
              Text(
                "Eis-arena Weiswasser, \n 08.12.2023. 19.30 Uhr",
                style: AppTheme.textMedium,
              )
            ],
          ),
        ),
        imageVisitor == null
            ? Image.asset(
                'assets/images/huskies.png',
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
