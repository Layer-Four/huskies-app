import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:huskies_app/provider/static_provider.dart';
import 'package:huskies_app/views/auth_view/login_view.dart';
import 'package:huskies_app/views/view_widgets/custombuttonauth.dart';
import 'package:huskies_app/views/view_widgets/textformfield.dart';

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
                        "Registrieren",
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
                        hinttext: "Email eingeben",
                        mycontroller: email,
                        onSaved: null,
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
                        // hinttext: "Password Eingeben",
                        mycontroller: password, hinttext: 'passwort',
                        onSaved: null,
                      ),
                      const SizedBox(
                        height: 11,
                      ),
                      const Text(
                        "Passwort bestätigen",
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
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
                              style: TextStyle(color: Colors.white),
                            ),
                            TextSpan(
                                text: "Anmelden",
                                style: TextStyle(
                                    color: Colors.white,
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
