import 'package:flutter/material.dart';
import 'package:huskies_app/constants/app_theme.dart';

class CustomButtonAuth extends StatelessWidget {
  final String title;
  final void Function()? onPress;
  // final GlobalKey<FormState> formKey;
  const CustomButtonAuth({
    super.key,
    required this.title,
    this.onPress,
    required GlobalKey<FormState> formKey,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 40,
      shape: OutlineInputBorder(
        borderRadius: AppTheme.defaultM,
        borderSide: const BorderSide(
          color: Colors.transparent,
          width: 1,
        ),
      ),
      color: AppTheme.customButton,
      onPressed: onPress,
      child: Text(
        title,
        style: AppTheme.whiteTextStyle,
      ),
    );
  }
}
