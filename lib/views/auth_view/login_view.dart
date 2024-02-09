import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:huskies_app/constants/app_theme.dart';
import 'package:huskies_app/provider/static_provider.dart';
import 'package:huskies_app/views/auth_view/signup_view.dart';
import 'package:huskies_app/views/view_widgets/custombuttonauth.dart';
import 'package:huskies_app/views/view_widgets/textformfield.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
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
                                "assets/huskies.png",
                                width: 100,
                                height: 100,
                              ),
                            ),
                          ),
                          AppTheme.sizedBox40,
                          const Text(
                            "Anmelden",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),
                          ),
                          AppTheme.sizedBox14,
                          const Text("E-Mail", style: AppTheme.textDefault),
                          Padding(
                            padding: AppTheme.paddingM,
                            child: CustomeTextForm(hinttext: "Email", mycontroller: email),
                          ),
                          const Text("Passwort", style: TextStyle(fontSize: 14)),
                          Padding(
                            padding: AppTheme.paddingM,
                            child: Column(
                              children: [
                                CustomeTextForm(
                                  hinttext: "Passwort",
                                  mycontroller: password,
                                  isPassword: true,
                                ),
                                Container(
                                  margin: AppTheme.bigPaddingTopButtom,
                                  alignment: Alignment.bottomRight,
                                  child: TextButton(
                                    onPressed: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) => const Signup()));
                                    },
                                    child: const Text("Passwort vergessen?",
                                        style: AppTheme.textDefaultSmall10),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      CustomButtonAuth(
                          title: "Anmelden",
                          onPress: () => ref
                              .watch(statusProvider.notifier)
                              .signInWithEmailAndPassword(
                                  email: email.text.trim(), password: password.text.trim())),

                      const Padding(
                        padding: AppTheme.paddingXL,
                        child: GoogleLogInButtonWidget(),
                      ),
                      // Text("Don't Have An Account ? Resister" , textAlign: TextAlign.center,)
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context, MaterialPageRoute(builder: (context) => const Signup()));
                        },
                        child: const Center(
                          child: Text.rich(
                            TextSpan(
                              text: "Sie haben noch kein Account? ",
                              style: AppTheme.textDefaultSmallW500,
                              children: [
                                TextSpan(text: "Register", style: AppTheme.textDefaultBlue),
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
      },
    );
  }
}

class GoogleLogInButtonWidget extends StatelessWidget {
  const GoogleLogInButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 40,
      shape: RoundedRectangleBorder(
        borderRadius: AppTheme.defaultM,
      ),
      color: AppTheme.customButton,
      textColor: AppTheme.white,
      onPressed: () {},
      child: const Row(
        mainAxisAlignment: AppTheme.mainAlignCenter,
        children: [
          Text("Login With Google  "),
          Icon(FontAwesome5.google),
        ],
      ),
    );
  }
}
