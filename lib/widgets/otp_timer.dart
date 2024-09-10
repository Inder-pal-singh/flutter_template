import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class OtpTimer extends StatefulWidget {
  final Function? onTimerEnd;
  final Function onResend;
  const OtpTimer({super.key, this.onTimerEnd, required this.onResend});

  @override
  State<OtpTimer> createState() => _OtpTimerState();
}

class _OtpTimerState extends State<OtpTimer> {
  Timer? _timer;
  int timeLeft = 60;
  @override
  void initState() {
    super.initState();
    runTimer();
  }

  runTimer() {
    timeLeft = 60;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timeLeft == 0) {
        _timer?.cancel();
      } else {
        if (mounted) {
          setState(() {
            timeLeft--;
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text.rich(
        TextSpan(
          text: timeLeft == 0 ? 'Didn\'t receive the OTP? ' : '',
          style: TextStyle(
            color: Colors.grey.shade700,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
          children: [
            TextSpan(
              text: timeLeft == 0
                  ? 'Resend OTP'
                  : 'Resend OTP in $timeLeft seconds',
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  if (timeLeft != 0) return;

                  runTimer();
                  widget.onResend();
                },
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
                fontWeight: FontWeight.w700,
              ),
            )
          ],
        ),
      ),
    );
  }
}
