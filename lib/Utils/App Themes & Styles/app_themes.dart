import 'package:flutter/material.dart';
import 'package:movieapp/Utils/App%20Themes%20&%20Styles/app_colors.dart';

class AppThemes {
  static final Color _darkFocusColor = Colors.white.withOpacity(0.12);

  static ThemeData darkThemeData = themeData(darkColorScheme, _darkFocusColor);
  static ThemeData themeData(ColorScheme colorScheme, Color focusColor) {
    return ThemeData(
      colorScheme: colorScheme,
      appBarTheme: AppBarTheme(
        color: colorScheme.primary,
        elevation: 0,
        // brightness: colorScheme.brightness,
      ),
      iconTheme: IconThemeData(color: colorScheme.onPrimary),
      canvasColor: colorScheme.background,
      scaffoldBackgroundColor: colorScheme.background,
      highlightColor: Colors.black,
      focusColor: focusColor,
    );
  }

  static ColorScheme darkColorScheme = ColorScheme(
    primary: Colors.lightBlue,
    // primaryVariant: Colors.lightBlue.shade900,
    secondary: Colors.yellow,
    // secondaryVariant: Colors.yellow.shade900,
    background: Color.fromARGB(255, 255, 255, 255),
    surface: Color.fromARGB(255, 255, 255, 255),
    onBackground: Color.fromARGB(13, 255, 255, 255),
    // White with 0.05 opacity
    error: Colors.red,
    onError: Colors.white,
    onPrimary: kPrimaryColor,
    onSecondary: Colors.blue,
    onSurface: Colors.blue,
    brightness: Brightness.light,
  );
}
