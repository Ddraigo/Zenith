import 'package:app_demo/configs/themes/app_fonts.dart';
import 'package:app_demo/configs/themes/text_style.dart';
import 'package:flutter/material.dart';

// /// Dark [ColorScheme] made with FlexColorScheme v8.4.0.
// /// Requires Flutter 3.22.0 or later.

const ColorScheme darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xFFB39DDB),
  onPrimary: Color(0xFF070708),
  primaryContainer: Color(0xFF7E57C2),
  onPrimaryContainer: Color(0xFFFAF8FF),
  primaryFixed: Color(0xFFD4CBEF),
  primaryFixedDim: Color(0xFFAEA0DC),
  onPrimaryFixed: Color(0xFF190E39),
  onPrimaryFixedVariant: Color(0xFF1F1148),
  secondary: Color(0xFF80D8FF),
  onSecondary: Color(0xFF060808),
  secondaryContainer: Color(0xFF00497B),
  onSecondaryContainer: Color(0xFFF3F7FA),
  secondaryFixed: Color(0xFFC3E8FF),
  secondaryFixedDim: Color(0xFF8CD1FB),
  onSecondaryFixed: Color(0xFF003B60),
  onSecondaryFixedVariant: Color(0xFF004772),
  tertiary: Color(0xFF40C4FF),
  onTertiary: Color(0xFF040808),
  tertiaryContainer: Color(0xFF0179B6),
  onTertiaryContainer: Color(0xFFF3FAFE),
  tertiaryFixed: Color(0xFF83D9FF),
  tertiaryFixedDim: Color(0xFF47C6FF),
  onTertiaryFixed: Color(0xFF000000),
  onTertiaryFixedVariant: Color(0xFF000000),
  error: Color(0xFFCF6679),
  onError: Color(0xFF080505),
  errorContainer: Color(0xFFB1384E),
  onErrorContainer: Color(0xFFFEF6F7),
  surface: Color(0xFF131115),
  onSurface: Color(0xFFEBE9EF),
  surfaceDim: Color(0xFF110F13),
  surfaceBright: Color(0xFF343337),
  surfaceContainerLowest: Color(0xFF0C0B0F),
  surfaceContainerLow: Color(0xFF18171B),
  surfaceContainer: Color(0xFF1F1E21),
  surfaceContainerHigh: Color(0xFF262529),
  surfaceContainerHighest: Color(0xFF312F33),
  onSurfaceVariant: Color(0xFFC7C5CA),
  outline: Color(0xff818898),
  outlineVariant: Color(0xFF48474B),
  shadow: Color(0xFF000000),
  scrim: Color(0xFF000000),
  inverseSurface: Color(0xFFE6E6E8),
  onInverseSurface: Color(0xFF2D2C2F),
  inversePrimary: Color(0xFF584E6A),
  surfaceTint: Color(0xFFB39DDB),
);

ThemeData getDarkTheme() {
  return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      fontFamily: AppFonts.poppin,
      colorScheme: darkColorScheme,
      textTheme: ThemeData().textTheme.apply(
            bodyColor: darkColorScheme.onSurface,
            displayColor: darkColorScheme.onSurface,
          ),
          
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: darkColorScheme.primary,
          foregroundColor: darkColorScheme.onPrimary,
          disabledBackgroundColor: darkColorScheme.surfaceContainerHighest,
          disabledForegroundColor: darkColorScheme.onSurfaceVariant,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          textStyle: MyTextStyle.btnText,
        ),
      ),

      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: darkColorScheme.primary,
          ),
        ),
      ),

      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: darkColorScheme.primary,
          foregroundColor: darkColorScheme.onPrimary,
        ),
      ),

      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          backgroundColor: darkColorScheme.onSecondary,
          foregroundColor: darkColorScheme.outline,
          disabledBackgroundColor: darkColorScheme.surfaceContainerHigh,
          disabledForegroundColor: darkColorScheme.onSurfaceVariant,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          side: BorderSide(
            width: 1,
            color: darkColorScheme.onInverseSurface
          ),
          textStyle: MyTextStyle.btnText,
          padding: EdgeInsets.all(16),
          minimumSize: const Size(double.infinity, 56),
        ),
      ),

      appBarTheme: AppBarTheme(
        elevation: 0,
      ));
}
