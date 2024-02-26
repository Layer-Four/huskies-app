import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:huskies_app/constants/app_theme.dart';
import 'package:huskies_app/models/user_vm/user_model.dart';
// import 'package:huskies_app/provider/error_provider/error_provider.dart';
import 'package:huskies_app/provider/static_provider.dart';
import 'package:huskies_app/views/user_views/user_edit_view.dart';
import 'package:huskies_app/views/view_widgets/symetric_button_widget.dart';
import 'package:huskies_app/views/view_widgets/user_view_widgets/settingsrow_widget.dart';

class UserProfileView extends ConsumerStatefulWidget {
  const UserProfileView({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _UserProfileViewState();
}

class _UserProfileViewState extends ConsumerState<UserProfileView> {
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
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: AppTheme.mainAlignBetween,
          crossAxisAlignment: AppTheme.crossAlignStart,
          children: [
            Card(
              elevation: 7,
              semanticContainer: false,
              child: Container(
                decoration: AppTheme.whiteBox,
                child: Row(
                  mainAxisAlignment: AppTheme.mainAlignEvenly,
                  children: [
                    Container(
                      margin: AppTheme.padding0_30,
                      decoration: const BoxDecoration(shape: BoxShape.circle),
                      clipBehavior: Clip.antiAlias,
                      child: user.userImageUrl == null
                          ? Image.asset('assets/user.png',
                              height: 90, width: 90)
                          : Image.network(
                              user.userImageUrl!,
                              height: 90,
                              width: 90,
                            ),
                    ),
                    Column(
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
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      const UpdateUserView()));
                            }),
                      ],
                    )
                  ],
                ),
              ),
            ),
            const Padding(
              padding: AppTheme.paddingL,
              child:
                  Text('Einstellungen', style: TextStyle(color: AppTheme.grey)),
            ),
            Card(
              elevation: 7,
              child: Container(
                decoration: AppTheme.whiteBox,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: AppTheme.mainAlignEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: AppTheme.mainAlignBetween,
                      children: [
                        const SettingsRow(
                          endingWidget: Text(
                            'Deutsch',
                            style: TextStyle(color: AppTheme.grey),
                          ),
                          leadingIcon: Icon(Icons.flag_outlined),
                          optionText: 'Sprache',
                        ),
                        SettingsRow(
                          endIcon: Transform.scale(
                            scale: 0.9,
                            child: Switch(
                              activeColor: AppTheme.white,
                              activeTrackColor: AppTheme.black,
                              inactiveTrackColor: AppTheme.black,
                              inactiveThumbColor: AppTheme.white,
                              materialTapTargetSize:
                                  MaterialTapTargetSize.padded,
                              value: darkMode,
                              onChanged: (_) => setState(() {
                                darkMode = !darkMode;
                              }),
                            ),
                          ),
                          optionText: 'Dark-mode',
                          leadingIcon: const Icon(Icons.dark_mode_outlined),
                        ),
                        SettingsRow(
                          endIcon: Switch(
                            activeColor: AppTheme.white,
                            activeTrackColor: AppTheme.black,
                            inactiveTrackColor: AppTheme.black,
                            inactiveThumbColor: AppTheme.white,
                            value: faceID,
                            onChanged: (_) => setState(() {
                              faceID = !faceID;
                            }),
                          ),
                          optionText: 'Face ID',
                          leadingIcon: const Icon(Icons.face_5_outlined),
                        ),
                        const SettingsRow(
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
              child: Container(
                decoration: AppTheme.whiteBox,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: AppTheme.mainAlignEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: AppTheme.mainAlignBetween,
                      children: [
                        const SettingsRow(
                          leadingIcon: Icon(
                            Icons.contact_support_sharp,
                          ),
                          optionText: 'Support',
                        ),
                        const SettingsRow(
                          optionText: 'Zahlungsmittel',
                          leadingIcon: Icon(Icons.euro),
                        ),
                        SettingsRow(
                          endIcon: const SizedBox(),
                          leadingIcon: const Icon(Icons.exit_to_app),
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
