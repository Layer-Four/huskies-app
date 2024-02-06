// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:huskies_app/gui/views/auth/login_view.dart';
import 'package:huskies_app/logic/helper/app_theme.dart';
import 'package:huskies_app/logic/helper/helpers.dart';
import 'package:huskies_app/logic/provider/notifier.dart';
import 'package:flutter/cupertino.dart';

class UserProfileView extends ConsumerStatefulWidget {
  const UserProfileView({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UserProfileViewState();
}

class _UserProfileViewState extends ConsumerState<UserProfileView> {
  bool darkMode = false;
  bool faceID = true;
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(appStateNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        centerTitle: true,
        titleTextStyle: TextStyle(letterSpacing: 1, fontWeight: FontWeight.w600, fontSize: 25, color: AppTheme.black),
        title: Text('Mein Profil'),
      ),
      body: Container(
        height: 650,
        width: double.infinity,
        padding: AppTheme.defaultVerticalDistance,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: AppTheme.mainEvenly,
          children: [
            Card(
              elevation: 7,
              semanticContainer: false,
              margin: AppTheme.defaultHorizontalDistance,
              child: Container(
                decoration: AppTheme.whiteBox,
                child: Row(
                  mainAxisAlignment: AppTheme.mainEvenly,
                  children: [
                    Container(
                      margin: AppTheme.defaultVerticalDistanceL,
                      decoration: const BoxDecoration(shape: BoxShape.circle),
                      clipBehavior: Clip.antiAlias,
                      child: Image.asset('assets/da.jpg', height: 80, width: 80),
                    ),
                    Column(
                      children: [
                        Text(
                          '${state.user?.firstName ?? ' Username'} ${state.user?.name ?? ''}',
                          style: AppTheme.textDefaultBlack,
                        ),
                        Text(
                          state.user?.email ?? 'beispiel@email.etc',
                          style: AppTheme.textDefaultSmall10Grey,
                        ),
                        Text(
                          'Kundennummer: ${state.user?.uID ?? 'KH234332'}',
                          style: AppTheme.textDefaultSmall10Grey,
                        ),
                        Container(
                          alignment: Alignment.topCenter,
                          height: 28,
                          margin: AppTheme.paddingS,
                          decoration: AppTheme.homePageButton,
                          child: TextButton(
                            child: Container(
                              alignment: AppTheme.alignCenter,
                              child: Text(
                                'Profil bearbeiten',
                                textAlign: AppTheme.textCenter,
                                style: AppTheme.textDefaultSmall10,
                              ),
                            ),
                            onPressed: () {
                              Helpers.showLoadingView(context, advertising: 'Profil bearbeiten');
                              Future.delayed(const Duration(seconds: 2))
                                  .then((value) => Navigator.of(context).pop());
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: AppTheme.defaultHorizontalDistance,
              width: double.infinity,
              child: const Text(
                'Einstellungen',
                style: AppTheme.textDefaultGrey,
              ),
            ),
            Card(
              margin: AppTheme.defaultHorizontalDistance,
              elevation: 7,
              child: Container(
                decoration: AppTheme.whiteBox,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: AppTheme.mainEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: AppTheme.mainBetween,
                      children: [
                        SettingsRow(
                          endingWidget: const Text(
                            'Deutsch',
                            style: AppTheme.textDefaultGrey,
                          ),
                          leadingIcon: Icon(Icons.flag_outlined),
                          optionText: 'Sprache',
                          optionTextStyle: AppTheme.textDefaultBlack,
                        ),
                        SettingsRow(
                            /*child: Switch(
                              activeColor: Colors.white,
                              activeTrackColor: Colors.black,
                              inactiveTrackColor: Colors.black,
                              inactiveThumbColor: Colors.white,
                              materialTapTargetSize: MaterialTapTargetSize.padded,
                              value: darkMode,
                              onChanged: (_) => setState(() {
                                darkMode = !darkMode;
                              }),
                            ),*/
                          optionText: 'Dark-mode',
                          optionTextStyle: AppTheme.textDefaultBlack,
                          leadingIcon: Icon(Icons.dark_mode_outlined),
                          switchValue: darkMode,
                          onSwitchChanged: (value) => setState(() => darkMode = value),
                        ),
                        SettingsRow(
                          /*endIcon: Switch(
                            activeColor: Colors.white,
                            activeTrackColor: Colors.black,
                            inactiveTrackColor: Colors.black,
                            inactiveThumbColor: Colors.white,
                            value: faceID,
                            onChanged: (_) => setState(() {
                              faceID = !faceID;
                            }),
                          ),*/
                          optionText: 'Face ID',
                          optionTextStyle: AppTheme.textDefaultBlack,
                          leadingIcon: Icon(Icons.face_5_outlined),
                          switchValue: faceID,
                          onSwitchChanged: (value) => setState(() => faceID = value),
                        ),
                        SettingsRow(
                          leadingIcon: Icon(Icons.notifications_outlined),
                          optionText: 'Push-Benachritigungen',
                          optionTextStyle: AppTheme.textDefaultBlack,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Card(
              elevation: 7,
              margin: AppTheme.defaultHorizontalDistance,
              child: Container(
                decoration: AppTheme.whiteBox,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: AppTheme.mainEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: AppTheme.mainBetween,
                      children: [
                        SettingsRow(
                          leadingIcon: Icon(
                            Icons.contact_support_sharp,
                          ),
                          optionText: 'Support',
                          optionTextStyle: AppTheme.textDefaultBlack,
                        ),
                        SettingsRow(
                          optionText: 'Zahlungsmittel',
                          optionTextStyle: AppTheme.textDefaultBlack,
                          leadingIcon: Icon(Icons.euro),
                        ),
                        SettingsRow(
                          endIcon: SizedBox(),
                          leadingIcon: Icon(Icons.exit_to_app),
                          onTextPressed: () {
                            ref.watch(appStateNotifierProvider.notifier).signOut();
                            Navigator.of(context).pop();
                            Navigator.of(context).pushReplacement(MaterialPageRoute(
                              builder: (context) => LoginView(),
                            ));
                          },
                          optionText: 'logout',
                          optionTextStyle: AppTheme.textDefaultBlack,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SettingsRow extends StatelessWidget {
  final Widget leadingIcon;
  final void Function()? onTextPressed;
  final String optionText;
  final TextStyle optionTextStyle;
  final Widget? endingWidget;
  final Widget endIcon;
  final bool? switchValue; // Make switchValue nullable
  final ValueChanged<bool>? onSwitchChanged; // Make onSwitchChanged nullable

  const SettingsRow({
    super.key,
    this.endIcon = const Icon(Icons.arrow_right, size: 40),
    this.endingWidget,
    required this.leadingIcon,
    this.onTextPressed,
    required this.optionText,
    required this.optionTextStyle,
    this.switchValue, // Nullable switchValue
    this.onSwitchChanged, // Nullable onSwitchChanged
  });

  @override
  Widget build(BuildContext context) => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      InkWell(
        onTap: onTextPressed,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: leadingIcon,
            ),
            Text(optionText, style: optionTextStyle),
          ],
        ),
      ),
      Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(padding: const EdgeInsets.symmetric(horizontal: 4), child: endingWidget),
          if (switchValue != null && onSwitchChanged != null) // Render switch only if both are provided
            Padding(
              padding: const EdgeInsets.only(right: 24),
              child: CupertinoSwitch(
                activeColor: AppTheme.black,
                thumbColor: AppTheme.white,
                trackColor: AppTheme.black,
                value: switchValue!,
                onChanged: onSwitchChanged,
              ),
            ),
          if (endIcon != null && (switchValue == null || onSwitchChanged == null))
            Padding(
              padding: const EdgeInsets.only(right: 24),
              child: endIcon!,
            ),
        ],
      ),
    ],
  );
}

class CupertinoSwitchApp extends StatelessWidget {
  const CupertinoSwitchApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      theme: CupertinoThemeData(brightness: Brightness.light),
      home: CupertinoSwitchExample(),
    );
  }
}

class CupertinoSwitchExample extends StatefulWidget {
  const CupertinoSwitchExample({super.key});

  @override
  State<CupertinoSwitchExample> createState() => _CupertinoSwitchExampleState();
}

class _CupertinoSwitchExampleState extends State<CupertinoSwitchExample> {
  bool switchValue = true;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('CupertinoSwitch Sample'),
      ),
      child: Center(
        child: CupertinoSwitch(
          // This bool value toggles the switch.
          value: switchValue,
          activeColor: AppTheme.black,
          thumbColor: AppTheme.white,
          trackColor: AppTheme.black,
          onChanged: (bool? value) {
            // This is called when the user toggles the switch.
            setState(() {
              switchValue = value ?? false;
            });
          },
        ),
      ),
    );
  }
}
