import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:huskies_app/constants/globals.dart';
import 'package:huskies_app/provider/static_provider.dart';
import 'package:huskies_app/views/home_view/home_view.dart';
import 'package:huskies_app/views/navigation_view/navbar_widget.dart';
import 'package:huskies_app/views/shop_view/shop_view.dart';
import 'package:huskies_app/views/ticket_views/ticket_view.dart';
import 'package:huskies_app/views/statistic_view/match_statisctics_view.dart';

class ViewNavigator extends ConsumerWidget {
  const ViewNavigator({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final view = ref.watch(viewProvider);
    final viewNotifier = ref.read(viewProvider.notifier);
    return SafeArea(
      child: Scaffold(
        body: switch (view) {
          ViewPage.ticket => TicketView(),
          ViewPage.table => MatchStatisticsView(),
          ViewPage.shop => const ShopView(),
          _ => HomeView()
        },
        bottomNavigationBar: NavigationBar(
          height: MediaQuery.of(context).size.height / 10,
          backgroundColor: const Color.fromARGB(255, 101, 132, 155),
          destinations: [
            NavBarIconWidget(
              icon: Icons.home_outlined,
              name: 'Home',
              isCurrentView: view == ViewPage.home,
              onPressed: () => viewNotifier.state = ViewPage.home,
            ),
            NavBarIconWidget(
              icon: Icons.bookmark_border_outlined,
              name: 'Tickets',
              isCurrentView: view == ViewPage.ticket,
              onPressed: () => viewNotifier.state = ViewPage.ticket,
            ),
            NavBarIconWidget(
              icon: Icons.mail_outline,
              name: 'Ergebnisse',
              isCurrentView: view == ViewPage.table,
              onPressed: () => viewNotifier.state = ViewPage.table,
            ),
            NavBarIconWidget(
                icon: Icons.card_giftcard,
                name: 'shop',
                isCurrentView: view == ViewPage.shop,
                onPressed: () {
                  if (view != ViewPage.shop) {
                    ref.read(statusProvider.notifier).onLoading(
                          duration: const Duration(seconds: 2),
                        );

                    viewNotifier.state = ViewPage.shop;
                  }
                }
                // Helpers.loadAndNavigate(
                //   context: context,
                //   ref: ref,
                //   nextView: ViewPage.shop,
                // ),
                ),
          ],
        ),
      ),
    );
  }
}