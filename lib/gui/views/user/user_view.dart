// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:huskies_app/logic/helper/helpers.dart';
import 'package:huskies_app/logic/provider/notifier.dart';

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
        centerTitle: true,
        title: Text('Mein Profile'),
      ),
      body: Container(
        height: 700,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Card(
              color: Colors.white,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 30),
                    decoration: const BoxDecoration(shape: BoxShape.circle),
                    clipBehavior: Clip.antiAlias,
                    child: Image.asset('assets/da.jpg', height: 90, width: 90),
                  ),
                  Column(
                    children: [
                      Text(
                        '${state.user?.firstName ?? 'Hier steht der Username'} ${state.user?.name ?? ''}',
                      ),
                      Text(state.user?.email ?? 'beispiel@email.etc'),
                      Text('Kundennummer: ${state.user?.uID ?? 'KH234332'}'),
                      Container(
                        color: Colors.lightBlue,
                        child: TextButton(
                            onPressed: () {
                              Helpers.showLoadingView(context, advertising: 'Nutzter bearbeiten');
                              Future.delayed(const Duration(seconds: 2))
                                  .then((value) => Navigator.of(context).pop());
                            },
                            child: const Text('Profil bearbeiten')),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 10),
              width: double.infinity,
              child: const Text('Einstellungen'),
            ),
            Card(
              color: Colors.white,
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SettingsRow(
                          endingWidget: const Text('Deutsch'),
                          leadingIcon: Icon(Icons.data_saver_off_sharp),
                          optionText: 'Sprache',
                        ),
                        SettingsRow(
                          endingIcon: Switch(
                            value: darkMode,
                            onChanged: (_) => setState(() {
                              darkMode = !darkMode;
                            }),
                          ),
                          optionText: 'Darkmode',
                          leadingIcon: Icon(Icons.dark_mode_outlined),
                        ),
                        SettingsRow(
                          endingIcon: Switch(
                            value: faceID,
                            onChanged: (_) => setState(() {
                              faceID = !faceID;
                            }),
                          ),
                          optionText: 'Face ID',
                          leadingIcon: Icon(Icons.dark_mode_outlined),
                        ),
                        SettingsRow(
                          leadingIcon: Icon(Icons.data_saver_off_sharp),
                          optionText: 'Push-Benachritung',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Card(
              color: Colors.white,
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SettingsRow(
                          leadingIcon: Icon(Icons.chat_bubble_outline),
                          optionText: 'Support',
                        ),
                        SettingsRow(
                          optionText: 'Zahlungsmittel',
                          leadingIcon: Icon(Icons.euro),
                        ),
                        SettingsRow(
                          endingIcon: SizedBox(),
                          leadingIcon: Icon(Icons.exit_to_app),
                          optionText: 'logout',
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
  final String optionText;
  final Widget? endingWidget;
  final Widget endingIcon;
  const SettingsRow({
    super.key,
    this.endingIcon = const Icon(Icons.arrow_right),
    this.endingWidget,
    required this.leadingIcon,
    required this.optionText,
  });
  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(padding: const EdgeInsets.all(16), child: leadingIcon),
              Text(optionText),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(padding: const EdgeInsets.all(4), child: endingWidget),
              endingIcon,
            ],
          ),
        ],
      );
}
