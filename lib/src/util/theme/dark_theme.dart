import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: const Color(0xFF1F1F1F),
  hintColor: const Color(0xFF0097FF),
  scaffoldBackgroundColor: Color(0xFF121212),
  cardColor: Color(0xFF2C2C2C),
  textTheme: const TextTheme(
    displayLarge: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    bodyLarge: TextStyle(color: Colors.white, fontSize: 16),
    bodyMedium: TextStyle(color: Color(0xFFB0B0B0), fontSize: 14),
  ),
  iconTheme: const IconThemeData(color: Colors.white),
  buttonTheme: const ButtonThemeData(
    buttonColor: Color(0xFF0097FF),
    textTheme: ButtonTextTheme.primary,
  ),
  colorScheme:
  const ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFF0061F2),
    onPrimary: Colors.white,
    secondary: Color(0xFFFF6600),
    onSecondary: Colors.white,
    error: Colors.red,
    onError: Colors.white,
    surface: Color(0xFFF9F9F9),
    onSurface: Colors.black,
  )
);
