import 'package:flutter/material.dart';
import 'package:huskies_app/constants/app_theme.dart';
import 'package:huskies_app/views/view_widgets/symetric_button_widget.dart';

class AcceptOrReturnWidget extends StatelessWidget {
  const AcceptOrReturnWidget({
    super.key,
    this.onPressed,
  });

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppTheme.paddingTb12_20,
      child: Row(
        mainAxisAlignment: AppTheme.mainAlignAround,
        children: [
          SymetricButton(
            color: AppTheme.red,
            text: 'Zurück',
            onPressed: () => Navigator.of(context).pop(),
          ),
          SymetricButton(
            color: AppTheme.green,
            text: 'Ändern',
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }
}
