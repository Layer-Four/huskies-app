import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:huskies_app/constants/app_theme.dart';
import 'package:huskies_app/provider/user_provider/user_provider.dart';
import 'package:huskies_app/views/auth_view/login_view.dart';
import 'package:huskies_app/views/user_views/user_view.dart';

class UserIconWidget extends ConsumerWidget {
  final void Function()? onPressed;
  const UserIconWidget({super.key, this.onPressed});

  @override
  Widget build(context, ref) {
    final user = ref.watch(userProvider);
    return Padding(
      padding: AppTheme.paddingM,
      child: InkWell(
        onTap: onPressed ??
            () {
              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) =>
                        user != null ? const UserProfileView() : const LoginView()),
              );
            },
        child: Container(
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(shape: BoxShape.circle),
          child: user?.userImageUrl == null
              ? Image.asset('assets/user.png', width: 50, height: 50)
              : Image.network(user!.userImageUrl!, width: 50, height: 50),
        ),
      ),
    );
  }
}
