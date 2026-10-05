import 'package:flutter/material.dart';

/// Visual tokens taken from the Reality Anchor boards:
/// dark teal type, a mist background, and the teal–purple–coral gradient.
abstract final class AppColors {
  static const ink = Color(0xFF173E3C);
  static const inkSoft = Color(0xFF5E7775);
  static const teal = Color(0xFF2F9E94);
  static const freshTeal = Color(0xFF8ED9CE);
  static const purple = Color(0xFF8B7FD4);
  static const coral = Color(0xFFF2A3B3);
  static const mist = Color(0xFFF4F7F6);
  static const card = Color(0xFFFFFFFF);
  static const line = Color(0xFFE3EEEC);
  static const help = Color(0xFFE24B4B);

  static const kiwi = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [freshTeal, purple, coral],
  );
}
