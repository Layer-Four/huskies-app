import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:huskies_app/constants/app_theme.dart';
import 'package:huskies_app/provider/static_provider.dart';
import 'package:huskies_app/views/widgets/background_widget.dart';
import 'package:huskies_app/views/widgets/blue_button_widget.dart';

class ShowErrorScreen extends ConsumerWidget {
  final String error;

  const ShowErrorScreen({super.key, required this.error});

  @override
  Widget build(BuildContext context, ref) {
    return BackgroundWidget(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: AppTheme.bigPadding,
              child: Text(error, textAlign: TextAlign.center),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                BlueButton(
                  color: Colors.blue,
                  text: 'Geh zurück',
                  onPressed: () => ref.read(statusProvider.notifier).reRouteToLogin(),
                ),
                const BlueButton(
                  color: Colors.red,
                  text: 'Geh Weiter',
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
              ],
            )
          ],
        ),
        image: 'background_image.jpg');
  }
}
