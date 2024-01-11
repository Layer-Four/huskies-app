import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:huskies_app/gui/views/widgets/navigation/navbar_widget.dart';
import 'package:huskies_app/logic/globals.dart';
import 'package:huskies_app/logic/helper/helpers.dart';

class ViewNavigator extends ConsumerWidget {
  const ViewNavigator({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(provider);
    final notifier = ref.read(provider.notifier);
    return SafeArea(
      child: Scaffold(
        body: switch (state.currentView) {
          1 => state.view[1],
          2 => state.view[2],
          3 => state.view[3],
          4 => state.view[4],
          _ => state.view.first
        },
        bottomNavigationBar: NavigationBar(
          height: MediaQuery.of(context).size.height / 10,
          backgroundColor: const Color.fromARGB(255, 101, 132, 155),
          destinations: [
            NavBarIconWidget(
              icon: Icons.home_outlined,
              name: 'Home',
              isCurrentView: state.currentView == 0,
              onPressed: () => notifier.changeView(nextView: 0),
            ),
            NavBarIconWidget(
                icon: Icons.bookmark_border_outlined,
                name: 'Tickets-Match',
                isCurrentView: state.currentView == 1,
                onPressed: () => notifier.changeView(nextView: 1)),
            NavBarIconWidget(
                icon: Icons.bookmark_border_outlined,
                name: 'Tickets-View',
                isCurrentView: state.currentView == 2,
                onPressed: () => notifier.changeView(nextView: 2)),
            NavBarIconWidget(
                icon: Icons.mail_outline,
                name: 'Ergebnisse',
                isCurrentView: state.currentView == 3,
                onPressed: () => notifier.changeView(nextView: 3)),
            NavBarIconWidget(
              icon: Icons.card_giftcard,
              name: 'shop',
              isCurrentView: state.currentView == 4,
              onPressed: () => Helpers.loadAndNavigate(
                  context: context,
                  ref: ref,
                  nextView: 4,
                  advertising: 'Hier könnte Ihre Werbung stehen',
                  image: 'huskies.png'),
            ),
          ],
        ),
      ),
    );
  }
}
