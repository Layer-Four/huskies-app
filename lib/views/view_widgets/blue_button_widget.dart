import 'package:flutter/material.dart';
import 'package:huskies_app/constants/app_theme.dart';

class SymetricButton extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  final Color color;
  final EdgeInsets padding;
  const SymetricButton({
    super.key,
    this.onPressed,
    this.padding = AppTheme.boxPadding,
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
            padding: AppTheme.paddingM,
            child: Text(
              text,
              textAlign: AppTheme.textCenter,
              style: const TextStyle(color: AppTheme.white, fontSize: 10),
            ),
          ),
        ),
      ),
    );
  }
}
