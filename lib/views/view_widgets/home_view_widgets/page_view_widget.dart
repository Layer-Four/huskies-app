import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:huskies_app/constants/app_theme.dart';

class UserInfoWidget extends StatelessWidget {
  const UserInfoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppTheme.whiteBox,
      margin: AppTheme.pointsBoxPadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              Padding(
                padding: AppTheme.paddingL,
                child: Container(
                  decoration: AppTheme.pointsBoxLayout,
                  child: const ColorFiltered(
                    colorFilter: ColorFilter.mode(
                      AppTheme.red, // Change the color of the icon here
                      BlendMode.srcIn,
                    ),
                    child: Icon(
                      FontAwesome5.database,
                      size: 20,
                    ),
                  ),
                ),
              ),
              const Column(
                mainAxisAlignment: AppTheme.mainAlignCenter,
                crossAxisAlignment: AppTheme.crossAlignStart,
                children: [
                  Text('My Points'),
                  Text(
                    '230',
                    style: AppTheme.textDefaultTeal,
                  ),
                ],
              ),
            ],
          ),
          //middle of white box
          Padding(
            padding: const EdgeInsets.only(right: 2.0),
            child: Container(
              height: 44,
              width: 1,
              color: Colors.red.withOpacity(0.4),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 12),
                child: Container(
                  decoration: AppTheme.pointsBoxDesgin,
                  child: const ColorFiltered(
                    colorFilter: ColorFilter.mode(
                      AppTheme.red, // Change the color of the icon here
                      BlendMode.srcIn,
                    ),
                    child: Icon(
                      FontAwesome5.medal,
                      size: 20,
                    ),
                  ),
                ),
              ),
              const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Level'),
                  Text(
                    'Pro',
                    style: AppTheme.textDefaultTeal,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
