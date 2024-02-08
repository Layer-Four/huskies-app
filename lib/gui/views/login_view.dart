import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';

import 'package:huskies_app/gui/views/signup_view.dart';
import 'package:huskies_app/gui/views/widgets/custombuttonauth.dart';
import 'package:huskies_app/gui/views/widgets/navigation/nav_layer.dart';
import 'package:huskies_app/gui/views/widgets/textformfield.dart';
// import 'package:huskies_app/logic/helper/app_theme.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool registerClicked = false;

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

  // String? passwordValidator(String value) {
  //   if (value.isEmpty) {
  //     return 'Bitte gib ein Passwort ein';
  //   } else if (value.length < 6) {
  //     return 'Passwort muss mindestens 6 Zeichen lang sein';
  //   }

  //   return null;
  // }

  String? passwordValidator(value) {
    if (value!.isEmpty) {
      return "Enter Password";
    } else if (password.text.length < 6) {
      return "Password Length Should be more than 6 charachters";
    }
    return null;
  }

  @override
  void initState() {
    super.initState();
    registerClicked = false;
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
            Container(
              padding: const EdgeInsets.all(20),
              child: ListView(children: [
                Form(
                  key: formKey,
                  child: Column(
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
                      const SizedBox(
                        height: 40,
                      ),
                      const Text(
                        "Anmelden",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                      const SizedBox(
                        height: 14,
                      ),

                      Container(
                        margin: const EdgeInsets.only(bottom: 5),
                        child: const Text(
                          "E-Mail",
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                      ),
                      // SizedBox(
                      //   height: 40,
                      //   child: Form(
                      //     child: Column(
                      //       children: [
                      //         TextFormField(
                      //             decoration: AppTheme.textInputDecoration),
                      //         // Add more TextFormField widgets or other form fields as needed
                      //       ],
                      //     ),
                      //   ),
                      // ),

                      SizedBox(
                        // height: 40,
                        child: CustomeTextForm(
                          hinttext: "Email",
                          mycontroller: email,
                          validator: emailValidator,
                          onSaved: () => print('onsaved'),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 5, top: 20),
                        child: const Text(
                          "Passwort",
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        // height: 40,
                        child: CustomeTextForm(
                          hinttext: "Passwort",
                          mycontroller: password,
                          isPassword: true,
                          validator: passwordValidator,
                          onSaved: null,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 0),
                        alignment: Alignment.topRight,
                        child: TextButton(
                          onPressed: () => Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Signup(),
                            ),
                          ),
                          child: const Text(
                            "Passwort vergessen?",
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1),
                          ),
                        ),
                      ),
                      CustomButtonAuth(
                        title: "Anmelden",
                        onPress: () {
                          if (formKey.currentState!.validate()) {
                            // email.clear();
                            // password.clear();
                            // Validation successful, proceed with login
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ViewNavigator(),
                              ),
                            );
                          }
                        },
                        formKey: formKey,
                      ),
                    ],
                  ),
                ),

                const GoogleLogInButtonWidget(),
                Container(
                  height: 7,
                ),
                // Text("Don't Have An Account ? Resister" , textAlign: TextAlign.center,)
                GestureDetector(
                  onTap: () async {
                    // Navigate to Signup and wait for the result
                    bool? result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Signup(),
                      ),
                    );

                    // Update registerClicked based on the result and re-build the widget
                    setState(() {
                      print("Rebuilding widget tree");
                      registerClicked = result ?? false;
                    });
                  },
                  child: Center(
                    child: Text(
                      "Don't Have An Account ? Register",
                      style: TextStyle(
                        fontSize: 13,
                        letterSpacing: 1,
                        fontWeight: FontWeight.w500,
                        color: registerClicked ? Colors.green : Colors.white,
                      ),
                    ),
                  ),
                ),
              ]),
            )
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
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: MaterialButton(
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
      ),
    );
  }
}
