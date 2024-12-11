import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark, // Bu yerda Dark ko'rsatilgan
  primaryColor: const Color(0xFF1A73E8),
  hintColor: const Color(0xFFFF8C00),
  scaffoldBackgroundColor: const Color(0xFF121212),
  cardColor: const Color(0xFF1E1E1E),
  textTheme: const TextTheme(
    displayLarge: TextStyle(color: Color(0xFFE0E0E0), fontWeight: FontWeight.bold),
    bodyLarge: TextStyle(color: Color(0xFFE0E0E0), fontSize: 16),
    bodyMedium: TextStyle(color: Color(0xFFBDBDBD), fontSize: 14),
  ),
  iconTheme: const IconThemeData(color: Color(0xFFE0E0E0)),
  buttonTheme: const ButtonThemeData(
    buttonColor: Color(0xFF1A73E8),
    textTheme: ButtonTextTheme.primary,
  ),
  colorScheme: const ColorScheme.dark( // Bu yerda Dark bo'lishi kerak
    primary: Color(0xFF0097FF),
    onPrimary: Colors.white,
    secondary: Color(0xFF03DAC6),
    onSecondary: Colors.black,
    error: Colors.red,
    onError: Colors.white,
    surface: Color(0xFF121212),
    onSurface: Color(0xFFE0E0E0),
    background: Color(0xFF121212),
    onBackground: Color(0xFFE0E0E0),
  ),
);
