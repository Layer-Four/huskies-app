import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:huskies_app/constants/app_theme.dart';
import 'package:huskies_app/provider/static_provider.dart';
import 'package:huskies_app/views/view_widgets/custombuttonauth.dart';
import 'package:huskies_app/views/view_widgets/textformfield.dart';
import 'package:huskies_app/views/auth_view/login_view.dart';

class Signup extends ConsumerStatefulWidget {
  final bool isPWForget;
  const Signup({super.key, this.isPWForget = false});

  @override
  ConsumerState<Signup> createState() => _SignupState();
}

class _SignupState extends ConsumerState<Signup> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController username = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                      Center(
                        child: SizedBox(
                          width: 180,
                          height: 180,
                          child: Image.asset(
                            "assets/images/huskies.png",
                            width: 100,
                            height: 100,
                          ),
                        ),
                      ),
                      AppTheme.bigPlaceholder,
                      const Text(
                        "Registrieren",
                        style: AppTheme.whiteDefaultText,
                      ),
                      AppTheme.mediumPlaceholder,
                      const Text(
                        "E-Mail",
                        style: AppTheme.textWhiteMid,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      CustomeTextForm(
                        hinttext: "Email eingeben",
                        mycontroller: email,
                        onSaved: null,
                      ),
                      const SizedBox(
                        height: 11,
                      ),
                      const Text(
                        "Passwort",
                        style: AppTheme.textWhiteMid,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      CustomeTextForm(
                        // hinttext: "Password Eingeben",
                        mycontroller: password, hinttext: 'passwort',
                        onSaved: null,
                      ),
                      const SizedBox(
                        height: 11,
                      ),
                      const Text(
                        "Passwort bestätigen",
                        style: AppTheme.textWhiteMid,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                    ],
                  ),
                  CustomButtonAuth(
                    title: "Registrieren",
                    onPress: () {
                      if (email.text.isNotEmpty) {
                        ref
                            .watch(statusProvider.notifier)
                            .registerUserWithEmailAndPassword(
                                email: email.text.trim(),
                                password: password.text.trim())
                            .then((value) =>
                                value ? Navigator.of(context).pop() : null);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            duration: Duration(seconds: 3),
                            content: Text("bitte gib ein Email ein"),
                          ),
                        );
                      }
                    },
                    formKey: formKey,
                  ),

                  // Container(height: 20),

                  // MaterialButton(
                  //   height: 40,
                  //   shape: RoundedRectangleBorder(
                  //     borderRadius: BorderRadius.circular(13),
                  //   ),
                  //   color: const Color.fromARGB(255, 22, 63, 92),
                  //   textColor: Colors.white,
                  //   onPressed: () {},
                  //   child: const Row(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       Text("Login With Google  "),
                  //       Icon(FontAwesome5.google)
                  //     ],
                  //   ),
                  // ),
                  Container(height: 20),
                  // Text("Don't Have An Account ? Resister" , textAlign: TextAlign.center,)
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
                              style: TextStyle(color: AppTheme.white),
                            ),
                            TextSpan(
                                text: "Anmelden",
                                style: TextStyle(
                                    color: AppTheme.white,
                                    fontWeight: FontWeight.bold)),
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
    );
  }
}
