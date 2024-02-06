import 'package:flutter/material.dart';
import 'package:huskies_app/logic/helper/app_theme.dart';

class BarcodeView extends StatelessWidget {
  final Image barcode;
  const BarcodeView({super.key, required this.barcode});

  @override
  Widget build(BuildContext context) => Container(
        margin: AppTheme.paddingS,
        height: 90,
        width: double.infinity,
        child: Card(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(12),
            bottomRight: Radius.circular(12),
          )),
          semanticContainer: false,
          elevation: 3,
          color: AppTheme.ticketBackground,
          child: Padding(
            padding: AppTheme.boxPadding,
            child: barcode,
          ),
        ),
      );
}
