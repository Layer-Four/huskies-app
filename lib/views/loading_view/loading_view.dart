import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:huskies_app/constants/app_theme.dart';
// import 'package:huskies_app/constants/helpers.dart';
import 'package:huskies_app/views/view_widgets/background_widget.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadingView extends ConsumerWidget {
  final Widget? button;
  const LoadingView({super.key, this.button});

  @override
  Widget build(BuildContext context, ref) {
    // final advertising = Helpers.getAdvertising();
    return Scaffold(
      body: BackgroundWidget(
        imageName: 'background_image.jpg',
        body: Column(
          mainAxisAlignment: AppTheme.mainAlignCenter,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 60, bottom: 50),
              child: Image.asset('assets/images/huskies.png', width: 180),
            ),
            Padding(
              padding: AppTheme.paddingXL,
              child: Image.asset('assets/images/l_s.png', width: 150),
            ),
            // Text(
            //   advertising.$1,
            //   style: const TextStyle(fontSize: 25, color: AppTheme.white),
            //   textAlign: AppTheme.textCenter,
            // ),
            Padding(padding: AppTheme.paddingXL, child: button),
            Container(
              height: 80,
              width: 80,
              padding: AppTheme.paddingBottom20,
              child: LoadingAnimationWidget.inkDrop(
                color: const Color.fromARGB(194, 255, 255, 255),
                size: 50,
              ),
            ),
            const Spacer(),
            const Text(
              'Powerd by',
              style: TextStyle(color: Colors.white, fontSize: 13),
            ),
            SizedBox(
              width: 180,
              child: Image.asset('assets/images/Bild.png'),
            )
          ],
        ),
      ),
    );
  }
}
