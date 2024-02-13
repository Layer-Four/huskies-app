import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:huskies_app/constants/app_theme.dart';
import 'package:huskies_app/constants/helpers.dart';
import 'package:huskies_app/models/user_vm/user_model.dart';
import 'package:huskies_app/provider/user_provider/user_provider.dart';
import 'package:huskies_app/views/view_widgets/accept_return.widget.dart';
import 'package:huskies_app/views/view_widgets/blue_button_widget.dart';
import 'package:huskies_app/views/view_widgets/user_view_widgets/delete_user_widget.dart';

class UpdateUserView extends ConsumerStatefulWidget {
  const UpdateUserView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UpdateUserState();
}

class _UpdateUserState extends ConsumerState<UpdateUserView> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  @override
  void dispose() {
    emailController.clear();
    firstNameController.clear();
    lastNameController.clear();
    phoneController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    File? userImage;
    UserModel currentUser = ref.watch(userProvider);
    return SafeArea(
      child: Material(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: AppTheme.mainBetween,
          children: [
            Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: AppTheme.mainAlignCenter,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 100, bottom: 50),
                    child: Row(
                      mainAxisAlignment: AppTheme.mainAlignEvenly,
                      children: [
                        Container(
                          margin: AppTheme.boxPadding,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          clipBehavior: Clip.antiAlias,
                          child: currentUser.userImageUrl != null
                              ? Image.network(currentUser.userImageUrl!, height: 90, width: 90)
                              : Image.asset('assets/user.png', width: 90),
                        ),
                        SymetricButton(
                            color: AppTheme.blueGrey,
                            text: 'Profilbild ändern',
                            onPressed: () async {
                              userImage = await Helpers.asktForImage(context, ref);
                            }),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: AppTheme.paddingM,
                    child: Text('Vorname', style: TextStyle(fontSize: 13)),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 60),
                    child: TextFormField(
                      controller: firstNameController,
                      decoration: AppTheme.textInputDecoration,
                      keyboardType: TextInputType.name,
                      textAlign: AppTheme.textCenter,
                    ),
                  ),
                  const Padding(padding: AppTheme.paddingM, child: Text('Nachname')),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 60),
                    child: TextFormField(
                      controller: lastNameController,
                      decoration: AppTheme.textInputDecoration,
                      keyboardType: TextInputType.name,
                      textAlign: AppTheme.textCenter,
                    ),
                  ),
                  if (currentUser.email == null || currentUser.email!.isEmpty)
                    const Padding(padding: AppTheme.paddingM, child: Text('email')),
                  if (currentUser.email == null || currentUser.email!.isEmpty)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 60),
                      child: TextFormField(
                        controller: emailController,
                        decoration: AppTheme.textInputDecoration,
                        keyboardType: TextInputType.emailAddress,
                        textAlign: AppTheme.textCenter,
                      ),
                    ),
                  const Padding(padding: AppTheme.paddingM, child: Text('phone number')),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 60),
                    child: TextFormField(
                      controller: phoneController,
                      decoration: AppTheme.textInputDecoration,
                      keyboardType: TextInputType.phone,
                      textAlign: AppTheme.textCenter,
                    ),
                  ),
                  AcceptOrReturnWidget(
                    onPressed: () {
                      if (firstNameController.text.isEmpty &&
                          lastNameController.text.isEmpty &&
                          userImage == null) {
                        Helpers.showSnackbar(context, 'keine änderungen übernommen');
                        Navigator.of(context).pop();
                        return;
                      }
                      String displayName = '${firstNameController.text},${lastNameController.text}';

                      ref.read(userProvider.notifier).updateUserProfile(
                            displayName: displayName.length > 1 ? displayName : null,
                            newEmail: emailController.text.isNotEmpty ? emailController.text : null,
                            newPhoneNumber: int.tryParse(phoneController.text),
                            image: userImage,
                          );
                      Navigator.of(context).pop();
                    },
                  ),
                ]),
            const DeleteUserCard(),
          ],
        ),
      ),
    );
  }
}
