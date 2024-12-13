import 'package:flutter/material.dart';

final ThemeData appTheme = ThemeData(
  colorScheme: ColorScheme(
    brightness: Brightness.light,
    primary: const Color(
        0xFFF9B572), // Warm and inviting, great for main branding elements.
    onPrimary: Colors.white, // Contrasting well against the primary color.
    secondary: const Color(
        0xFF99B080), // Fresh and calming, ideal for accents like FABs or sliders.
    onSecondary: Colors
        .white, // Dark enough to ensure readability against the background.
    surface: const Color(
        0xFFF9B572), // Subtle emphasis areas, e.g., cards or dialogs.
    onSurface:
        const Color(0xFF333333), // High contrast for text on surface elements.
    error: Colors.red.shade700, // Standard error color for consistency.
    onError: Colors.white, // Readable against the error color.
  ),
  scaffoldBackgroundColor:
      const Color(0xFFFAF8ED), // Aligns with the clean, light background.
  appBarTheme: const AppBarTheme(
    backgroundColor:
        Color(0xFF748E63), // Muted but grounded, works well for headers.
    foregroundColor:
        Colors.white, // Text/icons contrast well against the app bar.
  ),
  buttonTheme: const ButtonThemeData(
    buttonColor:
        Color(0xFF99B080), // Keeps buttons visually appealing and cohesive.
    textTheme:
        ButtonTextTheme.primary, // Ensures button text matches the theme.
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: Color(0xFF333333)), // General text is readable.
    bodyMedium: TextStyle(color: Color(0xFF333333)),
    headlineSmall:
        TextStyle(color: Color(0xFF748E63)), // Highlight key headlines.
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Color(0xFF99B080), // Eye-catching yet subtle for actions.
  ),
);
