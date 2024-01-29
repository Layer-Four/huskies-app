// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:huskies_app/constants/helpers.dart';
import 'package:huskies_app/models/user_vm/user.dart';
import 'package:huskies_app/provider/season_provider/authstate_provider.dart';
import 'package:huskies_app/provider/static_provider.dart';
import 'package:huskies_app/views/widgets/blue_button_widget.dart';
import 'package:huskies_app/views/widgets/settingsrow_widget.dart';

class UserProfileView extends ConsumerStatefulWidget {
  const UserProfileView({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UserProfileViewState();
}

class _UserProfileViewState extends ConsumerState<UserProfileView> {
  bool darkMode = false;
  bool faceID = true;
  UserModel? userModel;
  @override
  Widget build(BuildContext context) {
    final user = ref.watch(authStateProvider);
    user.when(
      error: (error, stackTrace) => log('error on Userview: $error ,  stack trace: $stackTrace'),
      loading: () {},
      data: (user) {
        if (user != null) {
          userModel = UserModel(
            email: user.email!,
            uID: user.uid,
            name: user.displayName,
          );
        }
      },
    );
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        centerTitle: true,
        title: Text('Mein Profile'),
      ),
      body: Container(
        height: 650,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Card(
              elevation: 7,
              semanticContainer: false,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(11),
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 30),
                      decoration: const BoxDecoration(shape: BoxShape.circle),
                      clipBehavior: Clip.antiAlias,
                      child: Image.asset('assets/da.jpg', height: 80, width: 80),
                    ),
                    Column(
                      children: [
                        Text(
                          '${userModel?.firstName ?? ' Username'} ${userModel?.name ?? ''}',
                        ),
                        Text(
                          userModel?.email ?? 'beispiel@email.etc',
                          style: TextStyle(color: Colors.grey, fontSize: 11),
                        ),
                        Text(
                          // TODO: generate a separate KuID!
                          'Kundennummer: ${userModel?.uID ?? 'KH234332'}',
                          style: TextStyle(color: Colors.grey, fontSize: 11),
                        ),
                        Container(
                          alignment: Alignment.topCenter,
                          height: 28,
                          margin: EdgeInsets.only(top: 12),
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 22, 63, 92),
                              borderRadius: BorderRadius.circular(7)),
                          child: BlueButton(
                              text: 'Profil bearbeiten',
                              onPressed: () {
                                Helpers.showLoadingView(context, advertising: 'Profil bearbeiten');
                                Future.delayed(const Duration(seconds: 2))
                                    .then((value) => Navigator.of(context).pop());
                              }),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 10),
              width: double.infinity,
              child: const Text(
                'Einstellungen',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(horizontal: 10),
              elevation: 7,
              child: Container(
                decoration:
                    BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(11)),
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SettingsRow(
                          endingWidget: const Text(
                            'Deutsch',
                            style: TextStyle(color: Colors.grey),
                          ),
                          leadingIcon: Icon(Icons.flag_outlined),
                          optionText: 'Sprache',
                        ),
                        SettingsRow(
                          endIcon: Transform.scale(
                            scale: 0.9,
                            child: Switch(
                              activeColor: Colors.white,
                              activeTrackColor: Colors.black,
                              inactiveTrackColor: Colors.black,
                              inactiveThumbColor: Colors.white,
                              materialTapTargetSize: MaterialTapTargetSize.padded,
                              value: darkMode,
                              onChanged: (_) => setState(() {
                                darkMode = !darkMode;
                              }),
                            ),
                          ),
                          optionText: 'Dark-mode',
                          leadingIcon: Icon(Icons.dark_mode_outlined),
                        ),
                        SettingsRow(
                          endIcon: Switch(
                            activeColor: Colors.white,
                            activeTrackColor: Colors.black,
                            inactiveTrackColor: Colors.black,
                            inactiveThumbColor: Colors.white,
                            value: faceID,
                            onChanged: (_) => setState(() {
                              faceID = !faceID;
                            }),
                          ),
                          optionText: 'Face ID',
                          leadingIcon: Icon(Icons.face_5_outlined),
                        ),
                        SettingsRow(
                          leadingIcon: Icon(Icons.notifications_outlined),
                          optionText: 'Push-Benachritung',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Card(
              elevation: 7,
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                decoration:
                    BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(11)),
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SettingsRow(
                          leadingIcon: Icon(
                            Icons.contact_support_sharp,
                          ),
                          optionText: 'Support',
                        ),
                        SettingsRow(
                          optionText: 'Zahlungsmittel',
                          leadingIcon: Icon(Icons.euro),
                        ),
                        SettingsRow(
                          endIcon: SizedBox(),
                          leadingIcon: Icon(Icons.exit_to_app),
                          onTextPressed: () {
                            ref.watch(statusProvider.notifier).signOut();
                            Navigator.of(context).pop();
                          },
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
