import 'package:flutter/material.dart';
import 'package:huskies_app/constants/app_theme.dart';

class BackgroundWidget extends StatelessWidget {
  final Widget body;
  final String imageName;

  const BackgroundWidget({super.key, required this.body, required this.imageName});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/$imageName'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          height: double.infinity,
          decoration: const BoxDecoration(
            color: Color.fromARGB(150, 66, 64, 64),
          ),
          padding: AppTheme.paddingBottom20,
          child: body,
        )
      ],
    );
  }
}
