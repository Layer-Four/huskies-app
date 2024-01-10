import 'package:flutter/material.dart';
import 'package:huskies_app/gui/views/widgets/user_icon_widget.dart';
import 'package:huskies_app/logic/helper/app_theme.dart';

class HeadWidget extends StatelessWidget {
  final Widget? leading;
  final String title;
  final String? image;

  const HeadWidget({
    super.key,
    this.leading,
    this.image,
    required this.title,
  });

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(width: leading == null ? 30 : null, child: leading),
          Text(
            title,
            style: AppTheme.titleStyle,
          ),
          UserIconWidget(image: image),
        ],
      );
}
