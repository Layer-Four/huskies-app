import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:huskies_app/constants/app_theme.dart';
import 'package:huskies_app/views/view_widgets/score_board_widgets/match_card_widget.dart';
import 'package:huskies_app/views/view_widgets/headline_widget.dart';
import 'package:huskies_app/views/view_widgets/ticket_widgets/match_item_row_widget.dart';
import 'package:huskies_app/views/view_widgets/user_view_widgets/user_icon_widget.dart';

class TicketShopView extends ConsumerWidget {
  final List gamesInSeason;
  const TicketShopView({super.key, required this.gamesInSeason});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const HeadWidget(
            center: Text('Tickets', style: AppTheme.titleBlack),
            end: UserIconWidget(),
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(color: AppTheme.white),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(12),
                child: MatchCard(
                  isLastMatch: false,
                  color: AppTheme.ticketBackground,
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
        ),
      ),
    );
  }
}
