import 'package:flutter/material.dart';

class UserIconWidget extends StatelessWidget {
  final String? image;
  const UserIconWidget({super.key, this.image});

  @override
  Widget build(context) {
    return Container(
      margin: const EdgeInsets.only(right: 20),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(45)),
      child: image != null
          ? Image.asset(
              'assets/$image',
              width: 45,
            )
          : null,
    );
  }
}
