import 'package:flutter/material.dart';
import 'package:huskies_app/logic/helper/app_theme.dart';

class CustomeTextForm extends StatefulWidget {
  final bool isPassword;
  final String hinttext;
  final TextEditingController mycontroller;
  final String? Function(String?)? validator;

  const CustomeTextForm({
    super.key,
    required this.hinttext,
    required this.mycontroller,
    this.isPassword = false,
    this.validator,
    required onSaved,
  });

  @override
  State<CustomeTextForm> createState() => _CustomeTextFormState();
}

class _CustomeTextFormState extends State<CustomeTextForm> {
  GlobalKey<FormState> formstate = GlobalKey();

  @override
  Widget build(BuildContext context) => Form(
        autovalidateMode: AutovalidateMode.always,
        key: formstate,
        child: TextFormField(
          validator: widget.validator,
          controller: widget.mycontroller,
          decoration: AppTheme.textInputDecoration,
          obscureText: widget.isPassword,
        ),
      );
}

        //  InputDecoration(
        //   hintText: hinttext,
        //   contentPadding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
        //   filled: true,
        //   fillColor: Colors.grey[200],
        //   border: OutlineInputBorder(
        //     borderRadius: BorderRadius.circular(10),
        //     borderSide: const BorderSide(color: Colors.transparent),
        //   ),
        //   focusedBorder: OutlineInputBorder(
        //     borderRadius: BorderRadius.circular(10),
        //     borderSide: const BorderSide(color: Colors.grey),
        //   ),
        //   enabledBorder: OutlineInputBorder(
        //     borderRadius: BorderRadius.circular(10),
        //     borderSide: const BorderSide(color: Colors.transparent),
        //   ),
        //   errorBorder: OutlineInputBorder(
        //     borderRadius: BorderRadius.circular(10),
        //     borderSide: const BorderSide(color: Colors.transparent),
        //   ),
        // ),