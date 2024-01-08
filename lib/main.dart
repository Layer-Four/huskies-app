import 'package:flutter/material.dart';
import 'package:huskies_app/layout.dart';
import 'package:huskies_app/views/login.dart';
import 'package:huskies_app/views/signup.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ViewNavigator(),
      ),
    );
  }
}
