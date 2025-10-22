import 'dart:async';

import 'package:flutter/material.dart';

class AnimatedDotsText extends StatefulWidget {
  final String baseText;

  const AnimatedDotsText({super.key, this.baseText = "Creating wallet"});

  @override
  _AnimatedDotsTextState createState() => _AnimatedDotsTextState();
}

class _AnimatedDotsTextState extends State<AnimatedDotsText> {
  int _dotCount = 0;
  late final Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(milliseconds: 500), (timer) {
      setState(() {
        _dotCount = (_dotCount + 1) % 4;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String dots = '.' * _dotCount;
    return Text(
      '${widget.baseText}$dots',
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.w500,
        fontSize: 16,
        color: Colors.white,
      ),
    );
  }
}
