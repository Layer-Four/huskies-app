import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:huskies_app/constants/app_theme.dart';
import 'package:huskies_app/constants/globals.dart';
import 'package:huskies_app/constants/sponsors.dart';
import 'package:huskies_app/provider/static_provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Helpers {
  const Helpers();

  static Widget buildIndicator({required int selectedIndex, required int length}) =>
      AnimatedSmoothIndicator(
        activeIndex: selectedIndex,
        count: length,
        effect: const SlideEffect(
          dotColor: Colors.grey,
          activeDotColor: Colors.black,
          dotHeight: 8,
          dotWidth: 8,
        ),
      );

  static Container buildScoreboardRow({
    required BuildContext context,
    required int place,
    required String imageSource,
    required int games,
    required int points,
    required int goals,
    required int difference,
  }) =>
      Container(
        height: 35,
        margin: const EdgeInsets.only(bottom: 1),
        decoration: BoxDecoration(
            color: place != 1 ? Colors.white : const Color.fromARGB(255, 235, 231, 231)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('$place.', style: const TextStyle(color: Colors.black)),
            SizedBox(
              height: 30,
              child: Center(child: Image.asset('assets/$imageSource', width: 20, height: 20)),
            ),
            Center(child: Text('$games', style: const TextStyle(color: Colors.black))),
            Center(child: Text('$points', style: const TextStyle(color: Colors.black))),
            Center(child: Text('$goals', style: const TextStyle(color: Colors.black))),
            Center(child: Text('$difference', style: const TextStyle(color: Colors.black))),
          ],
        ),
      );

  static Container buildTableHead({
    required BuildContext context,
    required String position,
    required String team,
    required String games,
    required String points,
    required String goals,
    required String difference,
  }) {
    return Container(
      height: 35,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 101, 132, 155),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(position, style: const TextStyle(color: Colors.white)),
          Text(team, style: const TextStyle(color: Colors.white)),
          Text(games, style: const TextStyle(color: Colors.white)),
          Text(points, style: const TextStyle(color: Colors.white)),
          Text(goals, style: const TextStyle(color: Colors.white)),
          Text(difference, style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }

  /// use this function for  [Helpers.showLoadingView()] method
  ///   + $1  the  advertising String  from sponsor
  ///   - $2 the associated asset image name
  static (String, String) getAdvertising() {
    final index = Random().nextInt(sponsors.length);
    final imageString = sponsors[index].values.first;
    final advertisingString = sponsors[index].keys.first;
    return (imageString, advertisingString);
  }

  /// ownNavigation function.
  static loadAndNavigate({
    required BuildContext context,
    required WidgetRef ref,
    required ViewPage nextView,
  }) {
    showLoadingView(context);
    Future.delayed(const Duration(milliseconds: 1500)).then((_) {
      ref.read(viewProvider.notifier).state = nextView;
    });
  }

  static Widget showLoadingView(BuildContext context, {Widget? button}) {
    final advertising = Helpers.getAdvertising();
    return Material(
      child: Container(
        padding: AppTheme.mediumPadding,
        color: Colors.white,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(color: Color.fromARGB(129, 0, 150, 135)),
            // LoadingAnimationWidget.discreteCircle(size: 70, color: AppTheme.primary),
            // const Color.fromARGB(129, 0, 150, 135), size: 70),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Image.asset('assets/${advertising.$2}', width: 100),
            ),
            Text(
              advertising.$1,
              style: const TextStyle(fontSize: 25, color: AppTheme.primary),
              textAlign: TextAlign.center,
            ),
            Padding(padding: AppTheme.bigPadding, child: button),
          ],
        ),
      ),
    );
  }
}
