import 'package:flutter/material.dart';

class CustomTheme {
  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,

    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF7C4DFF), // purple seed
      brightness: Brightness.dark,
    ),

    scaffoldBackgroundColor: const Color(0xFF000000),

    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
    ),

    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: Colors.white),
    ),

    iconTheme: const IconThemeData(
      color: Colors.white,
    ),

    /// ✅ Input Field
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: const Color(0xFF1A1A1A),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide.none,
      ),
      hintStyle: const TextStyle(color: Colors.grey),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 12,
      ),
    ),

    /// ✅ Icon Buttons (Send button etc.)
    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return const Color(0xFF2A2A2A);
          }
          return const Color(0xFF7C4DFF); // purple
        }),
        foregroundColor: const WidgetStatePropertyAll(Colors.white),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    ),

    /// ✅ Elevated Buttons
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor:
            const WidgetStatePropertyAll(Color(0xFF7C4DFF)),
        foregroundColor:
            const WidgetStatePropertyAll(Colors.white),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    ),
  );
}