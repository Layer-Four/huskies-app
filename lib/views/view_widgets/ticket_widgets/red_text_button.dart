import 'package:flutter/material.dart';
import 'package:huskies_app/constants/app_theme.dart';

class RedTextButton extends StatelessWidget {
  const RedTextButton({super.key, required this.onPressed, required this.title});

  final String title;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
        decoration: BoxDecoration(color: AppTheme.red, borderRadius: BorderRadius.circular(6)),
        child: Text(
          title,
          style: const TextStyle(color: Colors.white, fontSize: 12),
        ),
      ),
    );
  }
}
