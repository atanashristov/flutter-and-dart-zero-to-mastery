import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static const _kPrimaryColorLight = Colors.lightBlueAccent;

  static const _kPrimaryColorDark = Colors.lightGreenAccent;

  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: _kPrimaryColorLight,
      brightness: Brightness.light,
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: _kPrimaryColorDark,
      brightness: Brightness.dark,
    ),
  );
}
