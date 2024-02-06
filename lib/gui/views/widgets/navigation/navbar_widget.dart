import 'package:flutter/material.dart';
import 'package:huskies_app/logic/helper/app_theme.dart';

class NavBarIconWidget extends StatelessWidget {
  final void Function()? onPressed;
  final IconData icon;
  final String name;
  final bool isCurrentView;
  const NavBarIconWidget(
      {super.key,
      required this.icon,
      required this.name,
      required this.onPressed,
      this.isCurrentView = false});

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: onPressed,
        child: Column(
          mainAxisAlignment: AppTheme.mainEvenly,
          children: [
            isCurrentView
                ? Container(
                    width: 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      border: Border.all(width: 1.5, color: AppTheme.white),
                    ),
                  )
                : const SizedBox(),
            SizedBox(
              height: 45,
              child: Column(
                mainAxisAlignment: AppTheme.mainCenter,
                children: [
                  Icon(
                    size: 25,
                    color: AppTheme.white,
                    icon,
                  ),
                  Text(
                    name,
                    style: AppTheme.textDefaultSmall10,
                  )
                ],
              ),
            ),
          ],
        ),
      );
}
