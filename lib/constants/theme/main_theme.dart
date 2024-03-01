import 'package:flutter/material.dart';

class MainTheme {
  MainTheme._();
  static ThemeData lightTheme() => ThemeData(
        cardTheme: const CardTheme(color: AppColor.white, elevation: 7),
        useMaterial3: false,
        unselectedWidgetColor: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.3),
        iconTheme: IconThemeData(color: Colors.white),
        checkboxTheme: CheckboxThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          // side: MaterialStateBorderSide.resolveWith(
          //   (states) =>
          //       BorderSide(width: 0.5, color: Colors.black.withOpacity(0.3)),
          // ),
          side: MaterialStateBorderSide.resolveWith(
            (states) {
              if (states.contains(MaterialState.selected)) {
                return BorderSide.none; // the color when checkbox is selected;
              }
              return BorderSide(
                width: 0.5,
                color: const Color(0xff000000).withOpacity(0.5),
              ); //the color when checkbox is unselected;
            },
          ),
        ),
        primaryColor: const Color.fromARGB(255, 22, 63, 92),
        primaryColorDark: const Color.fromARGB(255, 22, 63, 92),
        primaryColorLight: const Color.fromARGB(255, 22, 63, 92),
        scaffoldBackgroundColor: const Color.fromARGB(255, 239, 237, 237),
        brightness: Brightness.light,
        disabledColor: const Color.fromARGB(255, 255, 255, 255).withOpacity(0.95),
        progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: Color.fromARGB(255, 22, 63, 92),
        ),
        dividerTheme: const DividerThemeData(
          color: Colors.grey,
        ),
        tabBarTheme: const TabBarTheme(
          labelColor: Colors.black,
        ),
        textTheme: ThemeData().textTheme.apply(
              fontFamily: 'Poppins',
            ),
        listTileTheme: const ListTileThemeData(
          dense: true,
          contentPadding: EdgeInsets.all(0),
        ),
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
            TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
            TargetPlatform.macOS: FadeUpwardsPageTransitionsBuilder(),
            TargetPlatform.windows: FadeUpwardsPageTransitionsBuilder(),
            TargetPlatform.linux: FadeUpwardsPageTransitionsBuilder(),
          },
        ),
        colorScheme: const ColorScheme.light()
            .copyWith(
              primary: const Color.fromARGB(255, 22, 63, 92),
              onPrimary: Colors.white,
              secondary: const Color.fromARGB(255, 22, 63, 92),
              error: const Color.fromARGB(255, 202, 0, 37),
              surface: const Color.fromARGB(255, 22, 63, 92),
              onSurface: Colors.white,
              background: Colors.white,
              brightness: Brightness.light,
            )
            .copyWith(
              error: const Color.fromARGB(255, 211, 47, 47),
            ),
      );
  // static ThemeData lightTheme() => ThemeData.light().copyWith(
  //       unselectedWidgetColor: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.3),
  //       checkboxTheme: CheckboxThemeData(
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(12),
  //         ),
  //         // side: MaterialStateBorderSide.resolveWith(
  //         //   (states) =>
  //         //       BorderSide(width: 0.5, color: Colors.black.withOpacity(0.3)),
  //         // ),
  //         side: MaterialStateBorderSide.resolveWith(
  //           (states) {
  //             if (states.contains(MaterialState.selected)) {
  //               return BorderSide.none; // the color when checkbox is selected;
  //             }
  //             return BorderSide(
  //               width: 0.5,
  //               color: const Color(0xff000000).withOpacity(0.5),
  //             ); //the color when checkbox is unselected;
  //           },
  //         ),
  //       ),
  //       primaryColor: const Color.fromARGB(255, 22, 63, 92),
  //       primaryColorDark: const Color.fromARGB(255, 22, 63, 92),
  //       primaryColorLight: const Color.fromARGB(255, 22, 63, 92),
  //       scaffoldBackgroundColor: Colors.white,
  //       brightness: Brightness.light,
  //       disabledColor: const Color.fromARGB(255, 255, 255, 255).withOpacity(0.95),
  //       progressIndicatorTheme: const ProgressIndicatorThemeData(
  //         color: Color.fromARGB(255, 22, 63, 92),
  //       ),
  //       dividerTheme: const DividerThemeData(
  //         color: Colors.grey,
  //       ),
  //       tabBarTheme: const TabBarTheme(
  //         labelColor: Colors.black,
  //       ),
  //       textTheme: ThemeData().textTheme.apply(
  //             fontFamily: 'Poppins',
  //           ),
  //       listTileTheme: const ListTileThemeData(
  //         dense: true,
  //         contentPadding: EdgeInsets.all(0),
  //       ),
  //       pageTransitionsTheme: const PageTransitionsTheme(
  //         builders: {
  //           TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
  //           TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
  //           TargetPlatform.macOS: FadeUpwardsPageTransitionsBuilder(),
  //           TargetPlatform.windows: FadeUpwardsPageTransitionsBuilder(),
  //           TargetPlatform.linux: FadeUpwardsPageTransitionsBuilder(),
  //         },
  //       ),
  //       colorScheme: const ColorScheme.light()
  //           .copyWith(
  //             primary: const Color.fromARGB(255, 22, 63, 92),
  //             secondary: const Color.fromARGB(255, 22, 63, 92),
  //             error: const Color.fromARGB(255, 202, 0, 37),
  //             surface: Colors.white,
  //             background: Colors.white,
  //             brightness: Brightness.light,
  //           )
  //           .copyWith(
  //             error: const Color.fromARGB(255, 211, 47, 47),
  //           ),
  //     );
  // static final light = ThemeData.light().copyWith(extensions: [
  //   _lightAppColors,
  // ]);
  // static final dark = ThemeData.dark().copyWith(
  //   extensions: [_darkAppColors],
  // );

//   static final _lightAppColors = AppColorsExtension(
//     primary: const Color.fromARGB(255, 22, 63, 92),
//     onPrimary: Colors.white,
//     secondary: const Color.fromARGB(255, 101, 132, 155),
//     onSecondary: const Color.fromARGB(255, 0, 0, 0),
//     error: const Color.fromARGB(255, 211, 47, 47),
//     onError: Colors.white,
//     background: const Color.fromARGB(255, 101, 132, 155),
//     onBackground: const Color.fromARGB(255, 215, 234, 249),
//     surface: const Color.fromARGB(255, 255, 153, 0),
//     onSurface: Colors.green,
//   );

//   static final _darkAppColors = AppColorsExtension(
//     primary: const Color.fromARGB(255, 22, 63, 92),
//     onPrimary: Colors.white,
//     secondary: const Color.fromARGB(255, 101, 132, 155),
//     onSecondary: const Color.fromARGB(255, 0, 0, 0),
//     error: const Color.fromARGB(255, 211, 47, 47),
//     onError: Colors.white,
//     background: const Color.fromARGB(255, 101, 132, 155),
//     onBackground: const Color.fromARGB(255, 215, 234, 249),
//     surface: const Color.fromARGB(255, 255, 153, 0),
//     onSurface: Colors.green,
//   );
}

// extension AppThemeExetension on ThemeData {
//   AppColorsExtension get appColor => extension<AppColorsExtension>() ?? MainTheme._lightAppColors;
// }

// extension ThemGetter on BuildContext {
//   ThemeData get theme => Theme.of(this);
// }

abstract class AppColor {
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
}
