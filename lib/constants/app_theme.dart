import 'package:flutter/material.dart';

class AppTheme {
  //  Colors
  static const Color green = Colors.green;
  static const Color white = Color.fromARGB(255, 255, 255, 255);
  static const Color black = Color.fromARGB(255, 0, 0, 0);
  static const Color red = Color.fromARGB(255, 211, 47, 47);
  static const Color blueAccent = Color.fromARGB(255, 68, 136, 255);
  static const Color blueGrey = Color.fromARGB(255, 96, 125, 139);
  static const Color grey = Color.fromARGB(255, 158, 158, 158);
  static const Color teal = Color.fromARGB(255, 0, 150, 136);
  static const Color white70 = Color.fromARGB(180, 255, 255, 255);
  static const Color orange = Color.fromARGB(255, 255, 153, 0);
  static const Color ticketBackground = Color.fromARGB(255, 215, 234, 249);
  static const Color huskiesPuzzle = Color.fromARGB(255, 168, 199, 224);
  static const Color primary = Color.fromARGB(255, 22, 63, 92);
  static const Color containerBlack = Color.fromARGB(129, 0, 0, 0);
  static const Color highlightedBackground = Color.fromARGB(255, 101, 132, 155);
  static const Color buttonBackgroundColor = Color.fromARGB(255, 39, 62, 73);
  static const Color transparent = Color.fromARGB(0, 0, 0, 0);
  static const Color ticketViewBody = Color.fromARGB(255, 155, 151, 151);
  static const Color fakeHomeViewColor = Color.fromARGB(255, 187, 219, 235);
  static const Color cardHighlightedColor = Color.fromARGB(255, 215, 234, 249);
  // numbers
  static const double xtraSmall = 6;
  static const double small = 8;
  static const double elevetion = 7.0;
  static const double smallTextSize = 9.5;
  static const double medium = 12;
  static const double medLarge = 16;
  static const double large = 18;
  static const double xLarge = 20;
  static const double big50 = 50.0;
  // Padding/Margin
  static const EdgeInsets regtangelCard =
      EdgeInsets.symmetric(horizontal: 70, vertical: 270);
  static const EdgeInsets paddingTb12_20 = EdgeInsets.only(top: 12, bottom: 20);
  static const EdgeInsets paddingTb8_16 = EdgeInsets.only(top: 8, bottom: 16);
  static const EdgeInsets paddingTopSmall = EdgeInsets.only(top: 8);
  static const EdgeInsets paddingTopMedium = EdgeInsets.only(top: 20);
  static const EdgeInsets paddingBottom20 = EdgeInsets.only(bottom: 20);
  static const EdgeInsets paddingXL = EdgeInsets.all(20);
  static const EdgeInsets paddingL = EdgeInsets.all(16);
  static const EdgeInsets paddingM = EdgeInsets.all(8);
  static const EdgeInsets paddingS = EdgeInsets.all(6);
  static const EdgeInsets padding8_4 =
      EdgeInsets.symmetric(horizontal: 8, vertical: 4);
  static const EdgeInsets padding12_8 =
      EdgeInsets.symmetric(horizontal: 12, vertical: 8);
  static const EdgeInsets padding40_6 =
      EdgeInsets.symmetric(horizontal: 40, vertical: 6);
  static const EdgeInsets paddinVerticalSmall =
      EdgeInsets.symmetric(vertical: 8);
  static const EdgeInsets padding16_0 = EdgeInsets.symmetric(horizontal: 16);
  static const EdgeInsets padding0_16 = EdgeInsets.symmetric(vertical: 16);
  static const EdgeInsets padding0_30 = EdgeInsets.symmetric(vertical: 30);
  static const EdgeInsets padding40_100 =
      EdgeInsets.symmetric(horizontal: 40, vertical: 100);
  static const SizedBox mediumPlaceholder = SizedBox(height: 12);
  static const SizedBox bigPlaceholder = SizedBox(height: 40);
  // TextStyles
  static const TextStyle titleWhite = TextStyle(fontSize: 25, color: white);
  static const TextStyle titleBlue = TextStyle(fontSize: 25, color: primary);
  static const TextStyle titleBlack =
      TextStyle(fontWeight: FontWeight.w500, fontSize: 25);
  static const TextStyle whiteDefaultText =
      TextStyle(fontSize: 16, color: Colors.white);
  static const TextStyle textDefaultGrey =
      TextStyle(fontSize: 16, color: Colors.grey);
  static const TextStyle textDefaultTeal =
      TextStyle(fontSize: 16, color: Colors.teal);
  static const TextStyle defaultText = TextStyle(fontSize: 16);
  static const TextStyle textDefaultBlue =
      TextStyle(fontSize: 16, color: primary);
  static const TextStyle textWhiteMid =
      TextStyle(fontSize: 13, color: Colors.white);
  static const TextStyle defaultTextSmallRed =
      TextStyle(fontSize: 13, color: Colors.red);
  static const TextStyle textMedium = TextStyle(fontSize: 13);
  static const TextStyle textSmallWhite = TextStyle(color: white, fontSize: 10);
  static const TextStyle textSmallGrey =
      TextStyle(color: Colors.grey, fontSize: 10);
  static const TextStyle smallText = TextStyle(fontSize: 9);
  static const TextStyle largBoldText =
      TextStyle(fontSize: 19, fontWeight: FontWeight.bold);
  static const TextStyle textDefaultRed =
      TextStyle(fontSize: 16, color: Colors.red);
  static const TextStyle whiteBoldText =
      TextStyle(fontWeight: FontWeight.bold, color: Colors.white);
  static const redBoldTextStyle =
      TextStyle(color: red, fontWeight: FontWeight.bold, fontSize: 17);
  // Orientation
  static const Alignment alignCenter = Alignment.center;
  static const CrossAxisAlignment crossAlignStart = CrossAxisAlignment.start;
  static const MainAxisAlignment mainAlignEvenly =
      MainAxisAlignment.spaceEvenly;
  static const MainAxisAlignment mainAlignBetween =
      MainAxisAlignment.spaceBetween;
  static const MainAxisAlignment mainAlignAround =
      MainAxisAlignment.spaceAround;
  static const MainAxisAlignment mainAlignCenter = MainAxisAlignment.center;
  static const MainAxisAlignment mainAlignStart = MainAxisAlignment.start;
  static const TextAlign textCenter = TextAlign.center;

// Borders
  static final BorderRadius lowRoundedCorner = BorderRadius.circular(8);
  static final BorderRadius defaultM = BorderRadius.circular(12);
  static final Decoration whiteBox =
      BoxDecoration(color: white, borderRadius: defaultM);

