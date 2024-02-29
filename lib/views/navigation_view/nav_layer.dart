import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:huskies_app/constants/app_theme.dart';
import 'package:huskies_app/provider/error_provider/error_provider.dart';
import 'package:huskies_app/provider/static_provider.dart';
import 'package:huskies_app/views/error_view/error_screen_widget.dart';
import 'package:huskies_app/views/home_view/home_view.dart';
import 'package:huskies_app/views/navigation_view/navbar_widget.dart';
import 'package:huskies_app/views/shop_view/shop_view.dart';
import 'package:huskies_app/views/tab_bar_view/tab_bar_view.dart';
import 'package:huskies_app/views/ticket_views/ticket_view.dart';
import 'package:huskies_app/views/statistic_view/match_statisctics_view.dart';
import 'package:huskies_app/views/view_widgets/headline_widget.dart';
// import 'package:huskies_app/views/view_widgets/newsfeed/newsfeed.dart';

class ViewNavigator extends ConsumerWidget {
  const ViewNavigator({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final view = ref.watch(viewProvider);
    final viewNotifier = ref.read(viewProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppTheme.primary,
        title: HeadWidget(
            start: const Icon(
              Icons.menu,
              color: AppTheme.white,
              size: 50,
            ),
            center: SizedBox(
              child: Image.asset(
                'assets/images/huskies.png',
                height: 50,
                width: 50,
              ),
            )),
      ),
      body: Container(
        color: Color.fromARGB(255, 239, 237, 237),
        child: switch (view) {
          ViewPage.ticket => TicketView(),
          ViewPage.table => MatchStatisticsView(),
          ViewPage.shop => const ShopView(),
          // ViewPage.newsFeed => const NewsFeed(),
          ViewPage.error => ShowErrorScreen(error: ref.watch(errorProvider).last),
          ViewPage.myTabBar => const MyTabBar(),
          _ => HomeView()
        },
      ),
      bottomNavigationBar: NavigationBar(
        height: MediaQuery.of(context).size.height / 12,
        backgroundColor: AppTheme.primary,
        destinations: [
          NavBarIconWidget(
            icon: FontAwesomeIcons.house,
            // name: 'Home',
            isCurrentView: view == ViewPage.home,
            onPressed: () => viewNotifier.state = ViewPage.home,
          ),
          // NavBarIconWidget(
          //   icon: Icons.newspaper,
          //   name: 'News',
          //   isCurrentView: view == ViewPage.newsFeed,
          //   onPressed: () => viewNotifier.state = ViewPage.newsFeed,
          // ),
          NavBarIconWidget(
            icon: FontAwesomeIcons.trophy,
            // name: 'Team',
            isCurrentView: view == ViewPage.myTabBar,
            onPressed: () => viewNotifier.state = ViewPage.myTabBar,
          ),
          NavBarIconWidget(
            icon: FontAwesomeIcons.ticket,
            // name: 'Tickets',
            isCurrentView: view == ViewPage.ticket,
            onPressed: () => viewNotifier.state = ViewPage.ticket,
          ),
          // NavBarIconWidget(
          //   icon: Icons.mail_outline,
          //   name: 'Ergebnisse',
          //   isCurrentView: view == ViewPage.table,
          //   onPressed: () => viewNotifier.state = ViewPage.table,
          // ),
          NavBarIconWidget(
            icon: Icons.shopping_cart,
            // name: 'shop',
            isCurrentView: view == ViewPage.shop,
            onPressed: () {
              if (view != ViewPage.shop) {
                ref.read(statusProvider.notifier).onLoading(
                      duration: const Duration(seconds: 2),
                    );

                viewNotifier.state = ViewPage.shop;
              }
            },
          ),
        ],
      ),
    );
  }
}
