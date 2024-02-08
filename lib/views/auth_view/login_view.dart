import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
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
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Colors.white,
        body: Stack(
          children: [
            Opacity(
              opacity: 0.7,
              child: Image.asset(
                "assets/background_image.jpg",
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
                width: double.infinity,
                // height: double.infinity,
              ),
            ),
            Container(color: const Color.fromARGB(129, 0, 0, 0)),
            Center(
              child: Container(
                padding: const EdgeInsets.all(20),
                child: Form(
                  key: formKey,
                  child: ListView(children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                        const SizedBox(height: 40),
                        const Text(
                          "Anmelden",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                        const SizedBox(height: 14),
                        const Text("E-Mail", style: TextStyle(fontSize: 14)),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: CustomeTextForm(
                            hinttext: "Email",
                            mycontroller: email,
                            validator: emailValidator,
                            onSaved: null,
                          ),
                        ),
                        const Text("Passwort", style: TextStyle(fontSize: 14)),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              CustomeTextForm(
                                validator: passwordValidator,
                                hinttext: "Passwort",
                                mycontroller: password,
                                isPassword: true,
                                onSaved: null,
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.only(top: 10, bottom: 20),
                                alignment: Alignment.bottomRight,
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const Signup()));
                                  },
                                  child: const Text("Passwort vergessen?",
                                      style: TextStyle(fontSize: 10)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    CustomButtonAuth(
                      formKey: formKey,
                      title: "Anmelden",
                      onPress: () {
                        if (formKey.currentState!.validate()) {
                          ref
                              .watch(statusProvider.notifier)
                              .signInWithEmailAndPassword(
                                  email: email.text.trim(),
                                  password: password.text.trim());
                        }
                        email.clear();
                        password.clear();
                      },
                    ),

                    const Padding(
                      padding: EdgeInsets.all(20.0),
                      child: GoogleLogInButtonWidget(),
                    ),
                    // Text("Don't Have An Account ? Resister" , textAlign: TextAlign.center,)
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Signup()));
                      },
                      child: const Center(
                        child: Text.rich(
                          TextSpan(
                            text: "Sie haben noch kein Account? ",
                            style: TextStyle(fontSize: 13),
                            children: [
                              TextSpan(
                                  text: "Register",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 22, 63, 92),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ]),
                ),
              ),
            ),
          ],
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
        borderRadius: BorderRadius.circular(13),
      ),
      color: const Color.fromARGB(255, 22, 63, 92),
      textColor: Colors.white,
      onPressed: () {},
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Login With Google  "),
          Icon(FontAwesome5.google),
        ],
      ),
    );
  }
}
