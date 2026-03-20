import 'package:app_demo/configs/themes/app_colors.dart';
import 'package:app_demo/configs/themes/app_fonts.dart';
import 'package:app_demo/configs/themes/text_style.dart';
import 'package:flutter/material.dart';

const ColorScheme lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: AppColors.primary100,
  onPrimary: AppColors.grey0,
  primaryContainer: Color(0xFFD1C4E9),
  onPrimaryContainer: Color(0xFF121114),
  primaryFixed: Color(0xFFD4CBEF),
  primaryFixedDim: Color(0xFFAEA0DC),
  onPrimaryFixed: Color(0xFF190E39),
  onPrimaryFixedVariant: Color(0xFF1F1148),
  secondary: Color(0xFF0091EA),
  onSecondary: AppColors.grey0,
  secondaryContainer: Color(0xFFCFE4FF),
  onSecondaryContainer: Color(0xFF121314),
  secondaryFixed: Color(0xFFC3E8FF),
  secondaryFixedDim: Color(0xFF8CD1FB),
  onSecondaryFixed: Color(0xFF003B60),
  onSecondaryFixedVariant: Color(0xFF004772),
  tertiary: Color(0xFF00B0FF),
  onTertiary: Color(0xFF000000),
  tertiaryContainer: Color(0xFF9FCBF1),
  onTertiaryContainer: Color(0xFF0E1114),
  tertiaryFixed: Color(0xFF83D9FF),
  tertiaryFixedDim: Color(0xFF47C6FF),
  onTertiaryFixed: Color(0xFF000000),
  onTertiaryFixedVariant: Color(0xFF000000),
  error: Color(0xFFFB7181), //0xFFB00020
  onError: AppColors.grey0,
  errorContainer: Color(0xFFFCD9DF),
  onErrorContainer: Color(0xFF141313),
  surface: Color(0xFFF9F9FB),
  onSurface: Color(0xFF1A1821),
  surfaceDim: Color(0xFFDEDDDF),
  surfaceBright: Color(0xFFFAFAFC),
  surfaceContainerLowest: Color(0xFFFCFCFE),
  surfaceContainerLow: Color(0xFFF5F5F7),
  surfaceContainer: Color(0xFFF0F0F2),
  surfaceContainerHigh: Color(0xFFEAEAEC),
  surfaceContainerHighest: Color(0xFFE4E4E6),
  onSurfaceVariant: Color(0xFF3F3D46),
  outline: Color(0xff818898),
  outlineVariant: Color(0xFFC6C4CD),
  shadow: Color(0xFF000000),
  scrim: Color(0xFF000000),
  inverseSurface: Color(0xFF2A2A2B),
  onInverseSurface: Color(0xFFEDECF0),
  inversePrimary: Color(0xFFD1C0FF),
  surfaceTint: Color(0xFF4527A0),
);

ThemeData getLightTheme() {
  return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      fontFamily: AppFonts.poppin,
      colorScheme: lightColorScheme,
      textTheme: ThemeData().textTheme.apply(
            bodyColor: lightColorScheme.onSurface,
            displayColor: lightColorScheme.onSurface,
          ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: lightColorScheme.primary,
          foregroundColor: lightColorScheme.onPrimary,
          disabledBackgroundColor: lightColorScheme.surfaceContainerHighest,
          disabledForegroundColor: lightColorScheme.onSurfaceVariant,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          textStyle: MyTextStyle.btnText,
          padding: EdgeInsets.all(16),
          minimumSize: const Size(double.infinity, 56),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(
            color: lightColorScheme.primary,
          ),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: lightColorScheme.primary,
          foregroundColor: lightColorScheme.onPrimary,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          backgroundColor: lightColorScheme.onSecondary,
          foregroundColor: lightColorScheme.outline,
          disabledBackgroundColor: lightColorScheme.surfaceContainerHigh,
          disabledForegroundColor: lightColorScheme.onSurfaceVariant,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          side: BorderSide(
            width: 1,
            color: lightColorScheme.onInverseSurface
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
