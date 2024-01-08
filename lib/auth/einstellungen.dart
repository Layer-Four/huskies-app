import 'package:flutter/material.dart';

class EinstellungPage extends StatefulWidget {
  const EinstellungPage({super.key});

  @override
  State<EinstellungPage> createState() => _EinstellungPageState();
}

class _EinstellungPageState extends State<EinstellungPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellowAccent,
      appBar: AppBar(),
      body: const Center(
        child: Text("HomePage"),
      ),
    );
  }
}
