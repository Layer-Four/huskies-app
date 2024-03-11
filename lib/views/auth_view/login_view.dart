import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:huskies_app/constants/app_theme.dart';
import 'package:huskies_app/provider/static_provider.dart';
import 'package:huskies_app/views/auth_view/signup_view.dart';
import 'package:huskies_app/views/view_widgets/background_widget.dart';
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
    return SafeArea(
      child: Scaffold(
        body: BackgroundWidget(
          imageName: 'background_image.jpg',
          body: Container(
            padding: AppTheme.paddingXL,
            child: ListView(
              children: [
                Form(
                  child: Column(
                    crossAxisAlignment: AppTheme.crossAlignStart,
                    children: [
                      Padding(
                        padding: AppTheme.paddingBottom20,
                        child: Center(
                          child: Image.asset(
                            "assets/images/huskies.png",
                            width: 170,
                            height: 170,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: AppTheme.paddingM,
                        child:
                            Text("Anmelden", style: AppTheme.whiteDefaultText),
                      ),
                      const Text("E-Mail", style: AppTheme.whiteDefaultText),
                      Padding(
                        padding: AppTheme.paddingM,
                        child: CustomeTextForm(
                          hinttext: "Email",
                          mycontroller: email,
                          validator: emailValidator,
                          onSaved: null,
                        ),
                      ),
                      const Text("Passwort", style: AppTheme.whiteDefaultText),
                      Padding(
                        padding: AppTheme.paddingM,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            CustomeTextForm(
                              hinttext: "Passwort",
                              mycontroller: password,
                              validator: passwordValidator,
                              isPassword: true,
                              onSaved: null,
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const Signup()));
                              },
                              child: const Text("Passwort vergessen?",
                                  style: AppTheme.textWhiteMid),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                CustomButtonAuth(
                  title: "Anmelden",
                  onPress: () {
                    ref
                        .watch(statusProvider.notifier)
                        .signInWithEmailAndPassword(
                            email: email.text.trim(),
                            password: password.text.trim());
                    Navigator.of(context).pop();
                  },
                  formKey: formKey,
                ),

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
                      style: AppTheme.textWhiteMid,
                    ),
                    InkWell(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Signup()),
                      ),
                      child: const Text(" Registieren",
                          style: AppTheme.whiteDefaultText),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
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
      color: AppTheme.primary,
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
