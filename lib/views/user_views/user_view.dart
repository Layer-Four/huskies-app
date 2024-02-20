// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:huskies_app/constants/app_theme.dart';
import 'package:huskies_app/models/user_vm/user_model.dart';
import 'package:huskies_app/views/user_views/user_edit_view.dart';
import 'package:huskies_app/views/view_widgets/symetric_button_widget.dart';
import 'package:huskies_app/views/view_widgets/user_view_widgets/settingsrow_widget.dart';

class UserProfileView extends StatefulWidget {
  const UserProfileView({Key? key}) : super(key: key);

  @override
  _UserProfileViewState createState() => _UserProfileViewState();
}

class _UserProfileViewState extends State<UserProfileView> {
  bool darkMode = false;
  bool faceID = true;

  @override
  Widget build(BuildContext context) {
    final user = UserModel(
      uID: '1111111111111',
      email: 'marten.layer4@gmail.com',
      appUserID: 132155135,
    );

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Mein Profile'),
      ),
      body: Padding(
        padding: AppTheme.paddingL,
        child: Column(
          crossAxisAlignment: AppTheme.crossAlignStart,
          children: [
            Card(
              elevation: 7,
              semanticContainer: false,
              child: Container(
                decoration: AppTheme.whiteBox,
                child: Row(
                  mainAxisAlignment: AppTheme.mainAlignBetween,
                  children: [
                    Container(
                      margin: AppTheme.padding0_30,
                      decoration: const BoxDecoration(shape: BoxShape.circle),
                      clipBehavior: Clip.antiAlias,
                      child: user.userImageUrl == null
                          ? Image.asset('assets/images/user.png', height: 90, width: 90)
                          : Image.network(
                              user.userImageUrl!,
                              height: 90,
                              width: 90,
                            ),
                    ),
                    Column(
                      crossAxisAlignment: AppTheme.crossAlignStart,
                      children: [
                        Text(user.displayedName != null
                            ? user.displayedName!.split(',').first
                            : 'Username'),
                        Text(
                          user.email == null || user.email!.isEmpty
                              ? 'beispiel@email.etc'
                              : user.email!,
                          style: AppTheme.textSmallGrey,
                        ),
                        Text(
                          'Kundennummer: ${user.appUserID}',
                          style: AppTheme.textSmallGrey,
                        ),
                        SymetricButton(
                          color: AppTheme.primary,
                          text: 'Profil bearbeiten',
                          onPressed: () {
                            Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) => const UpdateUserView()));
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.only(left: 8),
              child: Text('Einstellungen', style: TextStyle(color: AppTheme.grey)),
            ),
            Card(
              elevation: 7,
              child: Container(
                padding: EdgeInsets.only(left: 4.0, right: 12.0, top: 4.0),
                decoration: AppTheme.whiteBox,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: AppTheme.crossAlignStart,
                  children: [
                    SettingsRow(
                      customSwitchBuilder: (value, onChanged) => CustomCupertinoSwitch(
                          value: darkMode,
                          onChanged: (newValue) {
                            setState(() {
                              darkMode = newValue;
                            });
                          }),
                      optionText: 'Dark-mode',
                      leadingIcon: const Icon(Icons.dark_mode_outlined),
                    ),
                    SettingsRow(
                      customSwitchBuilder: (value, onChanged) => CustomCupertinoSwitch(
                          value: faceID,
                          onChanged: (newValue) {
                            setState(() {
                              faceID = newValue;
                            });
                          }),
                      optionText: 'Face ID',
                      leadingIcon: const Icon(Icons.face_5_outlined),
                    ),
                    const SettingsRow(
                      leadingIcon: Icon(Icons.flag_outlined),
                      optionText: 'Sprache',
                      endingWidget: Icon(Icons.arrow_right), // Icon as endingWidget
                    ),
                    // Push-Benachrichtigung
                    const SettingsRow(
                      leadingIcon: Icon(Icons.notifications_outlined),
                      optionText: 'Push-Benachrichtigung',
                      endingWidget: Icon(Icons.arrow_right), // Icon as endingWidget
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Card(
              elevation: 7,
              child: Container(
                padding: AppTheme.paddingUserProfile,
                decoration: AppTheme.whiteBox,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: AppTheme.crossAlignStart,
                  children: [
                    const SettingsRow(
                      leadingIcon: Icon(Icons.contact_support_sharp),
                      optionText: 'Support',
                      endingWidget: Icon(Icons.arrow_right),
                    ),
                    const SettingsRow(
                      optionText: 'Zahlungsmittel',
                      leadingIcon: Icon(Icons.euro),
                      endingWidget: Icon(Icons.arrow_right),
                    ),
                    SettingsRow(
                      leadingIcon: const Icon(Icons.exit_to_app),
                      onTextPressed: () {
                        Navigator.of(context).pop();
                      },
                      optionText: 'Logout',
                      endingWidget: const Icon(Icons.logout),
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
