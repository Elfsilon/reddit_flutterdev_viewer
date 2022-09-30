import 'package:flutter/material.dart';

class AppConstants {
  static const EdgeInsets screenPadding = EdgeInsets.all(20);
  static const EdgeInsets screenPaddingHorizontal = EdgeInsets.symmetric(horizontal: 20);
  static const EdgeInsets screenTopPadding = EdgeInsets.only(top: 30);

  static const BorderRadius borderRadius = BorderRadius.all(Radius.circular(6));

  static const double spaceS = 8.0;
  static const double spaceM = 16.0;
  static const double spaceL = 24.0;
}

class AppColors {
  static const Color appBg = Color(0xFF151516);
  static const Color bg = Color(0xFF222329);
  static const Color primary = Colors.blue;
  static const Color danger = Colors.red;
  static const Color dangerMuted = Color(0xFF290502);
  static const Color warning = Colors.yellow;
  static const Color warningMuted = Color(0xFF16200B);
  static const Color success = Colors.green;
  static const Color successMuted = Color(0xFF0D1E0E);
  static const Color text = Colors.white;
  static const Color mutedText = Color(0xFF616368);
}