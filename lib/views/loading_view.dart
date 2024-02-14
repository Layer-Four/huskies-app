import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:huskies_app/constants/app_theme.dart';
import 'package:huskies_app/constants/helpers.dart';
import 'package:huskies_app/views/view_widgets/background_widget.dart';

class LoadingView extends ConsumerWidget {
  final Widget? button;
  const LoadingView({super.key, this.button});

  @override
  Widget build(BuildContext context, ref) {
    final advertising = Helpers.getAdvertising();
    return SafeArea(
      child: Scaffold(
        body: Material(
          child: BackgroundWidget(
            image: 'profile.jpg',
            body: Container(
              padding: AppTheme.paddingM,
              color: AppTheme.white,
              alignment: AppTheme.alignCenter,
              child: Column(
                mainAxisAlignment: AppTheme.mainAlignCenter,
                children: [
                  Padding(
                    padding: AppTheme.paddingXL,
                    // advertising.$2

                    child: Image.asset('assets/images/da.jpg', width: 100),
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    padding: AppTheme.hugePaddingBottom,
                    child: const CircularProgressIndicator(
                      color: Color.fromARGB(129, 0, 150, 135),
                    ),
                  ),
                  Text(
                    advertising.$1,
                    style: const TextStyle(fontSize: 25, color: AppTheme.primary),
                    textAlign: AppTheme.textCenter,
                  ),
                  Padding(padding: AppTheme.paddingXL, child: button),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
