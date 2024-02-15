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
        body: BackgroundWidget(
          image: 'background_image.jpg',
          body: Column(
            mainAxisAlignment: AppTheme.mainAlignCenter,
            children: [
              Padding(
                padding: AppTheme.paddingXL,
                //

                child: Image.asset(advertising.$2, width: 100),
              ),
              Container(
                height: 100,
                width: 100,
                padding: AppTheme.paddingBottom20,
                child: const CircularProgressIndicator(
                  color: AppTheme.teal,
                ),
              ),
              Text(
                advertising.$1,
                style: const TextStyle(fontSize: 25, color: AppTheme.white),
                textAlign: AppTheme.textCenter,
              ),
              Padding(padding: AppTheme.paddingXL, child: button),
            ],
          ),
        ),
      ),
    );
  }
}
