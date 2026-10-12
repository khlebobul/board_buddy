import 'package:flutter/material.dart';

// System chrome sits outside the real app's safe area.
class DuoSystemBars extends StatelessWidget {
  const DuoSystemBars({super.key, required this.outer, required this.dark});
  final bool outer;
  final bool dark;

  @override
  Widget build(BuildContext context) {
    final color = dark ? Colors.white : Colors.black;
    final status = [
      Text('9:41',
          style: TextStyle(
              fontFamily: 'RobotoMono',
              fontSize: 13,
              decoration: TextDecoration.none,
              fontWeight: FontWeight.w600,
              color: color)),
      CustomPaint(size: const Size(18, 16), painter: _StatusIcon(color, false)),
      CustomPaint(size: const Size(24, 12), painter: _StatusIcon(color, true)),
    ];
    return Stack(children: [
      if (outer) ...[
        Positioned(
            top: 24,
            right: 29.5,
            child: Container(
                width: 37,
                height: 37,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                        colors: [Color(0xff242932), Color(0xff050505)])))),
        Positioned(
            top: 75,
            right: 24,
            width: 48,
            height: 86,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: status)),
        Positioned(
            right: 45,
            bottom: 24,
            width: 5,
            height: 100,
            child: DecoratedBox(
                decoration: BoxDecoration(
                    color: color, borderRadius: BorderRadius.circular(3)))),
      ] else ...[
        Positioned(
            top: 0,
            right: 24,
            width: 92,
            height: 48,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: status)),
        Positioned(
            bottom: 8,
            left: 267,
            width: 135,
            height: 5,
            child: DecoratedBox(
                decoration: BoxDecoration(
                    color: color, borderRadius: BorderRadius.circular(3)))),
      ],
    ]);
  }
}

class _StatusIcon extends CustomPainter {
  _StatusIcon(this.color, this.battery);
  final Color color;
  final bool battery;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;
    if (battery) {
      paint
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1;
      canvas.drawRRect(
          RRect.fromRectAndRadius(
              Rect.fromLTWH(0, 1, 21, 10), const Radius.circular(2)),
          paint);
      paint.style = PaintingStyle.fill;
      canvas.drawRRect(
          RRect.fromRectAndRadius(
              Rect.fromLTWH(2, 3, 17, 6), const Radius.circular(1)),
          paint);
      canvas.drawRect(const Rect.fromLTWH(22, 4, 2, 4), paint);
    } else {
      paint
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2
        ..strokeCap = StrokeCap.round;
      for (final radius in [8.0, 5.0]) {
        canvas.drawArc(
            Rect.fromCircle(center: const Offset(9, 14), radius: radius),
            -2.35,
            1.56,
            false,
            paint);
      }
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(const Offset(9, 13), 1.5, paint);
    }
  }

  @override
  bool shouldRepaint(_StatusIcon old) =>
      old.color != color || old.battery != battery;
}
