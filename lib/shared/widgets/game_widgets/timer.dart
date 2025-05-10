import 'package:board_buddy/config/theme/app_theme.dart';
import 'package:board_buddy/config/utils/custom_icons.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter_svg/svg.dart';

class TimerWidget extends StatefulWidget {
  final int? initialSeconds;
  final Function(int seconds)? onTimerChange;

  const TimerWidget({this.initialSeconds, this.onTimerChange, super.key});

  @override
  TimerWidgetState createState() => TimerWidgetState();
}

class TimerWidgetState extends State<TimerWidget> {
  late Timer _timer;
  int _seconds = 0;
  bool _isRunning = false;

  @override
  void initState() {
    super.initState();
    if (widget.initialSeconds != null) {
      _seconds = widget.initialSeconds!;
      debugPrint('TimerWidget initialized with ${_seconds} seconds');
    } else {
      debugPrint('TimerWidget initialized with default 0 seconds');
    }
  }

  @override
  void dispose() {
    if (_isRunning) {
      _timer.cancel();
    }
    super.dispose();
  }

  void _startTimer() {
    if (!_isRunning) {
      setState(() {
        _isRunning = true;
      });
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        setState(() {
          _seconds++;
          if (widget.onTimerChange != null) {
            widget.onTimerChange!(_seconds);
          }
        });
      });
    }
  }

  void _stopTimer() {
    if (_isRunning) {
      final currentSeconds = _seconds;

      setState(() {
        _isRunning = false;
      });
      _timer.cancel();

      if (widget.onTimerChange != null) {
        debugPrint(
            'Timer stopped at $currentSeconds seconds, notifying parent');
        widget.onTimerChange!(currentSeconds);
      }
    }
  }

  void stopTimer() {
    _stopTimer();
  }

  void startTimer() {
    _startTimer();
  }

  void resetTimer() {
    _resetTimer();
  }

  void _resetTimer() {
    if (_isRunning) {
      _timer.cancel();
    }

    setState(() {
      _seconds = 0;
      _isRunning = false;
    });

    if (widget.onTimerChange != null) {
      debugPrint('Timer reset to 0 seconds, notifying parent');
      widget.onTimerChange!(0);
    }
  }

  int getSeconds() {
    return _seconds;
  }

  void setSeconds(int seconds) {
    setState(() {
      _seconds = seconds;
    });
  }

  String _formatTime(int seconds) {
    final int minutes = seconds ~/ 60;
    final int remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: _isRunning ? _stopTimer : _startTimer,
          child: SvgPicture.asset(
            _isRunning ? CustomIcons.pause : CustomIcons.play,
            width: 27,
            height: 27,
            colorFilter: ColorFilter.mode(theme.textColor, BlendMode.srcIn),
          ),
        ),
        const SizedBox(width: 15),
        Text(
          _formatTime(_seconds),
          style: _isRunning
              ? theme.display4
              : theme.display4.copyWith(color: theme.secondaryTextColor),
        ),
        const SizedBox(width: 15),
        GestureDetector(
          onTap: _resetTimer,
          child: SvgPicture.asset(
            CustomIcons.refresh,
            width: 27,
            height: 27,
            colorFilter: ColorFilter.mode(theme.textColor, BlendMode.srcIn),
          ),
        ),
      ],
    );
  }
}
