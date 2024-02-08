import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        centerTitle: true,
        title: const Text('Mein Profile'),
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
                        child:
                            //  user != null                          ?
                            Image.asset(
                                user.userImageUrl != null
                                    ? 'assets/${user.userImageUrl}'
                                    : 'assets/user.png',
                                height: 90,
                                width: 90)
                        // : const Icon(Icons.account_circle_rounded, size: 90),
                        ),
                    Column(
                      children: [
                        Text(
                          '${user.displayedName ?? ' Username'} ${user.displayedName?.split(' ').last ?? ''}',
                        ),
                        Text(
                          user.email ?? 'beispiel@email.etc',
                          style: const TextStyle(color: Colors.grey, fontSize: 11),
                        ),
                        Text(
                          // TODO: generate a separate KuID!
                          'Kundennummer: ${user.appUserID}',
                          style: const TextStyle(color: Colors.grey, fontSize: 11),
                        ),
                        SymetricButton(
                            color: const Color.fromARGB(255, 22, 63, 92),
                            text: 'Profil bearbeiten',
                            onPressed: () {
                              Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context) => const UpdateUserView()));
                            }),
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
              margin: const EdgeInsets.symmetric(horizontal: 10),
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
                        const SettingsRow(
                          endingWidget: Text(
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
                          leadingIcon: const Icon(Icons.dark_mode_outlined),
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
                    BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(11)),
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
