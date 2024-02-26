import 'package:flutter/material.dart';
import 'package:huskies_app/constants/app_theme.dart';

class BlueTextButton extends StatelessWidget {
  const BlueTextButton(
      {super.key, required this.onPressed, required this.title});

  final Widget title;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: AppTheme.padding12_8,
      decoration: BoxDecoration(
        color: AppTheme.primary,
        borderRadius: BorderRadius.circular(6),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: title,
      ),
    );
  }
}
