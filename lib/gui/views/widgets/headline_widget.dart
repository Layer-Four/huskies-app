import 'package:flutter/material.dart';
import 'package:huskies_app/gui/views/widgets/user_icon_widget.dart';

class HeadWidget extends StatelessWidget {
  final Widget? leading;
  final Widget title;
  final String? image;

  const HeadWidget({
    super.key,
    this.leading,
    this.image,
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
            UserIconWidget(image: image),
          ],
        ),
      );
}
