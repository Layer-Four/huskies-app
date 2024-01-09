import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:huskies_app/gui/views/match_statisctics_view.dart';
import 'package:huskies_app/gui/views/widgets/shop_widgets/products_view.dart';
import 'package:huskies_app/gui/views/home_view.dart';
import 'package:huskies_app/gui/views/ticket_views/ticket_main_view.dart';
import 'package:huskies_app/gui/views/widgets/navbar_widget.dart';
import 'package:huskies_app/main.dart';

class ViewNavigator extends ConsumerWidget {
  const ViewNavigator({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(provider);
    final provFunc = ref.read(provider.notifier);
    return Scaffold(
      body: switch (state.currentView) {
        1 => TicketView(),
        2 => MatchStatisticsView(),
        3 => ProductsView(),
        _ => HomeView()
      },
      bottomNavigationBar: NavigationBar(
        height: MediaQuery.of(context).size.height / 7.8,
        backgroundColor: const Color.fromARGB(255, 101, 132, 155),
        destinations: [
          NavBarIconWidget(
            icon: Icons.home_outlined,
            name: 'Home',
            isCurrentView: state.currentView == 0,
            onPressed: () => provFunc.changeView(nextView: 0),
            // () => setState(() => currentViewIndex = 0),
            // loadAndNavigate(
            //   nextView: 0,
            //   adversiting: const Text('Hallo Herzlich Willkomen'),
            // ),
          ),
          NavBarIconWidget(
              icon: Icons.bookmark_border_outlined,
              name: 'Tickets',
              isCurrentView: state.currentView == 1,
              onPressed: () => provFunc.changeView(nextView: 1)
              // () => setState(() => currentViewIndex = 1),
              // loadAndNavigate(
              //   nextView: 1,
              //   adversiting: const Text('Hier Könnte Deine Werbung stehen'),
              // ),
              ),
          NavBarIconWidget(
              icon: Icons.mail_outline,
              name: 'Ergebnisse',
              isCurrentView: state.currentView == 2,
              onPressed: () => provFunc.changeView(nextView: 2)
              //  () => setState(() => currentViewIndex = 2),
              // loadAndNavigate(
              //   nextView: 2,
              //   adversiting: const Text('Eine weitere Werbung'),
              // ),
              ),
          NavBarIconWidget(
              icon: Icons.card_giftcard,
              name: 'shop',
              isCurrentView: state.currentView == 3,
              onPressed: () => provFunc.changeView(nextView: 3)
              //  loadAndNavigate(
              //   context,
              //   nextView: 3,
              //   adversiting: SizedBox(
              //     height: 250,
              //     child: Column(
              //       children: [
              //         Image.asset(
              //           'assets/profile.jpg',
              //         ),
              //         Padding(
              //           padding: const EdgeInsets.all(8.0),
              //           child: Text('Hier könnte eine andere Werbung stehen'),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              ),
        ],
      ),
    );
  }

  /// ownNavigtion function.
  // void loadAndNavigate(context, {required int nextView, required Widget adversiting}) {
  //   showDialog(
  //     context: context,
  //     builder: (context) => Container(
  //         color: Colors.white,
  //         alignment: Alignment.center,
  //         child: Column(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: [
  //             Padding(padding: EdgeInsets.all(20)),
  //             LoadingAnimationWidget.discreteCircle(color: Colors.teal, size: 50),
  //             // TODO: Initialize a Loading circle
  //             Padding(
  //               padding: const EdgeInsets.all(28.0),
  //               child: adversiting,
  //             ),
  //           ],
  //         )),
  //   );
  //   Future.delayed(const Duration(milliseconds: 1500)).then((_) {
  //     Navigator.pop(context);
  //     provider.changeView(nextView: nextView);
  //   });
  // }
}
