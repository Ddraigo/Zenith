import 'package:app_demo/configs/themes/app_colors.dart';
import 'package:app_demo/configs/themes/app_fonts.dart';
import 'package:app_demo/configs/themes/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


const ColorScheme darkColorScheme = ColorScheme(
  brightness: Brightness.dark,

  primary: AppDarkColors.primary600,
  onPrimary: AppDarkColors.surfaceBackground,
  primaryContainer: AppDarkColors.backgroundDisabled,
  onPrimaryContainer: AppDarkColors.textHeading,

  secondary: AppDarkColors.backgroundSecondary,
  onSecondary: AppDarkColors.textHeading,
  secondaryContainer: AppDarkColors.grey100,
  onSecondaryContainer: AppDarkColors.textHeading,
  

  tertiary: AppDarkColors.textParagraph,
  onTertiary: AppDarkColors.textDisabled,
  tertiaryContainer: AppDarkColors.textPrimary700,
  onTertiaryContainer: AppDarkColors.textInactive,

  error: AppDarkColors.backgroundDanger,
  onError: AppDarkColors.white,
  errorContainer: AppDarkColors.backgroundLightRed,
  onErrorContainer: AppDarkColors.typographyDanger,

  surface: AppDarkColors.surfaceBackground,
  onSurface: AppDarkColors.textHeading,
  surfaceDim: AppDarkColors.layer2Background,
  surfaceBright: AppDarkColors.backgroundDisabled,
  surfaceContainerLowest: AppDarkColors.surfaceBackground,
  surfaceContainerLow: AppDarkColors.elementBackground,
  surfaceContainer: AppDarkColors.layer2Background,
  surfaceContainerHigh: AppDarkColors.layer3Background,
  surfaceContainerHighest: AppDarkColors.backgroundGrey,

  onSurfaceVariant: AppDarkColors.textLightGrey,
  outline: AppDarkColors.borderDefault,
  outlineVariant: AppDarkColors.borderLight,

  shadow: AppDarkColors.darkModeDarkest,
  scrim: AppDarkColors.darkModeDarkest,

  inverseSurface: AppDarkColors.darkModeDarkest,
  onInverseSurface: AppDarkColors.typographyWhite,
  inversePrimary: AppDarkColors.primary300,

  surfaceTint: AppDarkColors.primary600,
);

ThemeData getDarkTheme() {
  final buttonSize = Size(120.w, 48.h);
  final radius = BorderRadius.circular(12.r);

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
    colorScheme: darkColorScheme,

    scaffoldBackgroundColor: darkColorScheme.onPrimary,
    canvasColor: darkColorScheme.onPrimary,
    cardColor: darkColorScheme.surfaceContainerLow,
    dividerColor: darkColorScheme.surfaceContainerHigh,

    textTheme: ThemeData.dark().textTheme.apply(
      bodyColor: darkColorScheme.onPrimaryContainer,
      displayColor: darkColorScheme.onSurface,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: darkColorScheme.primary,
        foregroundColor: darkColorScheme.onPrimary,
        disabledBackgroundColor: darkColorScheme.surfaceContainerHigh,
        disabledForegroundColor: darkColorScheme.onTertiary,
        shape: RoundedRectangleBorder(borderRadius: radius),
        textStyle: MyTextStyle.poppinsMedium700,
        padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 12.h),
        minimumSize: buttonSize,
        elevation: 0,
      ),
    ),

    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: darkColorScheme.onPrimary,
        foregroundColor: darkColorScheme.primary,
        disabledBackgroundColor: darkColorScheme.primaryContainer,
        disabledForegroundColor: darkColorScheme.onTertiary,
        shape: RoundedRectangleBorder(borderRadius: radius),
        textStyle: MyTextStyle.poppinsMedium700,
        padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 12.h),
        minimumSize: buttonSize,
      ),
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.transparent,
        foregroundColor: darkColorScheme.onSecondaryContainer,
        disabledBackgroundColor: darkColorScheme.primaryContainer,
        disabledForegroundColor: darkColorScheme.onTertiary,
        side: const BorderSide(
          color: AppDarkColors.grey200,
          width: 1,
        ),
        shape: RoundedRectangleBorder(borderRadius: radius),
        textStyle: MyTextStyle.poppinsMedium700,
        padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 12.h),
        minimumSize: buttonSize,
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppDarkColors.elementBackground,
      contentPadding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 12.h),
      hintStyle: MyTextStyle.poppinsMedium400.copyWith(
        color: darkColorScheme.tertiary,
      ),
      helperStyle: MyTextStyle.poppinsMedium400.copyWith(
        color: darkColorScheme.tertiary,
      ),
      errorStyle: MyTextStyle.poppinsMedium400.copyWith(
        color: darkColorScheme.error,
        fontWeight: FontWeight.w600
      ),
      prefixIconColor: darkColorScheme.tertiary,
      suffixIconColor: darkColorScheme.tertiary,

      border: defaultInputBorder,
      enabledBorder: defaultInputBorder,

      focusedBorder: defaultInputBorder.copyWith(
        borderSide: BorderSide(
          color: darkColorScheme.primary,
          width: 2,
        ),
      ),

      errorBorder: OutlineInputBorder(
        borderRadius: radius,
        borderSide:  BorderSide(
          color: darkColorScheme.error,
          width: 1,
        ),
      ),

      focusedErrorBorder: OutlineInputBorder(
        borderRadius: radius,
        borderSide: BorderSide(
          color: darkColorScheme.error,
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
      foregroundColor: darkColorScheme.onSecondaryContainer,
    ),
  );
}