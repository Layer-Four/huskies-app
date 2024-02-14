import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:huskies_app/constants/app_theme.dart';
import 'package:huskies_app/constants/helpers.dart';
import 'package:huskies_app/provider/static_provider.dart';
import 'package:huskies_app/provider/user_provider/user_provider.dart';
import 'package:huskies_app/views/view_widgets/accept_return.widget.dart';
import 'package:huskies_app/views/view_widgets/blue_button_widget.dart';

class CreateUserView extends ConsumerStatefulWidget {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CreateUserState();
}

class _CreateUserState extends ConsumerState<CreateUserView> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    File? image;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: AppTheme.mainAlignCenter,
            children: [
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
              const Padding(padding: AppTheme.paddingM, child: Text('email')),
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
              const Padding(padding: AppTheme.paddingM, child: Text('password')),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60),
                child: TextFormField(
                  controller: passwordController,
                  decoration: AppTheme.textInputDecoration,
                  textAlign: AppTheme.textCenter,
                  obscureText: true,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: AppTheme.mediumDistance),
                child: SymetricButton(
                    color: AppTheme.blueGrey,
                    text: 'Profilbild ändern',
                    onPressed: () async {
                      //TODO: need a image or better the image URL string
                      image = await Helpers.asktForImage(context, ref);
                    }),
              ),
              AcceptOrReturnWidget(
                onPressed: () async {
                  if (firstNameController.text.isEmpty &&
                      lastNameController.text.isEmpty &&
                      emailController.text.isEmpty &&
                      phoneController.text.isEmpty) {
                    Helpers.showSnackbar(context, 'keine änderungen übernommen');
                    Navigator.of(context).pop();
                    return;
                  }
                  if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
                    await ref.read(statusProvider.notifier).registerUserWithEmailAndPassword(
                          email: emailController.text,
                          password: passwordController.text,
                        );
                    if (ref.watch(userProvider) != null) {
                      ref.read(userProvider.notifier).updateUserProfile(
                            displayName: '${firstNameController.text},${lastNameController.text}',
                            newEmail: emailController.text,
                            newPhoneNumber: int.tryParse(phoneController.text),
                            image: image,
                          );
                    }
                  }
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
