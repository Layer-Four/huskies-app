import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:huskies_app/constants/app_theme.dart';
import 'package:huskies_app/views/ticket_views/ticket_wallet_view.dart';
import 'package:huskies_app/views/view_widgets/button_widgets/shrinking_button.dart';
import 'package:huskies_app/views/view_widgets/headline_widget.dart';
import 'package:huskies_app/views/view_widgets/ticket_widgets/match_item_row_widget.dart';
import 'package:huskies_app/views/view_widgets/user_view_widgets/user_icon_widget.dart';

class TicketView extends ConsumerWidget {
  static const TicketView _instance = TicketView._();
  factory TicketView() => _instance;
  const TicketView._();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List gamesInSeason = List.generate(4, (index) => index++);
    return Scaffold(
      appBar: AppBar(
        title: const HeadWidget(
          center: Text('Tickets', style: AppTheme.titleBlack),
          end: UserIconWidget(),
        ),
      ),
      body: Column(
        children: [
          Column(
            children: [
              const Padding(padding: AppTheme.paddingXL),
              SizedBox(
                height: 330,
                child: ListView.builder(
                  itemCount: gamesInSeason.length,
                  itemBuilder: ((context, index) {
                    Color backgroundColor = AppTheme.white;
                    if (index.isEven) {
                      backgroundColor = AppTheme.ticketBackground;
                    }
                    return TicketItemRowWidget(
                      image: 'fuechse.png',
                      backgroundColor: backgroundColor,
                      gameDate: 'Freitag, 01.03.24 19:30 Uhr',
                      onPressed: () => Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => TicketWalletView())),
                    );
                  }),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 250,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: AppTheme.padding16_0,
                  child: Text('Dauerkarte'),
                ),
                ShrinkinButton(
                    onTap: () {},
                    // => Navigator.of(context).push(
                    //       MaterialPageRoute(
                    //           builder: (context) => TicketShopView(
                    //                 gamesInSeason:
                    //                     List.generate(5, (index) => null),
                    // )
                    // ),
                    // ),
                    child: const SizedBox(
                      width: 260,
                      child: Text(
                        'Dauerkarte Kaufen',
                        style: AppTheme.textWhiteMid,
                        textAlign: AppTheme.textCenter,
                      ),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
