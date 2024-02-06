import 'package:flutter/material.dart';
import 'package:huskies_app/logic/helper/app_theme.dart';

class MatchViewWidget extends StatelessWidget {
  const MatchViewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: AppTheme.mainEvenly,
      children: [
        Image.asset(
          'assets/fuechse.png',
          height: 90,
        ),
        Container(
          margin: const EdgeInsets.only(right: 12),
          height: 90,
          child: const Column(
            children: [
              Text(
                "VS",
                style: AppTheme.textDefaultBlack,
              ),
              Text(
                "Eis-arena Weiswasser, \n 08.12.2023. 19.30 Uhr",
                style: AppTheme.textDefaultSmallBlack,
              )
            ],
          ),
        ),
        Image.asset(width: 70, 'assets/huskies.png'),
      ],
    );
  }
}
