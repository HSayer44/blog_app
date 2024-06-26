import 'package:blog_app/core/theme/app_pallete.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static  _border([Color color = AppPallete.borderColor,]) => OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide:  BorderSide(
      color: color,
      width: 3,
    ),
  );
  static final darkThemeMode = ThemeData.dark().copyWith(
    appBarTheme: const AppBarTheme(backgroundColor: AppPallete.backgroundColor),
    scaffoldBackgroundColor: AppPallete.backgroundColor,
    chipTheme: const ChipThemeData(
      color: MaterialStatePropertyAll(AppPallete.backgroundColor),
      side: BorderSide.none,
    ),
    inputDecorationTheme:  InputDecorationTheme(
      border: _border(),
      contentPadding: const EdgeInsets.all(27),
      focusedBorder: _border(AppPallete.gradient2),
      enabledBorder: _border(),
      errorBorder: _border(AppPallete.errorColor),
    ),
  );
}
