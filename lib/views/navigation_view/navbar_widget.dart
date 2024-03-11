import 'package:flutter/material.dart';
import 'package:huskies_app/constants/app_theme.dart';

class NavBarIconWidget extends StatelessWidget {
  final void Function()? onPressed;
  final IconData icon;
  final bool isCurrentView;
  const NavBarIconWidget(
      {super.key, required this.icon, this.onPressed, this.isCurrentView = false});

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: onPressed,
        child: Column(
          mainAxisAlignment: AppTheme.mainAlignEvenly,
          children: [
            isCurrentView
                ? Container(
                    width: 30,
                    decoration: BoxDecoration(
                      borderRadius: AppTheme.lowRoundedCorner,
                      border: Border.all(width: 1.5, color: AppTheme.white),
                    ),
                  )
                : const SizedBox(),
            SizedBox(
              height: 35,
              child: Column(
                mainAxisAlignment: AppTheme.mainAlignCenter,
                children: [Icon(size: 20, icon), const Text('', style: AppTheme.textSmallWhite)],
              ),
            ),
          ],
        ),
      );
}
