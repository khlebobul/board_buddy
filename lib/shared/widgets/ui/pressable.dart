import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:motor/motor.dart';

class Pressable extends StatefulWidget {
  final VoidCallback? onTap;
  final Widget child;
  final HitTestBehavior behavior;

  const Pressable({
    super.key,
    this.onTap,
    this.behavior = HitTestBehavior.opaque,
    required this.child,
  });

  @override
  State<Pressable> createState() => _PressableState();
}

class _PressableState extends State<Pressable> {
  double _scale = 1;

  Motion get _motion {
    return switch (defaultTargetPlatform) {
      TargetPlatform.iOS ||
      TargetPlatform.macOS =>
        const CupertinoMotion.smooth(),
      _ => const MaterialSpringMotion.standardSpatialFast(),
    };
  }

  void _setPressed(bool pressed) {
    setState(() => _scale = pressed ? 0.96 : 1);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: widget.behavior,
      onTap: widget.onTap,
      onTapDown: widget.onTap == null ? null : (_) => _setPressed(true),
      onTapUp: widget.onTap == null ? null : (_) => _setPressed(false),
      onTapCancel: widget.onTap == null ? null : () => _setPressed(false),
      child: SingleMotionBuilder(
        motion: _motion,
        value: _scale,
        builder: (context, scale, child) {
          return Transform.scale(
            key: const ValueKey('pressable-transform'),
            scale: scale,
            child: child,
          );
        },
        child: widget.child,
      ),
    );
  }
}
