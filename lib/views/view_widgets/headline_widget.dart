import 'package:flutter/material.dart';
import 'package:huskies_app/constants/app_theme.dart';

class HeadWidget extends StatelessWidget {
  final Widget? start;
  final Widget center;
  final Widget? end;

  const HeadWidget({
    super.key,
    this.start,
    this.end,
    required this.center,
  });
  @override
  Widget build(BuildContext context) => Padding(
        padding: AppTheme.paddingM,
        child: Row(
          mainAxisAlignment: AppTheme.mainAlignBetween,
          children: [
            SizedBox(width: start == null ? AppTheme.big50 : null, child: start),
            center,
            SizedBox(width: end == null ? AppTheme.big50 : null, child: end),
          ],
        ),
      );
}
