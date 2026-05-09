import 'dart:async';

import 'package:flutter/material.dart';

class OtpTimer extends StatefulWidget {
  final int seconds;
  final VoidCallback onResend;

  const OtpTimer({super.key, this.seconds = 60, required this.onResend});

  @override
  State<OtpTimer> createState() => _OtpTimerState();
}

class _OtpTimerState extends State<OtpTimer> {
  late int _secondsRemaining;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _secondsRemaining = widget.seconds;
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining == 0) {
        timer.cancel();
      } else {
        setState(() {
          _secondsRemaining--;
        });
      }
    });
  }

  void _restartTimer() {
    _timer?.cancel();
    setState(() {
      _secondsRemaining = widget.seconds;
    });
    _startTimer();
    widget.onResend(); // بيبلغ الـ parent إن الـ resend اتضغط
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: _secondsRemaining == 0 ? _restartTimer : null,
          child: Text(
            "Resend OTP",
            style: TextStyle(
              color: _secondsRemaining == 0 ? Colors.blue : Colors.grey,
            ),
          ),
        ),
        Text(
          "00:${_secondsRemaining.toString().padLeft(2, '0')}",
          style: const TextStyle(fontSize: 16, color: Colors.red),
        ),
      ],
    );
  }
}
