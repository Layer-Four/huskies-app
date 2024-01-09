import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:huskies_app/auth/components/custombuttonauth.dart';
import 'package:huskies_app/auth/components/textformfield.dart';
import 'package:huskies_app/views/signup_view.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

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

                      const Text(
                        "E-Mail",
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.white,
                            fontWeight: FontWeight.w300),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      CustomeTextForm(
                        hinttext: "Email Eingeben",
                        mycontroller: email,
                      ),

                      const SizedBox(
                        height: 11,
                      ),
                      const Text(
                        "Passwort",
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 4,
                      ),

                      CustomeTextForm(
                          hinttext: "Password Eingeben",
                          mycontroller: password),
                      Container(
                        margin: const EdgeInsets.only(top: 10, bottom: 20),
                        alignment: Alignment.bottomRight,
                        child: const Text(
                          "Passwort vergessen?",
                          style: TextStyle(fontSize: 11, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  CustomButtonAuth(
                    title: "Anmelden",
                    onPress: () {},
                  ),

                  Container(height: 20),

                  MaterialButton(
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
                          Icon(FontAwesome5.google)
                        ],
                      )),
                  Container(height: 20),
                  // Text("Don't Have An Account ? Resister" , textAlign: TextAlign.center,)
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const Signup()), // Navigate to SignUp page
                      );
                    },
                    child: const Center(
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: "Don't Have An Account ? ",
                            ),
                            TextSpan(
                                text: "Register",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 22, 63, 92),
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
