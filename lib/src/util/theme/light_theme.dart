import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: const Color(0xFF0061F2),
  hintColor: const Color(0xFFFF6600),
  scaffoldBackgroundColor: const Color(0xFFF9F9F9),
  cardColor: Colors.white,
  textTheme: const TextTheme(
    displayLarge: TextStyle(color: Color(0xFF212121), fontWeight: FontWeight.bold),
    bodyLarge: TextStyle(color: Color(0xFF212121), fontSize: 16),
    bodyMedium: TextStyle(color: Color(0xFF757575), fontSize: 14),
  ),
  iconTheme: const IconThemeData(color: Color(0xFF212121)),
  buttonTheme: const ButtonThemeData(
    buttonColor: Color(0xFF0061F2),
    textTheme: ButtonTextTheme.primary,
  ),
  colorScheme: const ColorScheme.light(
    primary: Color(0xFF0097FF),
    onPrimary: Colors.black,
    secondary: Color(0xFFBB86FC),
    onSecondary: Colors.black,
    error: Colors.red,
    onError: Colors.white,
    surface: Colors.white,
    onSurface: Color(0xFF212121),
    background: Color(0xFFF9F9F9),
    onBackground: Color(0xFF212121),
  ),
);
