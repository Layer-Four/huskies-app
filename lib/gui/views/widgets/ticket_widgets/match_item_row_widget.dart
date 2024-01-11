import 'dart:developer';

import 'package:flutter/material.dart';
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
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      color: backgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('assets/$image', width: 60),
          ),
          Text(gameDate),
          TextButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => Container(
                  width: MediaQuery.of(context).size.width - 40,
                  color: const Color.fromARGB(225, 255, 255, 255),
                  child: TextButton(
                    child: const Text(
                      'Buy Ticket',
                      style: AppTheme.headStyle,
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
              );
              log('add Ticket to card or open popup to choice amount of tickets');
            },
            child: TextButton(
              onPressed: onPressed,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 0, 0),
                    borderRadius: BorderRadius.circular(6)),
                child: const Text(
                  'Ticket',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
