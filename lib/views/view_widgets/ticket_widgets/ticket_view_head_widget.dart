import 'package:flutter/material.dart';
import 'package:huskies_app/constants/app_theme.dart';

class TicketHeadViewWidget extends StatelessWidget {
  final String? homeTeam;
  final String? visitorTeam;
  const TicketHeadViewWidget({super.key, this.homeTeam, this.visitorTeam});

  @override
  Widget build(BuildContext context) => Padding(
        padding: AppTheme.padding12_8,
        child: Row(
          mainAxisAlignment: AppTheme.mainAlignCenter,
          children: [
            Text(
              homeTeam ?? 'Home Team',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12,
                color: AppTheme.primary,
              ),
            ),
            const Text(' VS ', style: AppTheme.redBoldTextStyle),
            // Visitor
            Text(
              visitorTeam ?? 'Visitor Team',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12,
                color: AppTheme.primary,
              ),
            ),
          ],
        ),
      );
}
