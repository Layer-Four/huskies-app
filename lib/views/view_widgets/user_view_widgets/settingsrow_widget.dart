import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:huskies_app/constants/app_theme.dart';

class SettingsRow extends StatelessWidget {
  final Widget leadingIcon;
  final void Function()? onTextPressed;
  final String optionText;
  final Widget? endingWidget;
  final Widget Function(bool value, ValueChanged<bool> onChanged)? customSwitchBuilder;

  const SettingsRow({
    required this.leadingIcon,
    this.onTextPressed,
    required this.optionText,
    this.endingWidget,
    this.customSwitchBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: AppTheme.mainAlignBetween,
      children: [
        InkWell(
          onTap: onTextPressed,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(padding: AppTheme.paddingM, child: leadingIcon),
              Text(optionText),
            ],
          ),
        ),
        if (customSwitchBuilder != null)
          customSwitchBuilder!(false, (value) {
            // Add your logic here if needed
          }),
        if (endingWidget != null && customSwitchBuilder == null) endingWidget!,
      ],
    );
  }
}



class CustomCupertinoSwitch extends StatelessWidget {
  final bool value;
  final ValueChanged<bool>? onChanged;

  const CustomCupertinoSwitch({
    Key? key,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0), // Adjust the border radius as needed
        color: Colors.black, // Set the background color to black
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0), // Ensure circular edges for the switch
        child: CupertinoSwitch(
          value: value,
          onChanged: onChanged,
          activeColor: Colors.black, // Set the active color to black
          trackColor: Colors.black, // Set the track color to black
          thumbColor: CupertinoDynamicColor.resolve(
            CupertinoColors.systemBackground,
            context,
          ),
        ),
      ),
    );
  }
}