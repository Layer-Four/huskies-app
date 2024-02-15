import 'package:flutter/material.dart';
import 'package:huskies_app/constants/app_theme.dart';

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
