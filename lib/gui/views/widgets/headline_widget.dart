import 'package:flutter/material.dart';

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
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(width: leading == null ? 40 : null, child: leading),
            title,
            SizedBox(width: leading == null ? 40 : null, child: end),
          ],
        ),
      );
}
