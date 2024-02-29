import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
            child: Image.asset('assets/images/$image', width: 60),
          ),
          Text(gameDate, style: AppTheme.textMedium),
          BlueTextButton(
            onPressed: onPressed,
            title: const Icon(
              FontAwesomeIcons.ticket,
              color: AppTheme.white,
            ),
          ),
        ],
      ),
    );
  }
}
