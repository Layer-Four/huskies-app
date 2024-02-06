import 'package:flutter/material.dart';
import 'package:huskies_app/gui/views/widgets/ticket_widgets/red_text_button.dart';
import 'package:huskies_app/logic/helper/app_theme.dart';

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
        mainAxisAlignment: AppTheme.mainBetween,
        children: [
          Padding(
            padding: AppTheme.paddingM,
            child: Image.asset('assets/$image', width: 60),
          ),
          Text(
            gameDate,
            style: AppTheme.textDefaultSmallBlack,
          ),
          RedTextButton(onPressed: onPressed, title: 'Ticket'),
        ],
      ),
    );
  }
}




      // showDialog(
      //   context: context,
      //   builder: (context) => Container(
      //     width: MediaQuery.of(context).size.width - 40,
      //     color: const Color.fromARGB(225, 255, 255, 255),
      //     child: TextButton(
      //       child: const Text(
      //         'Buy Ticket',
      //         style: AppTheme.headStyle,
      //       ),
      //       onPressed: () => Navigator.of(context).pop(),
      //     ),
      //   ),
      // );
