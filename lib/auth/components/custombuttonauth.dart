import 'package:flutter/material.dart';

class CustomButtonAuth extends StatefulWidget {
  final String title;
  final void Function()? onPress;
  final GlobalKey<FormState> formKey;

  CustomButtonAuth({
    super.key,
    required this.title,
    this.onPress,
    required this.formKey,
  });

  @override
  State<CustomButtonAuth> createState() => _CustomButtonAuthState();
}

class _CustomButtonAuthState extends State<CustomButtonAuth> {
  bool isPasswordValid = false;
  bool isEmaildValid = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: MaterialButton(
        height: 40,
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(13),
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
        ),
        color: const Color.fromARGB(255, 22, 63, 92),
        onPressed: widget.onPress,
        // widget.onPress != null
        //     ? () {
        //         if () {
        //           print('Valid');
        //           widget.onPress!();
        //         } else {
        //           print('Not valid');
        //         }
        //       }
        //     : null,
        child: Text(
          widget.title,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
