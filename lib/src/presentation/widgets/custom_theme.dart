import 'package:flutter/material.dart';

import 'palette.dart';

mixin CustomTheme {
  static final theme = ThemeData(
    fontFamily: 'Lato',
    primaryColor: Palette.primary,
    backgroundColor: Colors.white,
    scaffoldBackgroundColor: Colors.white,
    primaryColorBrightness: Brightness.dark,
    accentColor: Palette.accent,
    accentColorBrightness: Brightness.light,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Palette.accent,
      foregroundColor: Colors.white,
    ),
    appBarTheme: AppBarTheme(
      brightness: Brightness.dark,
      color: Palette.primary,
      centerTitle: false,
      actionsIconTheme: const IconThemeData(size: 25, color: Colors.white),
      textTheme: TextTheme(
        headline6: TextStyle(
          color: Colors.white,
          fontSize: 25,
          fontFamily: 'Lato',
          fontWeight: FontWeight.normal,
        ),
      ),
    ),
  );
}
