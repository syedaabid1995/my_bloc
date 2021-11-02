import 'package:flutter/material.dart';
import 'package:optimal_oncology/utils/app_colors.dart';

enum AppTheme {
  light,
  dark,

}

//TODO Change theme color accordingly
final appThemeData = {
  AppTheme.light: ThemeData(
    brightness: Brightness.light,
      // primaryColor: Colors.black,
      colorScheme: ColorScheme.light(background: Colors.black,primary: appPrimaryColor,secondary: Colors.black)
  ),
  AppTheme.dark: ThemeData(
    brightness: Brightness.dark,
    // primaryColor: Colors.black,

  ),
};
