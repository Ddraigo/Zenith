import 'package:app_demo/configs/themes/app_colors.dart';
import 'package:app_demo/configs/themes/app_fonts.dart';
import 'package:app_demo/configs/themes/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// const ColorScheme lightColorScheme = ColorScheme(
//   brightness: Brightness.light,

//   primary: AppColors.primary600,
//   onPrimary: AppColors.surfaceBackground,
//   primaryContainer: AppColors.backgroundDisabled,
//   onPrimaryContainer: AppColors.textHeading,

//   secondary: AppColors.backgroundSecondary,
//   onSecondary: AppColors.textHeading,
//   secondaryContainer: AppColors.grey100,
//   onSecondaryContainer: AppColors.textHeading,
  

//   tertiary: AppColors.textParagraph,
//   onTertiary: AppColors.textDisabled,
//   tertiaryContainer: AppColors.textPrimary700,
//   onTertiaryContainer: AppColors.textInactive,

//   error: AppColors.backgroundDanger,
//   onError: AppColors.white,
//   errorContainer: AppColors.backgroundLightRed,
//   onErrorContainer: AppColors.typographyDanger,

//   surface: AppColors.surfaceBackground,
//   onSurface: AppColors.textHeading,
//   surfaceDim: AppColors.layer2Background,
//   surfaceBright: AppColors.backgroundDisabled,
//   surfaceContainerLowest: AppColors.surfaceBackground,
//   surfaceContainerLow: AppColors.elementBackground,
//   surfaceContainer: AppColors.layer2Background,
//   surfaceContainerHigh: AppColors.layer3Background,
//   surfaceContainerHighest: AppColors.backgroundGrey,

//   onSurfaceVariant: AppColors.textLightGrey,
//   outline: AppColors.borderDefault,
//   outlineVariant: AppColors.borderLight,

//   shadow: AppColors.darkModeDarkest,
//   scrim: AppColors.darkModeDarkest,

//   inverseSurface: AppColors.darkModeDarkest,
//   onInverseSurface: AppColors.typographyWhite,
//   inversePrimary: AppColors.primary300,

//   surfaceTint: AppColors.primary600,
// );

/// Light [ColorScheme] made with FlexColorScheme v8.4.0.
/// Requires Flutter 3.22.0 or later.
const ColorScheme lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xFF8C2C8C), //8C2C8C 7B4E7F
  onPrimary: Color(0xFFFFFFFF),
  primaryContainer: Color(0xFFFFD6FE),
  onPrimaryContainer: Color(0xFF141214),
  primaryFixed: Color(0xFFFFD6FE),
  primaryFixedDim: Color(0xFFEBB5ED),
  onPrimaryFixed: Color(0xFF310937),
  onPrimaryFixedVariant: Color(0xFF613766),
  secondary: Color(0xFF6B586B),
  onSecondary: Color(0xFFFAF9FC),
  secondaryContainer: Color(0xFFF4DBF1),
  onSecondaryContainer: Color(0xFF251626),
  secondaryFixed: Color(0xFFF4DBF1),
  secondaryFixedDim: Color(0xFFD7BFD5),
  onSecondaryFixed: Color(0xFF251626),
  onSecondaryFixedVariant: Color(0xFF534153),
  tertiary: Color(0xFF82524A),
  onTertiary: Color(0xFFFFFFFF),
  tertiaryContainer: Color(0xFFFFDAD4),
  onTertiaryContainer: Color(0xFF33110C),
  tertiaryFixed: Color(0xFFFFDAD4),
  tertiaryFixedDim: Color(0xFFF6B8AD),
  onTertiaryFixed: Color(0xFF33110C),
  onTertiaryFixedVariant: Color(0xFF673B34),
  error: Color.fromARGB(255, 234, 59, 59),
  onError: Color(0xFFFFFFFF),
  errorContainer: Color(0xFFFFDAD6),
  onErrorContainer: Color(0xFF410002),
  surface: Color(0xFFFDF4F8),
  onSurface: Color(0xFF1F1A1F),
  surfaceDim: Color(0xFFE0D5DD),
  surfaceBright: Color(0xFFFDF4F8),
  surfaceContainerLowest: Color(0xFFFDFCFD),
  surfaceContainerLow: Color(0xFFFAEDF5),
  surfaceContainer: Color(0xFFF4E9F0),
  surfaceContainerHigh: Color(0xFFEEE3EA),
  surfaceContainerHighest: Color(0xFFE9DDE4),
  onSurfaceVariant: Color(0xFF4D444C),
  outline: Color(0xFF7F747D),
  outlineVariant: Color(0xFFD0C3CC),
  shadow: Color(0xFF000000),
  scrim: Color(0xFF000000),
  inverseSurface: Color(0xFF362F35),
  onInverseSurface: Color(0xFFF9EEF5),
  inversePrimary: Color(0xFFEBB5ED),
  surfaceTint: Color(0xFF7B4E7F),
);

ThemeData getLightTheme() {
  final buttonSize = Size(120.w, 48.h);
  final radius = BorderRadius.circular(12.r);

  final defaultInputBorder = OutlineInputBorder(
    borderRadius: radius,
    borderSide: const BorderSide(
      color: AppColors.grey200,
      width: 1,
    ),
  );

  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    fontFamily: AppFonts.poppins,
    colorScheme: lightColorScheme,

    scaffoldBackgroundColor: lightColorScheme.onSecondary,
    canvasColor: lightColorScheme.onPrimary,
    cardColor: lightColorScheme.surfaceContainerLow,
    dividerColor: lightColorScheme.surfaceContainerHigh,

    textTheme: ThemeData.light().textTheme.apply(
      bodyColor: lightColorScheme.onPrimaryContainer,
      displayColor: lightColorScheme.onSurface,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: lightColorScheme.primary,
        foregroundColor: lightColorScheme.onPrimary,
        disabledBackgroundColor: lightColorScheme.outlineVariant,
        disabledForegroundColor: lightColorScheme.secondary,
        shape: RoundedRectangleBorder(borderRadius: radius),
        textStyle: MyTextStyle.poppinsMedium700,
        padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 16.h),
        minimumSize: buttonSize,
        elevation: 0,
      ),
    ),

    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: lightColorScheme.onPrimary,
        foregroundColor: lightColorScheme.primary,
        disabledBackgroundColor: lightColorScheme.outlineVariant,
        disabledForegroundColor: lightColorScheme.secondary,
        shape: RoundedRectangleBorder(borderRadius: radius),
        textStyle: MyTextStyle.poppinsMedium700,
        padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 12.h),
        minimumSize: buttonSize,
      ),
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.transparent,
        foregroundColor: lightColorScheme.primary,
        disabledBackgroundColor: lightColorScheme.outlineVariant,
        disabledForegroundColor: lightColorScheme.secondary,
        side: const BorderSide(
          color: AppColors.grey200,
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
      fillColor: AppColors.elementBackground,
      contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
      hintStyle: MyTextStyle.poppinsMedium400.copyWith(
        color: lightColorScheme.outlineVariant,
      ),
      helperStyle: MyTextStyle.poppinsMedium400.copyWith(
        color: lightColorScheme.onPrimaryFixedVariant,
      ),
      errorStyle: MyTextStyle.poppinsMedium400.copyWith(
        color: lightColorScheme.error.withOpacity(0.5),
        fontWeight: FontWeight.w600
      ),
      prefixIconColor: lightColorScheme.outlineVariant,
      suffixIconColor: lightColorScheme.outlineVariant,

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
          color: lightColorScheme.error.withOpacity(0.5),
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