import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:huskies_app/constants/app_theme.dart';
import 'package:huskies_app/constants/helpers.dart';
import 'package:huskies_app/provider/static_provider.dart';
import 'package:huskies_app/views/view_widgets/background_widget.dart';

class WaitForRegistry extends ConsumerWidget {
  const WaitForRegistry({super.key});

  @override
  Widget build(BuildContext context, ref) {
    Future.delayed(const Duration(seconds: 30))
        .then((_) => ref.read(statusProvider.notifier).signOut());
    double? circuleSize = MediaQuery.of(context).size.height / 7;
    final adversiting = Helpers.getAdvertising();

    const localTextStyle = TextStyle(
        fontSize: 21, color: AppTheme.white, decoration: TextDecoration.none);
    return SafeArea(
      child: Scaffold(
        body: BackgroundWidget(
          imageName: 'background_image.jpg',
          body: Column(
            mainAxisAlignment: AppTheme.mainAlignEvenly,
            children: [
              Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(45),
                ),
                child: Image.asset(
                  adversiting.$2,
                  width: MediaQuery.of(context).size.width / 1.7,
                  height: MediaQuery.of(context).size.width / 1.7,
                ),
              ),
              Text(adversiting.$1,
                  textAlign: AppTheme.textCenter, style: AppTheme.titleWhite),
              const Card(
                color: AppTheme.buttonBackgroundColor,
                child: Padding(
                  padding: AppTheme.paddingBottom20,
                  child: Text(
                    'Bitte schließe zuerst deine Registrierung ab. \nKontrolliere dein \nEmail und Spam Postfach!',
                    textAlign: AppTheme.textCenter,
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
        ),
      ),
    );
  }
}
