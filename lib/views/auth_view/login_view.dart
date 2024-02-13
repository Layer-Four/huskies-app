import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:huskies_app/constants/app_theme.dart';
import 'package:huskies_app/provider/static_provider.dart';
import 'package:huskies_app/views/auth_view/signup_view.dart';
import 'package:huskies_app/views/view_widgets/custombuttonauth.dart';
import 'package:huskies_app/views/view_widgets/textformfield.dart';

class LoginView extends ConsumerStatefulWidget {
  const LoginView({super.key});

  @override
  ConsumerState<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String? passwordValidator(value) {
    if (value!.isEmpty) {
      return "Enter Password";
    } else if (password.text.length < 6) {
      return "Password Length Should be more than 6 charachters";
    }
    return null;
  }

  @override
  void dispose() {
    super.dispose();
    email.dispose();
    password.dispose();
  }

  String? emailValidator(value) {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value!);

    if (value.isEmpty) {
      return "Enter Email";
    } else if (!emailValid) {
      return "Enter Valid Email";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      body: Stack(children: [
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
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                    AppTheme.sizedBox14,
                    const Text("E-Mail", style: AppTheme.textDefault),
                    Padding(
                      padding: AppTheme.paddingM,
                      child: CustomeTextForm(
                          hinttext: "Email", mycontroller: email),
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
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const Signup()));
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
                            email: email.text.trim(),
                            password: password.text.trim())),

                const Padding(
                  padding: AppTheme.paddingXL,
                  child: GoogleLogInButtonWidget(),
                ),
                // Text("Don't Have An Account ? Resister" , textAlign: TextAlign.center,)

                Row(
                  mainAxisAlignment: AppTheme.mainAlignCenter,
                  children: [
                    const Text(
                      "Sie haben noch kein Account? ",
                      style: AppTheme.textDefaultSmallW500,
                    ),
                    InkWell(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Signup()),
                      ),
                      child: const Text(" Registieren",
                          style: AppTheme.textDefault),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ]),
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
