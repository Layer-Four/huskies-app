import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:huskies_app/constants/app_theme.dart';
import 'package:huskies_app/constants/helpers.dart';
import 'package:huskies_app/views/view_widgets/home_view_widgets/match_view_widget.dart';
import 'package:huskies_app/views/view_widgets/ticket_widgets/match_item_row_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class TicketView extends ConsumerWidget {
  static const TicketView _instance = TicketView._();
  factory TicketView() => _instance;
  const TicketView._();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List gamesInSeason = List.generate(1, (index) => index++);
    return Column(
      children: [
        Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
              child: Card(
                child: Padding(
                  padding: EdgeInsets.all(6),
                  child: MatchViewWidget(),
                ),
              ),
            ),
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
                      image: 'playoffs.png',
                      backgroundColor: backgroundColor,
                      gameDate: 'Sonntag, 17.03.2024: 17.00 Uhr',
                      onPressed: () {
                        Helpers.launchToWebsite('https://tickets.kassel-huskies.de/tickets/962973',
                            mode: LaunchMode.inAppBrowserView);
                      });
                }),
              ),
            ),
          ],
        ),
        // SizedBox(
        //   height: 250,
        //   child: Column(
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       const Padding(
        //         padding: AppTheme.padding16_0,
        //         child: Text('Dauerkarte'),
        //       ),
        //       ShrinkinButton(
        //           onTap: () {},
        //           // => Navigator.of(context).push(
        //           //       MaterialPageRoute(
        //           //           builder: (context) => TicketShopView(
        //           //                 gamesInSeason:
        //           //                     List.generate(5, (index) => null),
        //           // )
        //           // ),
        //           // ),
        //           child: const SizedBox(
        //             width: 260,
        //             child: Text(
        //               'Dauerkarte Kaufen',
        //               style: AppTheme.textWhiteMid,
        //               textAlign: AppTheme.textCenter,
        //             ),
        //           )),
        //     ],
        //   ),
        // ),
      ],
    );
  }
}
