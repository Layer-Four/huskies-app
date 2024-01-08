import 'package:flutter/material.dart';
import 'package:huskies_app/layout.dart';
import 'package:huskies_app/views/login.dart';
import 'package:huskies_app/views/signup.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const Scaffold(
          backgroundColor: Color.fromARGB(255, 22, 63, 92),
          body: SafeArea(
            child: ViewNavigator(),
          ),
        ),
        routes: {
          "signup": (context) => const Signup(),
          "login": (context) => const Login()
        });
  }
}
