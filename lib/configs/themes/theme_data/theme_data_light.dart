import 'package:app_demo/configs/themes/app_colors.dart';
import 'package:app_demo/configs/themes/app_fonts.dart';
import 'package:app_demo/configs/themes/text_style.dart';
import 'package:flutter/material.dart';

const ColorScheme lightColorScheme = ColorScheme(
  brightness: Brightness.light,

  primary: AppColors.primary600,
  onPrimary: AppColors.surfaceBackground,
  primaryContainer: AppColors.backgroundDisabled,
  onPrimaryContainer: AppColors.textHeading,

  secondary: AppColors.backgroundSecondary,
  onSecondary: AppColors.textHeading,
  secondaryContainer: AppColors.grey100,
  onSecondaryContainer: AppColors.textHeading,
  

  tertiary: AppColors.textParagraph,
  onTertiary: AppColors.textDisabled,
  tertiaryContainer: AppColors.textPrimary700,
  onTertiaryContainer: AppColors.textInactive,

  error: AppColors.backgroundDanger,
  onError: AppColors.white,
  errorContainer: AppColors.backgroundLightRed,
  onErrorContainer: AppColors.typographyDanger,

  surface: AppColors.surfaceBackground,
  onSurface: AppColors.textHeading,
  surfaceDim: AppColors.layer2Background,
  surfaceBright: AppColors.backgroundDisabled,
  surfaceContainerLowest: AppColors.surfaceBackground,
  surfaceContainerLow: AppColors.elementBackground,
  surfaceContainer: AppColors.layer2Background,
  surfaceContainerHigh: AppColors.layer3Background,
  surfaceContainerHighest: AppColors.backgroundGrey,

  onSurfaceVariant: AppColors.textLightGrey,
  outline: AppColors.borderDefault,
  outlineVariant: AppColors.borderLight,

  shadow: AppColors.darkModeDarkest,
  scrim: AppColors.darkModeDarkest,

  inverseSurface: AppColors.darkModeDarkest,
  onInverseSurface: AppColors.typographyWhite,
  inversePrimary: AppColors.primary300,

  surfaceTint: AppColors.primary600,
);

ThemeData getLightTheme() {
  const buttonSize = Size(120, 48);
  final radius = BorderRadius.circular(12);

  final defaultInputBorder = OutlineInputBorder(
    borderRadius: radius,
    borderSide: const BorderSide(
      color: AppDarkColors.grey200,
      width: 1,
    ),
  );

  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    fontFamily: AppFonts.poppins,
    colorScheme: lightColorScheme,

    scaffoldBackgroundColor: AppColors.grey0,
    canvasColor: AppColors.grey0,
    cardColor: lightColorScheme.surfaceContainerLow,
    dividerColor: lightColorScheme.surfaceContainerHigh,

    textTheme: ThemeData.dark().textTheme.apply(
      bodyColor: lightColorScheme.onPrimaryContainer,
      displayColor: lightColorScheme.onSurface,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: lightColorScheme.primary,
        foregroundColor: lightColorScheme.onPrimary,
        disabledBackgroundColor: lightColorScheme.surfaceContainerHigh,
        disabledForegroundColor: lightColorScheme.onTertiary,
        shape: RoundedRectangleBorder(borderRadius: radius),
        textStyle: MyTextStyle.poppinsMedium700,
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
        minimumSize: buttonSize,
        elevation: 0,
      ),
    ),

    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: lightColorScheme.onPrimary,
        foregroundColor: lightColorScheme.primary,
        disabledBackgroundColor: lightColorScheme.primaryContainer,
        disabledForegroundColor: lightColorScheme.onTertiary,
        shape: RoundedRectangleBorder(borderRadius: radius),
        textStyle: MyTextStyle.poppinsMedium700,
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
        minimumSize: buttonSize,
      ),
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.transparent,
        foregroundColor: lightColorScheme.onSecondaryContainer,
        disabledBackgroundColor: lightColorScheme.primaryContainer,
        disabledForegroundColor: lightColorScheme.onTertiary,
        side: const BorderSide(
          color: AppDarkColors.grey200,
          width: 1,
        ),
        shape: RoundedRectangleBorder(borderRadius: radius),
        textStyle: MyTextStyle.poppinsMedium700,
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
        minimumSize: buttonSize,
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.elementBackground,
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      hintStyle: MyTextStyle.poppinsMedium400.copyWith(
        color: lightColorScheme.tertiary,
      ),
      helperStyle: MyTextStyle.poppinsMedium400.copyWith(
        color: lightColorScheme.tertiary,
      ),
      errorStyle: MyTextStyle.poppinsMedium400.copyWith(
        color: lightColorScheme.error,
        fontWeight: FontWeight.w600
      ),
      prefixIconColor: lightColorScheme.tertiary,
      suffixIconColor: lightColorScheme.tertiary,

      border: defaultInputBorder,
      enabledBorder: defaultInputBorder,

      focusedBorder: defaultInputBorder.copyWith(
        borderSide: BorderSide(
          color: lightColorScheme.primary,
          width: 2,
        ),
      ),

      errorBorder: OutlineInputBorder(
        borderRadius: radius,
        borderSide:  BorderSide(
          color: lightColorScheme.error,
          width: 1,
        ),
      ),

      focusedErrorBorder: OutlineInputBorder(
        borderRadius: radius,
        borderSide: BorderSide(
          color: lightColorScheme.error,
          width: 2,
        ),
      ),

      disabledBorder: OutlineInputBorder(
        borderRadius: radius,
        borderSide: BorderSide(
          color: Colors.transparent,
          width: 1,
        ),
      ),

    ),

    appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      foregroundColor: lightColorScheme.onSecondaryContainer,
    ),
  );
}