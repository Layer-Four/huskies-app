import 'package:flutter/material.dart';

class ErgebnissePage extends StatefulWidget {
  const ErgebnissePage({super.key});

  @override
  State<ErgebnissePage> createState() => _ErgebnissePageState();
}

class _ErgebnissePageState extends State<ErgebnissePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      appBar: AppBar(),
      body: const Center(
        child: Text("HomePage"),
      ),
    );
  }
}
