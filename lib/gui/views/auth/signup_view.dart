import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:huskies_app/gui/views/auth/login_view.dart';
import 'package:huskies_app/gui/views/widgets/custombuttonauth.dart';
import 'package:huskies_app/gui/views/widgets/textformfield.dart';
import 'package:huskies_app/logic/provider/notifier.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

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
                              fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),
                        ),
                        const SizedBox(
                          height: 14,
                        ),

                        const Text(
                          "E-Mail",
                          style: TextStyle(
                              fontSize: 13, color: Colors.white, fontWeight: FontWeight.w300),
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
                              fontSize: 13, color: Colors.white, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 4,
                        ),

                        CustomeTextForm(
                          // hinttext: "Password Eingeben",
                          mycontroller: password, hinttext: 'passwort',
                        ),
                        const SizedBox(
                          height: 11,
                        ),
                        const Text(
                          "Passwort bestätigen",
                          style: TextStyle(
                              fontSize: 13, color: Colors.white, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 4,
                        ),

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
                        // Timer.periodic(Duration(seconds: 1), (_) {
                        //   if (ref.watch(appStateNotifierProvider).user != null) {
                        //     Navigator.of(context).pop();
                        //   }
                        // });
                        LoadingAnimationWidget.flickr(
                            leftDotColor: Colors.blueAccent,
                            rightDotColor: Colors.blueGrey,
                            size: 100);
                        final isfinished = await ref
                            .watch(appStateNotifierProvider.notifier)
                            .registerUserWithEmailAndPassword(
                                email: email.text, password: password.text);
                        if (isfinished) Navigator.of(context).pop();
                      },
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
                                  style:
                                      TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
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
