  import 'package:flutter/material.dart';

  class AppTheme {
    // Cores da ADF - paleta vibrante e moderna
    static const Color primaryColor = Color(0xFF6366F1); // Indigo vibrante
    static const Color secondaryColor = Color(0xFF8B5CF6); // Roxo vibrante
    static const Color accentColor = Color(0xFF06B6D4); // Cyan vibrante
    static const Color surfaceColor = Color(0xFFF8FAFC); // Branco azulado
    static const Color backgroundColor = Color(0xFFFFFBFF); // Branco puro
    static const Color errorColor = Color(0xFFEF4444); // Vermelho vibrante
    static const Color successColor = Color(0xFF10B981); // Verde vibrante
    static const Color warningColor = Color(0xFFF59E0B); // Laranja vibrante

    static ThemeData get lightTheme {
      return ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: primaryColor,
          brightness: Brightness.light,
          primary: primaryColor,
          secondary: secondaryColor,
          tertiary: accentColor,
          surface: surfaceColor,
          error: errorColor,
        ),

        // AppBar Theme
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 0,
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
          titleTextStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          iconTheme: IconThemeData(color: Colors.white),
        ),

        // Elevated Button Theme
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor,
            foregroundColor: Colors.white,
            elevation: 3,
            shadowColor: primaryColor.withOpacity(0.3),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),

        // Input Decoration Theme
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: surfaceColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: primaryColor.withOpacity(0.3)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: primaryColor.withOpacity(0.3)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: primaryColor, width: 2),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: errorColor),
          ),
          labelStyle: TextStyle(color: primaryColor.withOpacity(0.8)),
          hintStyle: TextStyle(color: Colors.grey.shade500),
          iconColor: primaryColor,
        ),

        // Text Theme
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1E293B),
          ),
          headlineMedium: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1E293B),
          ),
          titleLarge: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: Color(0xFF1E293B),
          ),
          titleMedium: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Color(0xFF334155),
          ),
          bodyLarge: TextStyle(fontSize: 16, color: Color(0xFF475569)),
          bodyMedium: TextStyle(fontSize: 14, color: Color(0xFF64748B)),
        ),

        // Progress Indicator Theme
        progressIndicatorTheme: ProgressIndicatorThemeData(
          color: primaryColor,
          linearTrackColor: primaryColor.withOpacity(0.2),
          circularTrackColor: primaryColor.withOpacity(0.2),
        ),

        // Icon Theme
        iconTheme: const IconThemeData(color: primaryColor, size: 24),

        // Scaffold Background Color
        scaffoldBackgroundColor: backgroundColor,
      );
    }

    static ThemeData get darkTheme {
      return ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: primaryColor,
          brightness: Brightness.dark,
          primary: primaryColor,
          secondary: secondaryColor,
          tertiary: accentColor,
          surface: const Color(0xFF1E293B),
          error: errorColor,
        ),

        appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Color(0xFF1E293B),
          foregroundColor: Colors.white,
          titleTextStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor,
            foregroundColor: Colors.white,
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          ),
        ),

        cardTheme: CardTheme(
          elevation: 6,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          color: const Color(0xFF1E293B),
        ),

        scaffoldBackgroundColor: const Color(0xFF0F172A),
      );
    }
  }