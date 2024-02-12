import 'package:flutter/material.dart';
import 'package:huskies_app/logic/helper/app_theme.dart';

class TicketHeadViewWidget extends StatelessWidget {
  final String? homeTeam;
  final String? visitorTeam;
  const TicketHeadViewWidget({super.key, this.homeTeam, this.visitorTeam});

  @override
  Widget build(BuildContext context) => Padding(
        padding: AppTheme.boxPadding,
        child: Row(
          mainAxisAlignment: AppTheme.mainCenter,
          children: [
            Text(
              homeTeam ?? 'Home Team',
              style: const TextStyle(
                letterSpacing: 0.4,
                fontWeight: FontWeight.bold,
                fontSize: 12,
                color: AppTheme.ticketViewHead,
              ),
            ),
            const Text(
              ' VS ',
              style: AppTheme.textDefaultRed,
            ),
            // Visitor
            Text(
              visitorTeam ?? 'Visitor Team',
              style: const TextStyle(
                letterSpacing: 0.4,
                fontWeight: FontWeight.bold,
                fontSize: 12,
                color: AppTheme.ticketViewHead,
              ),
            ),
          ],
        ),
      );
}
