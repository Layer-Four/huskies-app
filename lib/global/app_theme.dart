import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color.fromARGB(255, 101, 132, 155);
  static const TextStyle titleStyle = TextStyle(fontWeight: FontWeight.bold, fontSize: 25);
  static const TextStyle headStyle = TextStyle(fontWeight: FontWeight.bold, fontSize: 19);
  static const double smallTextSize = 9.5;
  static const FontWeight headWeight = FontWeight.w700;
  static const Color whiteBackground = Colors.white;
  static const double cardElevation = 7.0;
  static final BorderRadius lowRoundedCorner = BorderRadius.circular(8);
  static const EdgeInsets bigPadding = EdgeInsets.all(16);
  static const EdgeInsets mediumPadding = EdgeInsets.all(8.0);
  static const EdgeInsets smallPadding = EdgeInsets.all(6.0);
  static const double mediumDistance = 12;
  static const double largeDistance = 18;
  static const double lowDistance = 6;
  static const double avatarSize = 50.0;
  static const Color buttonBackgroundColor = Color.fromARGB(255, 39, 62, 73);
  static const EdgeInsets buttonPadding = EdgeInsets.symmetric(horizontal: 6, vertical: 6);
  static const TextStyle whiteTextStyle = TextStyle(color: Colors.white);
  static const EdgeInsets defaultHorizontalDistance = EdgeInsets.symmetric(horizontal: 15);
  static const EdgeInsets popUpMargin = EdgeInsets.symmetric(horizontal: 40, vertical: 100);
  static const Color cardHighlightedColor = Color.fromARGB(255, 215, 234, 249);
  static final InputDecoration textInputDecoration = InputDecoration(
    contentPadding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
    filled: true,
    fillColor: Colors.grey[200],
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Colors.transparent),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Colors.grey),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Colors.transparent),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Colors.transparent),
    ),
  );
}
