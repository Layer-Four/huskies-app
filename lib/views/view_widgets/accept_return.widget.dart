import 'package:flutter/material.dart';
import 'package:huskies_app/constants/app_theme.dart';
import 'package:huskies_app/views/view_widgets/blue_button_widget.dart';

class AcceptOrReturnWidget extends StatelessWidget {
  const AcceptOrReturnWidget({
    super.key,
    this.onPressed,
  });

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: AppTheme.mainAround,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: SymetricButton(
            color: AppTheme.red,
            text: 'Abbruch',
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(top: 20),
          width: 100,
          child: SymetricButton(
            color: Colors.green,
            text: 'Ändern',
            onPressed: onPressed,
          ),
        ),
      ],
    );
  }
}
