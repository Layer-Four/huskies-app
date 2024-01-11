import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:huskies_app/gui/views/ticket_views/ticket_wallet_view.dart';
import 'package:huskies_app/gui/views/widgets/score_board_widgets/match_card_widget.dart';
import 'package:huskies_app/gui/views/widgets/headline_widget.dart';
import 'package:huskies_app/gui/views/widgets/ticket_widgets/match_item_row_widget.dart';
import 'package:huskies_app/gui/views/widgets/user_icon_widget.dart';
import 'package:huskies_app/logic/helper/app_theme.dart';

class TicketShopView extends StatelessWidget {
  final List gamesInSeason;
  const TicketShopView({super.key, required this.gamesInSeason});

  @override
  Widget build(BuildContext context) => Container(
        // height: MediaQuery.of(context).size.height,
        // width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(color: Colors.white),
        child: Column(
          children: [
            HeadWidget(
              leading: IconButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TicketWalletView(),
                  ),
                ),
                icon: const Icon(Icons.bookmark_border_outlined),
              ),
              title: const Text('Tickets', style: AppTheme.headStyle),
              end: UserIconWidget(
                image: 'da.jpg',
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => Card(
                          child: Column(
                            children: [
                              HeadWidget(
                                leading: IconButton(
                                    onPressed: () => Navigator.of(context).pop(),
                                    icon: const Icon(Icons.arrow_back)),
                                title: const UserIconWidget(image: 'da.jpg'),
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                                child: Text('hier ist der User'),
                              ),
                            ],
                          ),
                        )),
                  ),
                ),
              ),
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
                  return TicketItemRowWidget(
                    image: 'fuechse.png',
                    backgroundColor: backgroundColor,
                    gameDate: 'Freitag, 01.03.24 19:30 Uhr',
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
                              onPressed: () {
                                log('add Ticket to card or open popup to choice amount of tickets');
                                Navigator.of(context).pop();
                              }),
                        ),
                      );
                    },
                  );
                }),
              ),
            ),
          ],
        ),
      );
}
