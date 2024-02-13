import 'package:flutter/material.dart';
import 'package:huskies_app/constants/app_theme.dart';

class TicketHeadViewWidget extends StatelessWidget {
  final String? homeTeam;
  final String? visitorTeam;
  const TicketHeadViewWidget({super.key, this.homeTeam, this.visitorTeam});

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 12.0, bottom: 12),
        child: Row(
          mainAxisAlignment: AppTheme.mainAlignCenter,
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
              style: TextStyle(color: AppTheme.red, fontWeight: FontWeight.w900, fontSize: 14),
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
