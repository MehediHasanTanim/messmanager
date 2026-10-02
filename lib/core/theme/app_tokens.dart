import 'package:flutter/material.dart';

abstract final class AppColors {
  static const primary = Color(0xFF007A46);
  static const primaryLight = Color(0xFF45C981);
  static const canvas = Color(0xFFF8FAFC);
  static const text = Color(0xFF11243E);
  static const darkSurface = Color(0xFF101B18);
  static const darkCard = Color(0xFF172722);
  static const darkText = Color(0xFFF4FBF7);
  static const border = Color(0xFFD8E1EA);
  static const success = Color(0xFF14804A);
  static const warning = Color(0xFFE58A00);
  static const error = Color(0xFFD92D20);
  static const info = Color(0xFF1570EF);
  static const balanceReceivable = Color(0xFF14804A);
  static const balancePayable = Color(0xFFD92D20);
  static const balanceSettled = Color(0xFF52606D);
}

abstract final class AppSpacing {
  static const xs = 4.0;
  static const sm = 8.0;
  static const md = 16.0;
  static const lg = 24.0;
  static const xl = 32.0;
}

abstract final class AppRadius {
  static const field = 12.0;
  static const button = 14.0;
  static const card = 18.0;
  static const pill = 999.0;
}

abstract final class AppElevation {
  static const card = 1.0;
}

abstract final class AppTypography {
  static const textTheme = TextTheme(
    bodyLarge: TextStyle(fontSize: 16, height: 1.5),
    bodyMedium: TextStyle(fontSize: 14, height: 1.45),
    titleLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
    titleMedium: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
    labelLarge: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
  );

  static const title = TextStyle(fontSize: 18, fontWeight: FontWeight.w700);
  static const button = TextStyle(fontSize: 15, fontWeight: FontWeight.w700);
  static const navLabel = TextStyle(fontSize: 12, fontWeight: FontWeight.w600);
}
