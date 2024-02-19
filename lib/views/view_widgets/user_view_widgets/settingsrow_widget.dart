import 'package:flutter/material.dart';
import 'package:huskies_app/constants/app_theme.dart';

class SettingsRow extends StatelessWidget {
  final Widget leadingIcon;
  final void Function()? onTextPressed;
  final String optionText;
  final Widget? endingWidget;
  final Widget endIcon;
  const SettingsRow({
    super.key,
    this.endIcon = const Icon(Icons.arrow_right, size: AppTheme.big50),
    this.endingWidget,
    required this.leadingIcon,
    this.onTextPressed,
    required this.optionText,
  });
  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: AppTheme.mainAlignBetween,
        children: [
          InkWell(
            onTap: onTextPressed,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(padding: AppTheme.padding12_8, child: leadingIcon),
                Text(optionText),
              ],
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: endingWidget,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 24),
                child: endIcon,
              ),
            ],
          ),
        ],
      );
}
