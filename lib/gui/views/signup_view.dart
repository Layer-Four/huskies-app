import 'package:flutter/material.dart';
import 'package:huskies_app/auth/components/custombuttonauth.dart';
import 'package:huskies_app/auth/components/textformfield.dart';
import 'package:huskies_app/gui/views/login_view.dart';

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
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
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
                    width: 140,
                    height: 140,
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
                Text(
                  widget.isPWForget ? 'Passwort zurücksetzten' : "Registrieren",
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),

                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text("E-Mail", style: TextStyle(fontSize: 14)),
                ),

                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: CustomeTextForm(hinttext: "Email", mycontroller: email),
                ),
              ],
            ),
            CustomButtonAuth(
              title: "Registrieren",
              onPress: () {},
            ),

            Container(height: 20),

            Container(height: 20),
            // Text("Don't Have An Account ? Resister" , textAlign: TextAlign.center,)
            InkWell(
              onTap: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => const LoginView()));
              },
              child: const Center(
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "haben Sie ein Account ? ",
                      ),
                      TextSpan(
                          text: "Anmelden",
                          style: TextStyle(
                              color: Color.fromARGB(255, 22, 63, 92), fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
