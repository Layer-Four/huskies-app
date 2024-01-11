import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:huskies_app/gui/views/ticket_views/ticket_shop_view.dart';
import 'package:huskies_app/gui/views/widgets/headline_widget.dart';
import 'package:huskies_app/gui/views/widgets/user_icon_widget.dart';
import 'package:huskies_app/logic/helper/app_theme.dart';

class TicketView extends ConsumerWidget {
  const TicketView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List gamesInSeason = List.generate(8, (index) => index++);
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      child: Column(
        children: [
          const HeadWidget(
            title: Text('Tickets', style: AppTheme.headStyle),
            end: UserIconWidget(image: 'da.jpg'),
          ),
          const Padding(padding: EdgeInsets.all(20)),
          SizedBox(
            height: 500,
            child: ListView.builder(
              itemCount: gamesInSeason.length,
              itemBuilder: ((context, index) {
                Color backgroundColor = Colors.white;
                if (index.isEven) {
                  backgroundColor = const Color.fromARGB(255, 215, 234, 249);
                }
                return TicketitemRowWidget(
                    image: 'assets/fuechse.jpg',
                    backgroundColor: backgroundColor,
                    gameDate: 'Freitag, 01.03.24 19:30 Uhr');
              }),
            ),
          ),
        ],
      ),
    );
  }
}
