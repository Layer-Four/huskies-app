import 'package:flutter/material.dart';
import 'package:huskies_app/widgets/nav_layer.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: ViewNavigator(),
        ),
      ),
    );
  }
}
