import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:huskies_app/gui/views/widgets/custombuttonauth.dart';
import 'package:huskies_app/gui/views/widgets/textformfield.dart';
import 'package:huskies_app/logic/helper/app_theme.dart';
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
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) => SafeArea(
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
                      crossAxisAlignment: AppTheme.crossStart,
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
                          "Registrieren",
                          style: AppTheme.textDefault,
                        ),
                        AppTheme.sizedBox14,
                        const Text(
                          "E-Mail",
                          style: AppTheme.textDefault,
                        ),
                        AppTheme.sizedBox14,
                        CustomeTextForm(
                          hinttext: "Email Eingeben",
                          mycontroller: email,
                          onSaved: null,
                        ),
                        AppTheme.sizedBox14,
                        const Text(
                          "Passwort",
                          style: AppTheme.textDefault,
                        ),
                        AppTheme.sizedBox14,
                        CustomeTextForm(
                          // hinttext: "Password Eingeben",
                          mycontroller: password, hinttext: 'passwort',
                          onSaved: null,
                        ),
                        AppTheme.sizedBox14,
                        const Text(
                          "Passwort bestätigen",
                          style: AppTheme.textDefault,
                        ),
                        AppTheme.sizedBox14,

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
                      formKey: formKey,
                      title: "Registrieren",
                      onPress: () async {
                        // Timer.periodic(Duration(seconds: 1), (_) {
                        //   if (ref.watch(appStateNotifierProvider).user != null) {
                        //     Navigator.of(context).pop();
                        //   }
                        // });
                        LoadingAnimationWidget.flickr(
                            leftDotColor: AppTheme.blueAccent,
                            rightDotColor: AppTheme.blueGrey,
                            size: 100);
                        final isfinished = await ref
                            .watch(appStateNotifierProvider.notifier)
                            .registerUserWithEmailAndPassword(
                                email: email.text, password: password.text);
                        // ignore: use_build_context_synchronously
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
                        Navigator.of(context).pop();
                      },
                      child: const Center(
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: "Haben Sie ein Account ? ",
                                style: AppTheme.textDefaultSmallW500,
                              ),
                              TextSpan(
                                  text: "Anmelden",
                                  style: AppTheme.textDefaultBlue),
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
