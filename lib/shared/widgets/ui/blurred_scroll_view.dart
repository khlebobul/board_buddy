import 'package:flutter/material.dart';

/// A scrollable view with blur effects at the top and bottom edges.
class BlurredScrollView extends StatelessWidget {
  /// The child widgets to display in the scrollable view.
  final List<Widget> children;

  /// Color for the gradient mask.
  final Color maskColor;

  /// The padding to apply around the scroll view.
  final EdgeInsetsGeometry? padding;

  /// Physics for the scroll view.
  final ScrollPhysics? physics;

  const BlurredScrollView({
    super.key,
    required this.children,
    required this.maskColor,
    this.padding,
    this.physics,
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            maskColor.withValues(alpha: 0.0),
            maskColor.withValues(alpha: 1.0),
            maskColor.withValues(alpha: 1.0),
            maskColor.withValues(alpha: 0.0),
          ],
          stops: const [0.0, 0.05, 0.95, 1.0],
        ).createShader(bounds);
      },
      blendMode: BlendMode.dstIn,
      child: SingleChildScrollView(
        physics: physics ?? const BouncingScrollPhysics(),
        padding: padding ??
            EdgeInsets.zero + const EdgeInsets.symmetric(vertical: 20),
        clipBehavior: Clip.hardEdge,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: children,
        ),
      ),
    );
  }
}
