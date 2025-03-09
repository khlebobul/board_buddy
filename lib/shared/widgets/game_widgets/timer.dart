// ignore_for_file: deprecated_member_use

import 'package:board_buddy/config/theme/app_theme.dart';
import 'package:board_buddy/config/utils/custom_icons.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter_svg/svg.dart';

class TimerWidget extends StatefulWidget {
  const TimerWidget({super.key});

  @override
  TimerWidgetState createState() => TimerWidgetState();
}

class TimerWidgetState extends State<TimerWidget> {
  late Timer _timer;
  int _seconds = 0;
  bool _isRunning = false;

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
        });
      });
    }
  }

  void _stopTimer() {
    if (_isRunning) {
      setState(() {
        _isRunning = false;
      });
      _timer.cancel();
    }
  }

  void _resetTimer() {
    setState(() {
      _seconds = 0;
      if (_isRunning) {
        _timer.cancel();
        _isRunning = false;
      }
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
            color: theme.textColor,
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
            color: theme.textColor,
          ),
        ),
      ],
    );
  }
}
