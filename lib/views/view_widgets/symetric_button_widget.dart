import 'package:flutter/material.dart';
import 'package:huskies_app/constants/app_theme.dart';

class SymmetricButton extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  final Color color;
  final EdgeInsets padding;
  final TextStyle style;
  const SymmetricButton({
    super.key,
    this.onPressed,
    this.padding = AppTheme.padding12_8,
    this.style = AppTheme.textWhiteMid,
    required this.color,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 7,
      color: color,
      borderRadius: BorderRadius.circular(7),
      type: MaterialType.card,
      child: InkWell(
        onTap: onPressed,
        child: Center(
          widthFactor: 1.5,
          heightFactor: 1.2,
          child: Padding(
            padding: padding,
            child: Text(
              text,
              textAlign: AppTheme.textCenter,
              style: style,
            ),
          ),
        ),
      ),
    );
  }
}
