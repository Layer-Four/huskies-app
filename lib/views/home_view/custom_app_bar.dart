import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:huskies_app/constants/app_theme.dart';
import 'package:huskies_app/views/view_widgets/user_view_widgets/user_icon_widget.dart';
import 'package:huskies_app/provider/user_provider/user_provider.dart';

class CustomAppBar extends ConsumerStatefulWidget {
  const CustomAppBar({super.key});

  @override
  ConsumerState<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends ConsumerState<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userProvider);

    return AppBar(
      iconTheme: const IconThemeData(color: Colors.white),
      backgroundColor: AppTheme.primary,
      toolbarHeight: 70,
      title: Row(
        children: [
          const UserIconWidget(),
          const SizedBox(
            width: 6,
          ),
          Text(
            "Hallo ${user?.displayedName?.split(',').first ?? ''}",
            style: AppTheme.titleWhite,
          ),
          user?.displayedName != null
              ? const Text(
                  "Willkommon zurück!",
                  style: AppTheme.whiteDefaultText,
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
