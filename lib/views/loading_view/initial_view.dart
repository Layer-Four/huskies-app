import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:huskies_app/constants/app_theme.dart';
import 'package:huskies_app/views/navigation_view/nav_layer.dart';
// import 'package:huskies_app/constants/helpers.dart';
import 'package:huskies_app/views/view_widgets/background_widget.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class InitialView extends ConsumerWidget {
  const InitialView({super.key});

  @override
  Widget build(BuildContext context, ref) {
    Future.delayed(const Duration(seconds: 3)).then(
      (value) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const ViewNavigator(),
          ),
        );
      },
    );
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
            Container(
              height: 80,
              width: 80,
              padding: AppTheme.paddingBottom20,
              child: LoadingAnimationWidget.inkDrop(
                color: Color.fromARGB(194, 255, 255, 255),
                size: 50,
              ),
            ),
            Spacer(),
            Text(
              'Powerd by',
              style: TextStyle(color: Colors.white, fontSize: 13),
            ),
            Container(
              child: Image.asset('assets/images/Bild.png'),
              width: 180,
            )
          ],
        ),
      ),
    );
  }
}
