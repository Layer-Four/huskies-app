import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:huskies_app/gui/views/widgets/score_board_widgets/match_card_widget.dart';
import 'package:huskies_app/gui/views/widgets/headline_widget.dart';
import 'package:huskies_app/gui/views/widgets/user_icon_widget.dart';
import 'package:huskies_app/logic/helper/app_theme.dart';

class TicketShopView extends StatelessWidget {
  final List gamesInSeason;
  TicketShopView({super.key, required this.gamesInSeason});

  @override
  Widget build(BuildContext context) => Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(color: Colors.white),
        child: Column(
          children: [
            const HeadWidget(
              title: Text('Tickets', style: AppTheme.headStyle),
              end: UserIconWidget(image: 'da.jpg'),
            ),
            const Padding(
              padding: EdgeInsets.all(12),
              child: MatchCard(
                isLastMatch: false,
                color: Color.fromARGB(255, 215, 234, 249),
              ),
            ),
            const Padding(padding: EdgeInsets.all(20)),
            SizedBox(
              height: 285,
              child: ListView.builder(
                itemCount: gamesInSeason.length,
                itemBuilder: ((context, index) {
                  Color backgroundColor = Colors.white;
                  if (index.isEven) {
                    backgroundColor = const Color.fromARGB(255, 215, 234, 249);
                  }
                  return TicketitemRowWidget(
                      image: 'assets/fuechse.jpg',
                      backgroundColor: backgroundColor,
                      gameDate: 'Freitag, 01.03.24 19:30 Uhr');
                }),
              ),
            ),
          ],
        ),
      );
}

class TicketitemRowWidget extends StatelessWidget {
  const TicketitemRowWidget({
    super.key,
    required this.backgroundColor,
    required this.gameDate,
    required this.image,
  });
  final String image;
  final Color backgroundColor;
  final String gameDate;

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
            child: Image.asset(image, width: 60),
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
        ],
      ),
    );
  }
}
