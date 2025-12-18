import 'dart:math';
import 'package:board_buddy/config/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Widget that represents a dice modal dialog.
class DiceModal extends StatefulWidget {
  /// The initial number on the dice to display.
  final int initialDiceNumber;

  /// Number of dice to show (1 or 2).
  final int diceCount;

  const DiceModal({
    required this.initialDiceNumber,
    this.diceCount = 1,
    super.key,
  });

  @override
  State<DiceModal> createState() => _DiceModalState();

  static void show(BuildContext context, {int diceCount = 1}) {
    final randomDice = (1 + Random().nextInt(6));

    HapticFeedback.selectionClick();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return DiceModal(
          initialDiceNumber: randomDice,
          diceCount: diceCount,
        );
      },
    );
  }
}

class _DiceModalState extends State<DiceModal>
    with SingleTickerProviderStateMixin {
  late int _diceNumber1;
  late int _diceNumber2;
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  bool _isRolling = false;

  @override
  void initState() {
    super.initState();
    _diceNumber1 = widget.initialDiceNumber;
    _diceNumber2 = 1 + Random().nextInt(6);
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.8).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _rollDice() async {
    if (_isRolling) return;
    _isRolling = true;

    HapticFeedback.selectionClick();

    await _controller.forward();

    const rollDuration = Duration(milliseconds: 400);
    const interval = Duration(milliseconds: 50);
    final stopwatch = Stopwatch()..start();

    while (stopwatch.elapsed < rollDuration) {
      setState(() {
        _diceNumber1 = 1 + Random().nextInt(6);
        if (widget.diceCount > 1) {
          _diceNumber2 = 1 + Random().nextInt(6);
        }
      });
      await Future.delayed(interval);
    }

    setState(() {
      _diceNumber1 = 1 + Random().nextInt(6);
      if (widget.diceCount > 1) {
        _diceNumber2 = 1 + Random().nextInt(6);
      }
    });

    await _controller.reverse();
    _isRolling = false;
  }

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);
    final diceSize = widget.diceCount > 1 ? 120.0 : 200.0;

    return GestureDetector(
      onTap: _rollDice,
      child: Dialog(
        backgroundColor: theme.bgColor,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: AnimatedBuilder(
            animation: _scaleAnimation,
            builder: (context, child) {
              return Transform.scale(
                scale: _scaleAnimation.value,
                child: widget.diceCount > 1
                    ? Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          DiceFace(
                            number: _diceNumber1,
                            size: diceSize,
                            dotColor: theme.textColor,
                          ),
                          const SizedBox(height: 24),
                          DiceFace(
                            number: _diceNumber2,
                            size: diceSize,
                            dotColor: theme.textColor,
                          ),
                        ],
                      )
                    : DiceFace(
                        number: _diceNumber1,
                        size: diceSize,
                        dotColor: theme.textColor,
                      ),
              );
            },
          ),
        ),
      ),
    );
  }
}

/// Widget that draws a dice face with dots.
class DiceFace extends StatelessWidget {
  final int number;
  final double size;
  final Color dotColor;

  const DiceFace({
    required this.number,
    this.size = 100,
    this.dotColor = Colors.black,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: _DiceDotsPainter(
        number: number,
        dotColor: dotColor,
      ),
    );
  }
}

class _DiceDotsPainter extends CustomPainter {
  final int number;
  final Color dotColor;

  _DiceDotsPainter({
    required this.number,
    required this.dotColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = dotColor
      ..style = PaintingStyle.fill;

    final dotRadius = size.width * 0.08;
    final padding = size.width * 0.22;

    final left = padding;
    final center = size.width / 2;
    final right = size.width - padding;
    final top = padding;
    final middle = size.height / 2;
    final bottom = size.height - padding;

    final positions = _getDotPositions(
      number,
      left: left,
      center: center,
      right: right,
      top: top,
      middle: middle,
      bottom: bottom,
    );

    for (final pos in positions) {
      canvas.drawCircle(pos, dotRadius, paint);
    }
  }

  List<Offset> _getDotPositions(
    int number, {
    required double left,
    required double center,
    required double right,
    required double top,
    required double middle,
    required double bottom,
  }) {
    switch (number) {
      case 1:
        return [Offset(center, middle)];
      case 2:
        return [
          Offset(left, top),
          Offset(right, bottom),
        ];
      case 3:
        return [
          Offset(left, top),
          Offset(center, middle),
          Offset(right, bottom),
        ];
      case 4:
        return [
          Offset(left, top),
          Offset(right, top),
          Offset(left, bottom),
          Offset(right, bottom),
        ];
      case 5:
        return [
          Offset(left, top),
          Offset(right, top),
          Offset(center, middle),
          Offset(left, bottom),
          Offset(right, bottom),
        ];
      case 6:
        return [
          Offset(left, top),
          Offset(right, top),
          Offset(left, middle),
          Offset(right, middle),
          Offset(left, bottom),
          Offset(right, bottom),
        ];
      default:
        return [];
    }
  }

  @override
  bool shouldRepaint(covariant _DiceDotsPainter oldDelegate) {
    return oldDelegate.number != number || oldDelegate.dotColor != dotColor;
  }
}
