import 'package:app_demo/configs/themes/theme_data/theme_data_dark.dart';
import 'package:app_demo/configs/themes/theme_data/theme_data_light.dart';
import 'package:flutter/material.dart';

class AppTheme {

  static ThemeData light = getLightTheme();
  static ThemeData dark = getDarkTheme();
}