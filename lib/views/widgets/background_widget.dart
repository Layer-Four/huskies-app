import 'package:flutter/material.dart';
import 'package:huskies_app/constants/app_theme.dart';

class BackgroundWidget extends StatelessWidget {
  final Widget body;
  final String image;

  const BackgroundWidget({super.key, required this.body, required this.image});

  @override
  Widget build(BuildContext context) {
    return Stack(fit: StackFit.expand, children: [
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/$image'),
            fit: BoxFit.cover,
          ),
        ),
      ),
      Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(142, 73, 68, 68),
        ),
        padding: AppTheme.bigPadding,
        child: body,
      )
    ]);
  }
}
