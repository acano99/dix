import 'package:flutter/material.dart';

class DixTextTheme {
  static TextTheme createTextTheme({
    String titleFamily = 'Poppins',
    String bodyFamily = 'Roboto',
  }) => TextTheme(
    headlineLarge: TextStyle(
      fontFamily: titleFamily,
      fontSize: 36,
      letterSpacing: 1,
      fontWeight: FontWeight.bold,
    ),
    headlineMedium: TextStyle(fontFamily: titleFamily, fontSize: 34),
    headlineSmall: TextStyle(fontFamily: titleFamily, fontSize: 32),
    titleLarge: TextStyle(
      fontFamily: titleFamily,
      fontSize: 28,
      letterSpacing: 1,
      fontWeight: FontWeight.bold,
    ),
    titleMedium: TextStyle(fontFamily: titleFamily, fontSize: 26),
    titleSmall: TextStyle(fontFamily: titleFamily, fontSize: 24),
    bodyLarge: TextStyle(fontFamily: bodyFamily, fontSize: 20),
    bodyMedium: TextStyle(fontFamily: bodyFamily, fontSize: 18),
    bodySmall: TextStyle(fontFamily: bodyFamily, fontSize: 16),
    labelLarge: TextStyle(fontFamily: bodyFamily, fontSize: 14),
    labelMedium: TextStyle(fontFamily: bodyFamily, fontSize: 12),
    labelSmall: TextStyle(fontFamily: bodyFamily, fontSize: 10),
  );
}
