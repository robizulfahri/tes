import 'dart:ui';
import 'package:flutter/cupertino.dart';

class Colors {
  const Colors();

  static const Color loginGradientStart1 = const Color(0xFFffffff);
  static const Color loginGradientStart = const Color(0xFFB8529E);
  static const Color loginGradientEnd2 = const Color(0xFFffffff);
  static const Color loginGradientEnd = const Color(0xFF8051A0);

  static const primaryGradient = const LinearGradient(
    colors: const [loginGradientStart, loginGradientEnd],
    stops: const [0.0, 1.0],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
