import 'package:flutter/material.dart';

class CustomeTextForm extends StatelessWidget {
  final String? hinttext;
  final TextEditingController mycontroller;

  const CustomeTextForm({
    super.key,
    this.hinttext,
    required this.mycontroller,
  });

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formstate = GlobalKey();

    return SizedBox(
      height: 38,
      child: Form(
        key: formstate,
        child: TextFormField(
          validator: (value) {
            if (value!.isEmpty) {
              return "leere Field bitte ausfüllen";
            }
            if (value.length > 10) {
              return "bitte gebe Sie nicht mehr als 10 Zeichen";
            }
            return null;
          },
          controller: mycontroller,
          decoration: InputDecoration(
            hintText: hinttext,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            filled: true,
            fillColor: Colors.grey[300],
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
        ),
        // MaterialButton(textColor: Colors.white,color: Colors.red,
        // onPressed:(){
        //   if(formstate.currentState!.validate()){print('valid');}else
        // } ,);
      ),
    );
  }
}
