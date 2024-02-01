import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:huskies_app/constants/app_theme.dart';
import 'package:huskies_app/constants/helpers.dart';
import 'package:huskies_app/provider/static_provider.dart';
import 'package:huskies_app/views/widgets/background_widget.dart';

class WaitForRegistry extends ConsumerWidget {
  const WaitForRegistry({super.key});

  @override
  Widget build(BuildContext context, ref) {
    Future.delayed(const Duration(seconds: 30))
        .then((_) => ref.read(statusProvider.notifier).signOut());
    double? circuleSize = MediaQuery.of(context).size.height / 7;
    final adversiting = Helpers.getAdvertising();

    const localTextStyle =
        TextStyle(fontSize: 21, color: Colors.white, decoration: TextDecoration.none);
    return BackgroundWidget(
      image: 'background_image.jpg',
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(45),
            ),
            child: Image.asset(
              'assets/${adversiting.$2}',
              width: MediaQuery.of(context).size.width / 1.7,
            ),
          ),
          Text(adversiting.$1, textAlign: TextAlign.center, style: localTextStyle),
          const Card(
            color: Color.fromARGB(210, 79, 74, 74),
            child: Padding(
              padding: AppTheme.buttonPadding,
              child: Text(
                'Bitte schließe zuerst deine Registrirung ab. \nKontrolliere dein \nEmail und Spam Postfach!',
                textAlign: TextAlign.center,
                style: localTextStyle,
              ),
            ),
          ),
          SizedBox(
            height: circuleSize,
            width: circuleSize,
            child: const CircularProgressIndicator(
              strokeWidth: 6,
              color: AppTheme.cardHighlightedColor,
            ),
          ),
        ],
      ),
    );
  }
}
