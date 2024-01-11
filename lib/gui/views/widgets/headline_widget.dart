import 'package:flutter/material.dart';
import 'package:huskies_app/logic/helper/app_theme.dart';

class HeadWidget extends StatelessWidget {
  final Widget? leading;
  final Widget title;
  final Widget? end;

  const HeadWidget({
    super.key,
    this.leading,
    this.end,
    required this.title,
  });

  @override
  Widget build(BuildContext context) => Padding(
        padding: AppTheme.mediumPadding,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(width: leading == null ? 40 : null, child: leading),
            title,
            SizedBox(width: end == null ? 40 : null, child: end),
          ],
        ),
      );
}
