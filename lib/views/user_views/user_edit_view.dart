// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:huskies_app/constants/app_theme.dart';
import 'package:huskies_app/constants/helpers.dart';
import 'package:huskies_app/models/user_vm/user_model.dart';
import 'package:huskies_app/provider/user_provider/user_provider.dart';
import 'package:huskies_app/views/view_widgets/blue_button_widget.dart';
import 'package:permission_handler/permission_handler.dart';

class UpdateUserView extends ConsumerStatefulWidget {
  const UpdateUserView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UpdateUserState();
}

class _UpdateUserState extends ConsumerState<UpdateUserView> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    File? userImage;
    UserModel? currentUser = ref.watch(userProvider);
    return SafeArea(
      child: Material(
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      margin: AppTheme.boxPadding,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: currentUser != null
                          ? Image.asset(
                              currentUser.userImageUrl != null
                                  ? currentUser.userImageUrl!
                                  : 'assets/user.png',
                              width: 90)
                          : const Icon(Icons.account_circle_rounded, size: 90),
                    ),
                    SymetricButton(
                        color: Colors.blueGrey,
                        text: 'Profilbild ändern',
                        onPressed: () async {
                          userImage = await asktForImage();
                        }),
                  ],
                ),
              ),
              const Padding(
                padding: AppTheme.paddingM,
                child: Text(
                  'Vorname',
                  style: TextStyle(fontSize: 13),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 70),
                child: TextFormField(
                  controller: firstNameController,
                  decoration: AppTheme.textInputDecoration,
                  keyboardType: TextInputType.name,
                  textAlign: TextAlign.center,
                ),
              ),
              const Padding(
                padding: AppTheme.paddingM,
                child: Text('Nachname'),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 70),
                child: TextFormField(
                  controller: lastNameController,
                  decoration: AppTheme.textInputDecoration,
                  keyboardType: TextInputType.name,
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 20),
                width: 100,
                child: SymetricButton(
                  color: Colors.green,
                  text: 'Ändern',
                  onPressed: () {
                    log('firstname ${firstNameController.text}');
                    log('lastname ${lastNameController.text}');

                    ref.read(userProvider.notifier).updateUser(
                          displayName: '${firstNameController.text},${lastNameController.text}',
                          image: userImage,
                        );
                    firstNameController.clear();
                    lastNameController.clear();
                    Navigator.of(context).pop();
                  },
                ),
              )
            ]),
      ),
    );
  }

  FutureOr<File?> asktForImage() async {
    showDialog(
        context: context,
        builder: (context) => Card(
              margin: AppTheme.regtangelCard,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SymetricButton(
                        color: Colors.green,
                        text: 'Wähle ein Bild aus \ndeiner Galerie',
                        onPressed: () async {
                          PermissionStatus storeStatus = await Permission.storage.request();
                          if (!storeStatus.isGranted) {
                            await Permission.storage.request();
                          }
                          if (storeStatus.isGranted || storeStatus.isDenied) {
                            final image = await Helpers.pickImageFromGalery();
                            if (image != null) {
                              showSnackBar(context, ' Bild ausgewählt');
                              Navigator.of(context).pop();
                              return image;
                            } else {
                              showSnackBar(context, 'kein Bild ausgewählt');
                              Navigator.of(context).pop();
                            }
                          }
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SymetricButton(
                        color: Colors.green,
                        text: 'Erstelle ein neues \nProfile von dir',
                        onPressed: () async {
                          final cameraPermission = await Permission.camera.request();
                          if (cameraPermission.isGranted || cameraPermission.isDenied) {
                            final image = await Helpers.pickImageFromCamera();
                            if (image != null) {
                              showSnackBar(context, 'Bild ausgewählt!');
                              ref.read(userProvider.notifier).updateUser(image: image);
                              Navigator.of(context).pop();
                              return;
                            }
                            showSnackBar(context, 'kein Bild ausgewählt');
                            Navigator.of(context).pop();
                          }
                        }),
                  ),
                ],
              ),
            ));
    return null;
  }
}

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar(context, String message) =>
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));

// File? image;
// void pickImageFromGalery() async {
//   final ImagePicker picker = ImagePicker();
//   XFile? file;
//   PermissionStatus storeStatus = await Permission.storage.status;
//   if (!storeStatus.isGranted) {
//     await Permission.storage.request();
//   }
//   if (storeStatus.isGranted) {
//     file = await picker.pickImage(source: ImageSource.gallery);
//   }
//   if (file != null) {
//     image = File(file.path);
//   }
//   return null;
// }
