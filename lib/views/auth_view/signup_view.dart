import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:huskies_app/constants/app_theme.dart';
import 'package:huskies_app/provider/static_provider.dart';
import 'package:huskies_app/views/auth_view/login_view.dart';
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
                  child: ListView(children: [
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
                        const SizedBox(
                          height: 4,
                        ),

                        CustomeTextForm(
                          // hinttext: "Password Eingeben",
                          mycontroller: password, hinttext: 'passwort',
                        ),
                        AppTheme.sizedBox14,
                        const Text(
                          "Passwort bestätigen",
                          style: TextStyle(
                              fontSize: 13, color: Colors.white, fontWeight: FontWeight.w500),
                        ),
                        AppTheme.sizedBox14,
                        // CustomeTextForm(
                        // hinttext: "Password Eingeben",
                        // mycontroller: password),
                        // Container(
                        //   margin: const EdgeInsets.only(top: 10, bottom: 20),
                        //   alignment: Alignment.bottomRight,
                        //   // child: const Text(
                        //   "Passwort vergessen?",
                        //   style: TextStyle(fontSize: 11, color: Colors.white),
                        // ),
                        // ),
                      ],
                    ),
                    CustomButtonAuth(
                      title: "Registrieren",
                      onPress: () async {
                        await ref
                            .watch(statusProvider.notifier)
                            .registerUserWithEmailAndPassword(
                                email: email.text.trim(), password: password.text.trim())
                            .then((value) => value ? Navigator.of(context).pop() : null);
                      },
                    ),
                    AppTheme.sizedBox14,
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginView(),
                          ),
                        );
                      },
                      child: const Center(
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: "Haben Sie ein Account ? ",
                                style: AppTheme.textDefaultSmall10,
                              ),
                              TextSpan(text: "Anmelden", style: AppTheme.textDefaultBlue),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
