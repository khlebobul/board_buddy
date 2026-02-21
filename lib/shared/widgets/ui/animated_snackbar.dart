import 'package:board_buddy/config/theme/app_theme.dart';
import 'package:flutter/material.dart';

/// Animated SnackBar with fade and slide animations
class AnimatedSnackBar {
  static void show(
    BuildContext context, {
    required String message,
    Duration duration = const Duration(seconds: 3),
    Duration animationDuration = const Duration(milliseconds: 300),
  }) {
    final overlay = Overlay.of(context);
    late OverlayEntry overlayEntry;

    overlayEntry = OverlayEntry(
      builder: (context) => _AnimatedSnackBarWidget(
        message: message,
        duration: duration,
        animationDuration: animationDuration,
        onDismissed: () => overlayEntry.remove(),
      ),
    );

    overlay.insert(overlayEntry);
  }
}

class _AnimatedSnackBarWidget extends StatefulWidget {
  final String message;
  final Duration duration;
  final Duration animationDuration;
  final VoidCallback onDismissed;

  const _AnimatedSnackBarWidget({
    required this.message,
    required this.duration,
    required this.animationDuration,
    required this.onDismissed,
  });

  @override
  State<_AnimatedSnackBarWidget> createState() =>
      _AnimatedSnackBarWidgetState();
}

class _AnimatedSnackBarWidgetState extends State<_AnimatedSnackBarWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();

    Future.delayed(widget.duration, _dismiss);
  }

  void _dismiss() async {
    if (!mounted) return;
    await _controller.reverse();
    widget.onDismissed();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);
    final bottomPadding = MediaQuery.of(context).viewPadding.bottom;

    return Positioned(
      left: 16,
      right: 16,
      bottom: bottomPadding + 16,
      child: SlideTransition(
        position: _slideAnimation,
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: Material(
            color: Colors.transparent,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              decoration: BoxDecoration(
                color: theme.textColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                widget.message,
                style: theme.display6.copyWith(color: theme.fgColor),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
