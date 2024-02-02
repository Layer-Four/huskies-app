import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:huskies_app/models/user_vm/user_model.dart';
import 'package:huskies_app/provider/auth_provider/auth_state_provider.dart';
import 'package:huskies_app/provider/static_provider.dart';
import 'package:huskies_app/views/loading_view.dart';
import 'package:huskies_app/views/widgets/blue_button_widget.dart';
import 'package:huskies_app/views/widgets/user_view_widgets/settingsrow_widget.dart';

class UserProfileView extends ConsumerStatefulWidget {
  final String? userImage;
  const UserProfileView({this.userImage, super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UserProfileViewState();
}

class _UserProfileViewState extends ConsumerState<UserProfileView> {
  bool darkMode = false;
  bool faceID = true;
  UserModel? userModel;
  @override
  Widget build(BuildContext context) {
    final user = ref.watch(authProvider);
    user.when(
      error: (error, stackTrace) => throw ('error on Userview: $error ,  stack trace: $stackTrace'),
      loading: () {},
      data: (user) {
        if (user != null) {
          userModel = UserModel(
            email: user.email!,
            uID: user.uid,
            displayedName: user.displayName,
          );
        }
      },
    );
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
                      child: Image.asset(
                          widget.userImage != null ? 'assets/${widget.userImage}' : 'assets/da.jpg',
                          height: 80,
                          width: 80),
                    ),
                    Column(
                      children: [
                        Text(
                          '${userModel?.displayedName ?? ' Username'} ${userModel?.displayedName!.split(' ').last ?? ''}',
                        ),
                        Text(
                          userModel?.email ?? 'beispiel@email.etc',
                          style: const TextStyle(color: Colors.grey, fontSize: 11),
                        ),
                        Text(
                          // TODO: generate a separate KuID!
                          'Kundennummer: ${userModel?.uID ?? 'KH234332'}',
                          style: const TextStyle(color: Colors.grey, fontSize: 11),
                        ),
                        BlueButton(
                            color: const Color.fromARGB(255, 22, 63, 92),
                            text: 'Profil bearbeiten',
                            onPressed: () {
                              Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context) => const LoadingView()));
                              Future.delayed(const Duration(seconds: 2))
                                  .then((value) => Navigator.of(context).pop());
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
