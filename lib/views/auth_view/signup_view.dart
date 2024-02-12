import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:huskies_app/constants/app_theme.dart';
import 'package:huskies_app/constants/helpers.dart';
import 'package:huskies_app/provider/static_provider.dart';
import 'package:huskies_app/views/view_widgets/custombuttonauth.dart';
import 'package:huskies_app/views/view_widgets/textformfield.dart';

class Signup extends StatefulWidget {
  final bool isPWForget;
  const Signup({super.key, this.isPWForget = false});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController username = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) => SafeArea(
        child: Scaffold(
          // backgroundColor: Colors.white,
          body: Stack(
            children: [
              AppTheme.backgroundImageHomePage,
              Container(color: AppTheme.containerBlack),
              Center(
                child: Container(
                  padding: AppTheme.paddingXL,
                  child: ListView(
                    children: [
                      Column(
                        crossAxisAlignment: AppTheme.crossAlignStart,
                        children: [
                          // const SizedBox(height: 50),
                          Center(
                            child: SizedBox(
                              // alignment: Alignment.center,
                              width: 180,
                              height: 180,
                              child: Image.asset(
                                "assets/huskies.png",
                                width: 100,
                                height: 100,
                              ),
                            ),
                          ),
                          AppTheme.sizedBox40,
                          const Text("Registrieren", style: AppTheme.textDefault),
                          AppTheme.sizedBox14,
                          const Text("E-Mail", style: AppTheme.textDefault),
                          AppTheme.sizedBox14,
                          CustomeTextForm(
                            hinttext: "Email Eingeben",
                            mycontroller: email,
                          ),
                          AppTheme.sizedBox14,
                          const Text("Passwort", style: AppTheme.textDefault),
                          AppTheme.sizedBox14,
                          CustomeTextForm(
                            mycontroller: password,
                            hinttext: 'passwort',
                          ),
                          AppTheme.sizedBox14,
                          const Text("Passwort bestätigen", style: AppTheme.textDefault),
                        ],
                      ),
                      Padding(
                        padding: AppTheme.paddingL,
                        child: CustomButtonAuth(
                          title: "Registrieren",
                          onPress: () async {
                            await ref
                                .watch(statusProvider.notifier)
                                .registerUserWithEmailAndPassword(
                                    email: email.text.trim(), password: password.text.trim())
                                .then(
                                  (value) => value
                                      ? Navigator.of(context).pop()
                                      : Helpers.showSnackbar(
                                          context, 'Bitte geben sie gültige anmeldedaten ein'),
                                );
                          },
                        ),
                      ),
                      Row(
                        mainAxisAlignment: AppTheme.mainAlignCenter,
                        children: [
                          const Text(
                            "Haben Sie ein Account ? ",
                            style: AppTheme.textDefaultSmall10,
                          ),
                          InkWell(
                            onTap: () => Navigator.of(context).pop(),
                            child: const Text("Anmelden", style: AppTheme.textDefault),
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
      ),
    );
  }
}
