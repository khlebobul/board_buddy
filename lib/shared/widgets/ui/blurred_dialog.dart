import 'package:board_buddy/config/theme/app_theme.dart';
import 'package:flutter/material.dart';

/// A dialog with a blurred scrollable content area that automatically adjusts its height.
class BlurredDialog extends StatelessWidget {
  /// The title of the dialog.
  final Widget? title;

  /// The content widgets to display in the dialog.
  final List<Widget> children;

  /// The background color of the dialog.
  final Color? backgroundColor;

  /// The maximum height of the dialog as a fraction of screen height.
  final double maxHeightFactor;

  /// Whether to constrain minimum height or allow it to shrink fully.
  final bool allowCompactHeight;

  /// Additional padding for the dialog content.
  final EdgeInsetsGeometry contentPadding;

  const BlurredDialog({
    super.key,
    this.title,
    required this.children,
    this.backgroundColor,
    this.maxHeightFactor = 0.8,
    this.allowCompactHeight = true,
    this.contentPadding = const EdgeInsets.all(8.0),
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final themeUI = UIThemes.of(context);
    final screenHeight = MediaQuery.of(context).size.height;
    final dialogColor =
        backgroundColor ?? theme.dialogTheme.backgroundColor ?? themeUI.bgColor;

    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 30),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: screenHeight * maxHeightFactor,
              minHeight: allowCompactHeight ? 0 : screenHeight * 0.3,
            ),
            child: IntrinsicHeight(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Close button at the top
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 16),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Icon(Icons.close, color: theme.hintColor),
                      ),
                    ),
                  ),

                  // Optional title
                  if (title != null)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: title!,
                    ),

                  // Content area
                  Flexible(
                    child: ShaderMask(
                      shaderCallback: (Rect bounds) {
                        return LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            dialogColor.withValues(alpha: 0.0),
                            dialogColor.withValues(alpha: 1.0),
                            dialogColor.withValues(alpha: 1.0),
                            dialogColor.withValues(alpha: 0.0),
                          ],
                          stops: const [0.0, 0.03, 0.97, 1.0],
                        ).createShader(bounds);
                      },
                      blendMode: BlendMode.dstIn,
                      child: SingleChildScrollView(
                        clipBehavior: Clip.hardEdge,
                        physics: const BouncingScrollPhysics(),
                        padding: EdgeInsets.only(
                          left: contentPadding.horizontal / 2,
                          right: contentPadding.horizontal / 2,
                          top: 4,
                          bottom: 24,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: children,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
