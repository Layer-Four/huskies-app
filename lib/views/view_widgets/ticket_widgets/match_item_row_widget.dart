import 'package:flutter/material.dart';
import 'package:huskies_app/constants/app_theme.dart';
import 'package:huskies_app/views/view_widgets/ticket_widgets/red_text_button.dart';

class TicketItemRowWidget extends StatelessWidget {
  const TicketItemRowWidget({
    super.key,
    required this.backgroundColor,
    required this.gameDate,
    required this.image,
    this.onPressed,
  });

  final String image;
  final Color backgroundColor;
  final String gameDate;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      color: backgroundColor,
      child: Row(
        mainAxisAlignment: AppTheme.mainAlignBetween,
        children: [
          Padding(
            padding: AppTheme.paddingM,
            child: Image.asset('assets/$image', width: 60),
          ),
          Text(gameDate, style: AppTheme.textMedium),
          RedTextButton(onPressed: onPressed, title: 'Ticket'),
        ],
      ),
    );
  }
}
