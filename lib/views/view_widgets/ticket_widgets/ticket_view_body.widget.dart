import 'package:flutter/material.dart';
import 'package:huskies_app/constants/app_theme.dart';

class TicketBodyViewWidget extends StatelessWidget {
  final DateTime? date;
  final String? destination;
  final bool paid;
  final String? seats;
  final String? ticketID;

  const TicketBodyViewWidget(
      {super.key, this.date, this.destination, this.paid = false, this.seats, this.ticketID});

  @override
  Widget build(BuildContext context) => Column(
        children: [
          builfInfoSection(
              headleft: 'Datum',
              valueLeft: date == null ? 'Keine Datum' : '${date!.day}/${date!.month}/${date!.year}',
              headright: 'Plätze',
              valueRight: seats ?? 'Keine Sitzplätze'),
          builfInfoSection(
            headleft: 'Ort',
            valueLeft: destination ?? 'Playgground',
            headright: 'Uhrzeit',
            valueRight: date == null
                ? 'Startzeit'
                : date!.minute <= 10
                    ? '${date!.hour}:${date!.minute}0 Uhr'
                    : '${date!.hour}:${date!.minute} Uhr',
          ),
          builfInfoSection(
              headleft: 'Bezahlt',
              valueLeft: paid ? 'Bezahlt' : 'Noch Austehend',
              headright: 'Auftrag',
              valueRight: ticketID ?? 'Keine Tickets'),
        ],
      );

  Widget builfInfoSection({
    required String headleft,
    required String valueLeft,
    required String headright,
    required String valueRight,
  }) =>
      Padding(
        padding: AppTheme.paddingM,
        child: Row(
          mainAxisAlignment: AppTheme.mainAround,
          children: [
            SizedBox(
              width: 100,
              child: Column(
                crossAxisAlignment: AppTheme.crossAlignStart,
                mainAxisAlignment: AppTheme.mainAround,
                children: [
                  Text(
                    headleft,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: AppTheme.ticketViewBody),
                  ),
                  Text(
                    valueLeft,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 80,
              child: Column(
                mainAxisAlignment: AppTheme.mainAround,
                crossAxisAlignment: AppTheme.crossAlignStart,
                children: [
                  Text(
                    headright,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppTheme.ticketViewBody,
                    ),
                  ),
                  Text(
                    valueRight,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            )
          ],
        ),
      );
}
