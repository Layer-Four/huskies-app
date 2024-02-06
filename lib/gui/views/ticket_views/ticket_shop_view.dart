import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:huskies_app/gui/views/widgets/score_board_widgets/match_card_widget.dart';
import 'package:huskies_app/gui/views/widgets/headline_widget.dart';
import 'package:huskies_app/gui/views/widgets/ticket_widgets/match_item_row_widget.dart';
import 'package:huskies_app/gui/views/widgets/user_icon_widget.dart';
import 'package:huskies_app/logic/helper/app_theme.dart';

class TicketShopView extends ConsumerWidget {
  final List gamesInSeason;
  const TicketShopView({super.key, required this.gamesInSeason});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: const BoxDecoration(color: AppTheme.white),
      child: Column(
        children: [
          HeadWidget(
            start: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(Icons.arrow_back),
            ),
            center: const Text('Tickets',
                style: TextStyle(fontSize: 29, color: AppTheme.black, inherit: false)),
            end: UserIconWidget(
              image: 'da.jpg',
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: ((context) => Card(
                        child: Column(
                          children: [
                            HeadWidget(
                              start: IconButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  icon: const Icon(Icons.arrow_back)),
                              center: const UserIconWidget(image: 'da.jpg'),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                              child: Text('Hier ist der User'),
                            ),
                          ],
                        ),
                      )),
                ),
              ),
            ),
          ),
          const Padding(
            padding: AppTheme.paddingL,
            child: MatchCard(
              isLastMatch: false,
              color: AppTheme.huskiesPuzzle,
            ),
          ),
          const Padding(padding: AppTheme.paddingXL),
          SizedBox(
            height: 285,
            child: ListView.builder(
              itemCount: gamesInSeason.length,
              itemBuilder: ((context, index) {
                Color backgroundColor = Colors.white;
                if (index.isEven) {
                  backgroundColor = AppTheme.ticketBackground;
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
                        color: AppTheme.white,
                        child: TextButton(
                            child: const Text(
                              'Buy Ticket',
                              // style: AppTheme.headStyle,
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
}
