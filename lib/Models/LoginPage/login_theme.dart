import 'dart:ui';
import 'package:flutter/cupertino.dart';

class Colorss {
  const Colorss();

  static const Color loginGradientStart = const Color(0xFFBF63A8);
  static const Color loginGradientEnd = const Color(0xFF8051A0);

  static const primaryGradient = const LinearGradient(
    colors: const [loginGradientStart, loginGradientEnd],
    stops: const [0.0, 1.0],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
