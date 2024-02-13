import 'package:flutter/material.dart';
import 'package:huskies_app/constants/app_theme.dart';
import 'package:huskies_app/constants/helpers.dart';

class LoadingView extends StatelessWidget {
  final Widget? button;
  const LoadingView({super.key, this.button});

  // const Loadingview({super.key, required this.advertising, required this.image});

  @override
  Widget build(BuildContext context) {
    final advertising = Helpers.getAdvertising();
    return Material(
      child: Container(
        padding: AppTheme.paddingM,
        color: AppTheme.white,
        alignment: AppTheme.alignCenter,
        child: Column(
          mainAxisAlignment: AppTheme.mainAlignCenter,
          children: [
            Padding(
              padding: AppTheme.paddingXL,
              child: Image.asset('assets/${advertising.$2}', width: 100),
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
    );
  }
}
