import 'package:flutter/material.dart';

class CustomeTextForm extends StatelessWidget {
  final String hinttext;
  final TextEditingController mycontroller;

  const CustomeTextForm({
    Key? key,
    required this.hinttext,
    required this.mycontroller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: mycontroller,
      decoration: InputDecoration(
        hintText: hinttext,
        contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        filled: true,
        fillColor: Colors.grey[200],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
      ),
    );
  }
}