  static final Decoration pointsBoxLayout =
      BoxDecoration(borderRadius: BorderRadius.circular(50), boxShadow: const [
    BoxShadow(color: Color.fromARGB(255, 241, 237, 237), spreadRadius: 7),
  ]);

  static final Opacity puzzleHuskiesImg = Opacity(
      opacity: 0.2,
      child: Image.asset(
        'assets/puzzle_huskies.png',
        fit: BoxFit.cover,
        width: double.infinity,
      ));
  static final Opacity backgroundImageHomePage = Opacity(
      opacity: 0.7,
      child: Image.asset(
        'assets/images/background_image.jpg',
        // "assets/images/background_image.jpg",
        fit: BoxFit.cover,
        alignment: Alignment.topCenter,
        width: double.infinity,
      ));
  static final InputDecoration textInputDecoration = InputDecoration(
    contentPadding: const EdgeInsets.symmetric(vertical: 2, horizontal: 12),
    filled: true,
    fillColor: Colors.grey[200],
    border: OutlineInputBorder(
      borderRadius: defaultM,
      borderSide: const BorderSide(color: transparent),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: defaultM,
      borderSide: const BorderSide(color: grey),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: defaultM,
      borderSide: const BorderSide(color: transparent),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: defaultM,
      borderSide: const BorderSide(color: transparent),
    ),
  );
}
