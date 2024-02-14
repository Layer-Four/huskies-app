import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:huskies_app/constants/app_theme.dart';
import 'package:huskies_app/provider/error_provider/error_provider.dart';
import 'package:huskies_app/provider/static_provider.dart';
import 'package:huskies_app/provider/user_provider/user_provider.dart';
import 'package:huskies_app/views/user_views/user_edit_view.dart';
import 'package:huskies_app/views/view_widgets/blue_button_widget.dart';
import 'package:huskies_app/views/view_widgets/user_view_widgets/settingsrow_widget.dart';

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
    final user = ref.watch(userProvider);
    if (user == null) {
      ref.read(errorProvider.notifier).catchError(throw ('call a non nullable User with null'));
    }
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        centerTitle: true,
        title: const Text('Mein Profile'),
      ),
      body: Container(
        // height: 650,
        width: double.infinity,
        padding: AppTheme.defaultVerticalDistance,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: AppTheme.mainAlignBetween,
          children: [
            Card(
              elevation: 7,
              semanticContainer: false,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(11),
                  color: AppTheme.white,
                ),
                child: Row(
                  mainAxisAlignment: AppTheme.mainAlignEvenly,
                  children: [
                    Container(
                      margin: AppTheme.defaultVerticalDistanceL,
                      decoration: const BoxDecoration(shape: BoxShape.circle),
                      clipBehavior: Clip.antiAlias,
                      child: user.userImageUrl == null
                          ? Image.asset('assets/user.png', height: 90, width: 90)
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
                          style: AppTheme.textDefaultSmall10Grey,
                        ),
                        Text(
                          // TODO: generate a separate KuID!
                          'Kundennummer: ${user.appUserID}',
                          style: AppTheme.textDefaultSmall10Grey,
                        ),
                        SymetricButton(
                            color: AppTheme.customButton,
                            text: 'Profil bearbeiten',
                            onPressed: () {
                              Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context) => const UpdateUserView()));
                            }),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 10),
              width: double.infinity,
              child: const Text(
                'Einstellungen',
                style: TextStyle(color: AppTheme.grey),
              ),
            ),
            Card(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              elevation: 7,
              child: Container(
                decoration:
                    BoxDecoration(color: AppTheme.white, borderRadius: BorderRadius.circular(11)),
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
                              materialTapTargetSize: MaterialTapTargetSize.padded,
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
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                decoration:
                    BoxDecoration(color: AppTheme.white, borderRadius: BorderRadius.circular(11)),
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
