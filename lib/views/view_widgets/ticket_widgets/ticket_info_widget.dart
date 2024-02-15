import 'package:flutter/material.dart';
import 'package:huskies_app/constants/app_theme.dart';
import 'package:huskies_app/views/view_widgets/ticket_widgets/ticket_view_body.widget.dart';
import 'package:huskies_app/views/view_widgets/ticket_widgets/ticket_view_head_widget.dart';

class TicketInfoWidget extends StatelessWidget {
  final String? homeTeam;
  final String? visitorTeam;
  final DateTime? date;
  final String? destination;
  final String? seats;
  final String? ticketID;
  final bool paid;
  const TicketInfoWidget({
    super.key,
    required this.paid,
    this.homeTeam,
    this.visitorTeam,
    this.date,
    this.destination,
    this.seats,
    this.ticketID,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      color: AppTheme.ticketBackground,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      child: Padding(
        padding: AppTheme.paddingTb8_16,
        child: Column(
          children: [
            TicketHeadViewWidget(
              homeTeam: homeTeam,
              visitorTeam: visitorTeam,
            ),
            const Padding(
              padding: AppTheme.paddingM,
              child: Text(
                'e-ticket',
                style: AppTheme.redBoldTextStyle,
              ),
            ),
            TicketBodyViewWidget(
              date: date,
              destination: destination,
              paid: paid,
              seats: seats,
              ticketID: ticketID,
            ),
          ],
        ),
      ),
    );
  }
}
