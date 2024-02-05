import 'package:flutter/material.dart';

class BlueButton extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  final Color color;
  final EdgeInsets padding;
  const BlueButton({
    super.key,
    this.onPressed,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
            padding: const EdgeInsets.all(8.0),
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white, fontSize: 10),
            ),
          ),
        ),
      ),
    );
  }
}
