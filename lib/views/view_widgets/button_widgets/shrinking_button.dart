import 'package:flutter/material.dart';
import 'package:huskies_app/constants/app_theme.dart';

class ShrinkinButton extends StatefulWidget {
  final Widget child;
  final VoidCallback? onTap;
  final Color color;
  final EdgeInsets padding;

  const ShrinkinButton({
    super.key,
    required this.child,
    this.onTap,
    this.color = AppTheme.primary,
    this.padding = AppTheme.padding12_8,
  });

  @override
  ShrinkinButtonState createState() => ShrinkinButtonState();
}

class ShrinkinButtonState extends State<ShrinkinButton> with SingleTickerProviderStateMixin {
  static const clickAnimationDurationMillis = 100;

  double _scaleTransformValue = 1;

  // needed for the "click" tap effect
  late final AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: clickAnimationDurationMillis),
      lowerBound: 0.0,
      upperBound: 0.05,
    )..addListener(() {
        setState(() => _scaleTransformValue = 1 - animationController.value);
      });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  void _shrinkButtonSize() {
    animationController.forward();
  }

  void _restoreButtonSize() {
    Future.delayed(
      const Duration(milliseconds: clickAnimationDurationMillis),
      () => animationController.reverse(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTap?.call();
        _shrinkButtonSize();
        _restoreButtonSize();
      },
      onTapDown: (_) => _shrinkButtonSize(),
      onTapCancel: _restoreButtonSize,
      child: Transform.scale(
        scale: _scaleTransformValue,
        child: Container(
          margin: AppTheme.padding12_8,
          padding: widget.padding,
          decoration: BoxDecoration(
            color: widget.color,
            borderRadius: AppTheme.lowRoundedCorner,
          ),
          child: widget.child,
        ),
      ),
    );
  }
}
