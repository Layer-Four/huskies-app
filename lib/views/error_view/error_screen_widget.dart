import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:huskies_app/constants/app_theme.dart';
import 'package:huskies_app/provider/static_provider.dart';
import 'package:huskies_app/views/view_widgets/background_widget.dart';
import 'package:huskies_app/views/view_widgets/blue_button_widget.dart';

class ShowErrorScreen extends ConsumerWidget {
  final String error;

  const ShowErrorScreen({super.key, required this.error});

  @override
  Widget build(BuildContext context, ref) {
    return BackgroundWidget(
        body: Column(
          mainAxisAlignment: AppTheme.mainAlignCenter,
          children: [
            Container(
              padding: AppTheme.paddingXL,
              child: Text(error,
                  style: const TextStyle(fontSize: 25, color: Colors.yellow),
                  textAlign: AppTheme.textCenter),
            ),
            Row(
              mainAxisAlignment: AppTheme.mainAlignEvenly,
              children: [
                SymetricButton(
                  color: Colors.blue,
                  text: 'Geh zurück',
                  onPressed: () => ref.read(statusProvider.notifier).reRouteToLogin(),
                ),
                const SymetricButton(
                  color: AppTheme.red,
                  text: 'Geh Weiter',
                  padding: AppTheme.boxPadding,
                ),
              ],
            )
          ],
        ),
        image: 'background_image.jpg');
  }
}
