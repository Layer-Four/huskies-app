import 'package:flutter/material.dart';
import 'package:huskies_app/constants/app_theme.dart';

class ColoredButton extends StatelessWidget {
  const ColoredButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.textColor = AppTheme.white,
    required this.buttonColor,
  });
  final Color textColor;
  final Color buttonColor;
  final Widget title;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: AppTheme.padding12_8,
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.circular(6),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: title,
      ),
    );
  }
}
