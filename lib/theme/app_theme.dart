import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  // WhatsApp Colors
  static const Color whatsappGreen = Color(0xFF25D366);
  static const Color whatsappDarkGreen = Color(0xFF128C7E);
  static const Color whatsappTeal = Color(0xFF075E54);
  static const Color whatsappBlue = Color(0xFF34B7F1);

  // Light Theme Colors
  static const Color lightBackground = Color(0xFFFFFFFF);
  static const Color lightSurface = Color(0xFFF7F8FA);
  static const Color lightPrimary = whatsappGreen;
  static const Color lightOnPrimary = Colors.white;
  static const Color lightSecondary = Color(0xFF667781);
  static const Color lightOnSurface = Color(0xFF111B21);

  // Dark Theme Colors
  static const Color darkBackground = Color(0xFF111B21);
  static const Color darkSurface = Color(0xFF202C33);
  static const Color darkPrimary = whatsappGreen;
  static const Color darkOnPrimary = Color(0xFF111B21);
  static const Color darkSecondary = Color(0xFF8696A0);
  static const Color darkOnSurface = Color(0xFFE9EDEF);

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(
      primary: lightPrimary,
      onPrimary: lightOnPrimary,
      secondary: lightSecondary,
      surface: lightSurface,
      onSurface: lightOnSurface,
      background: lightBackground,
    ),
    scaffoldBackgroundColor: lightBackground,
    appBarTheme: const AppBarTheme(
      backgroundColor: whatsappTeal,
      foregroundColor: Colors.white,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle.light,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 19,
        fontWeight: FontWeight.w500,
      ),
    ),
    textTheme: _textTheme(lightOnSurface),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      primary: darkPrimary,
      onPrimary: darkOnPrimary,
      secondary: darkSecondary,
      surface: darkSurface,
      onSurface: darkOnSurface,
      background: darkBackground,
    ),
    scaffoldBackgroundColor: darkBackground,
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF2A3942),
      foregroundColor: darkOnSurface,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle.light,
      titleTextStyle: TextStyle(
        color: darkOnSurface,
        fontSize: 19,
        fontWeight: FontWeight.w500,
      ),
    ),
    textTheme: _textTheme(darkOnSurface),
  );

  static TextTheme _textTheme(Color onSurface) {
    return TextTheme(
      displayLarge: TextStyle(color: onSurface, fontWeight: FontWeight.w400),
      displayMedium: TextStyle(color: onSurface, fontWeight: FontWeight.w400),
      displaySmall: TextStyle(color: onSurface, fontWeight: FontWeight.w400),
      headlineLarge: TextStyle(color: onSurface, fontWeight: FontWeight.w500),
      headlineMedium: TextStyle(color: onSurface, fontWeight: FontWeight.w500),
      headlineSmall: TextStyle(color: onSurface, fontWeight: FontWeight.w500),
      titleLarge: TextStyle(color: onSurface, fontWeight: FontWeight.w500),
      titleMedium: TextStyle(color: onSurface, fontWeight: FontWeight.w500),
      titleSmall: TextStyle(color: onSurface, fontWeight: FontWeight.w500),
      bodyLarge: TextStyle(color: onSurface, fontWeight: FontWeight.w400),
      bodyMedium: TextStyle(color: onSurface, fontWeight: FontWeight.w400),
      bodySmall: TextStyle(color: onSurface.withOpacity(0.6), fontWeight: FontWeight.w400),
      labelLarge: TextStyle(color: onSurface, fontWeight: FontWeight.w500),
      labelMedium: TextStyle(color: onSurface, fontWeight: FontWeight.w500),
      labelSmall: TextStyle(color: onSurface.withOpacity(0.6), fontWeight: FontWeight.w500),
    );
  }
}