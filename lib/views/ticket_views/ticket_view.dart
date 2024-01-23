import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:huskies_app/global/app_theme.dart';
import 'package:huskies_app/views/ticket_views/ticket_shop_view.dart';
import 'package:huskies_app/views/ticket_views/ticket_wallet_view.dart';
import 'package:huskies_app/views/widgets/headline_widget.dart';
import 'package:huskies_app/views/widgets/ticket_widgets/match_item_row_widget.dart';
import 'package:huskies_app/views/widgets/ticket_widgets/red_text_button.dart';
import 'package:huskies_app/views/widgets/user_icon_widget.dart';

class TicketView extends ConsumerWidget {
  const TicketView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List gamesInSeason = List.generate(8, (index) => index++);
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              const HeadWidget(
                center: Text('Tickets', style: AppTheme.headStyle),
                end: UserIconWidget(image: 'da.jpg'),
              ),
              const Padding(padding: EdgeInsets.all(20)),
              SizedBox(
                height: 330,
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
                      onPressed: () => Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) => TicketWalletView())),
                    );
                  }),
                ),
              ),
            ],
          ),
          Padding(
            padding: AppTheme.smallPadding,
            child: RedTextButton(
                onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => TicketShopView(
                                gamesInSeason: List.generate(5, (index) => null),
                              )),
                    ),
                title: 'Weiter Tickets'),
            //  Helpers.loadAndNavigate(
            //       context: context,
            //       ref: ref,
            //       nextView: 1,
            //       image: 'profile.jpg',
            //       advertising: 'gegen Langeweile',
            //     ),
          ),
        ],
      ),
    );
  }
}
