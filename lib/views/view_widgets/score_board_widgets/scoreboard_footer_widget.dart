import 'package:flutter/material.dart';
import 'package:huskies_app/constants/app_theme.dart';

class GameStaticsFooterWidget extends StatelessWidget {
  final String season;
  const GameStaticsFooterWidget({
    super.key,
    required this.season,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: AppTheme.crossAlignStart,
      mainAxisAlignment: AppTheme.mainAlignBetween,
      children: [
        TextButton(
          onPressed: () => showDialog(
            context: context,
            builder: (context) => Container(
              margin: AppTheme.padding40_100,
              color: Colors.white70,
              alignment: AppTheme.alignCenter,
              child: const Text('Gesamte Tabelle'),
            ),
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
            color: AppTheme.highlightedBackground,
            child: const Text(
              'Gesamte Tabelle anzeigen',
              style: TextStyle(color: AppTheme.white, fontSize: 11),
            ),
          ),
        ),
        Text(
          'Hauptrunde ${season[0]}${season.substring(1).toLowerCase()}',
          style: const TextStyle(fontSize: 9.5),
        ),
      ],
    );
  }
}
