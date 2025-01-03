import '../utils/library.dart';

class PlayerPicker extends StatefulWidget {
  final int maxPlayers;
  final ValueChanged<int> onValueChanged;

  const PlayerPicker(
      {super.key, required this.maxPlayers, required this.onValueChanged});

  @override
  PlayerPickerState createState() => PlayerPickerState();
}

class PlayerPickerState extends State<PlayerPicker> {
  int _currentValue = 1;
  late double _angle;
  int? _lastValue;

  @override
  void initState() {
    super.initState();
    _angle = -pi / 2;
    _lastValue = _currentValue;
  }

  void _updateValue(Offset localPosition) {
    RenderBox box = context.findRenderObject() as RenderBox;
    Offset center = box.size.center(Offset.zero);
    Offset offset = localPosition - center;
    double newAngle = atan2(offset.dy, offset.dx);

    setState(() {
      _angle = newAngle;
      double stepAngle = 2 * pi / widget.maxPlayers;
      int newValue =
          ((newAngle + pi / 2) / stepAngle).round() % widget.maxPlayers;

      if (newAngle >= -pi / 2 && newAngle < -pi / 2 + stepAngle / 2) {
        _currentValue = 1;
      } else {
        _currentValue = newValue == 0 ? widget.maxPlayers : newValue;
      }

      if (_lastValue != _currentValue) {
        HapticFeedback.selectionClick();
        _lastValue = _currentValue;
      }

      widget.onValueChanged(_currentValue);
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);
    return GestureDetector(
      onPanUpdate: (details) {
        _updateValue(details.localPosition);
      },
      child: Center(
        child: SizedBox(
          width: 250,
          height: 250,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CustomPaint(
                size: const Size(250, 250),
                painter: RingPainter(
                  maxPlayers: widget.maxPlayers,
                  currentValue: _currentValue,
                  angle: _angle,
                  backgroundColor: theme.secondaryTextColor,
                  highlightColor: theme.redColor,
                  knobColor: theme.redColor,
                ),
              ),
              Text(
                '$_currentValue',
                style: theme.display2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RingPainter extends CustomPainter {
  final int maxPlayers;
  final int currentValue;
  final double angle;
  final Color backgroundColor;
  final Color highlightColor;
  final Color knobColor;

  RingPainter({
    required this.maxPlayers,
    required this.currentValue,
    required this.angle,
    required this.backgroundColor,
    required this.highlightColor,
    required this.knobColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint circlePaint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;

    Paint selectedPaint = Paint()
      ..color = highlightColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;

    double radius = size.width / 2;

    canvas.drawCircle(size.center(Offset.zero), radius, circlePaint);

    double startAngle = -pi / 2;
    double knobAngle = angle;
    double sweepAngle = (knobAngle + pi / 2) % (2 * pi);
    canvas.drawArc(
      Rect.fromCircle(center: size.center(Offset.zero), radius: radius),
      startAngle,
      sweepAngle,
      false,
      selectedPaint,
    );

    Offset knobPosition = Offset(
      size.center(Offset.zero).dx + radius * cos(angle),
      size.center(Offset.zero).dy + radius * sin(angle),
    );
    canvas.drawCircle(knobPosition, 9, Paint()..color = knobColor);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
