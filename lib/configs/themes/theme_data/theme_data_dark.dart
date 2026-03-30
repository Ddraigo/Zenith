import 'package:app_demo/configs/themes/app_colors.dart';
import 'package:app_demo/configs/themes/app_fonts.dart';
import 'package:app_demo/configs/themes/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


const ColorScheme darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xFFEBB5ED),
  onPrimary: Color(0xFF49204E),
  primaryContainer: Color(0xFF613766),
  onPrimaryContainer: Color(0xFFFFD6FE),
  primaryFixed: Color(0xFFFFD6FE),
  primaryFixedDim: Color(0xFFEBB5ED),
  onPrimaryFixed: Color(0xFF310937),
  onPrimaryFixedVariant: Color(0xFF613766),
  secondary: Color(0xFFD7BFD5),
  onSecondary: Color(0xFF3B2B3C),
  secondaryContainer: Color(0xFF534153),
  onSecondaryContainer: Color(0xFFF4DBF1),
  secondaryFixed: Color(0xFFF4DBF1),
  secondaryFixedDim: Color(0xFFD7BFD5),
  onSecondaryFixed: Color(0xFF251626),
  onSecondaryFixedVariant: Color(0xFF534153),
  tertiary: Color(0xFFF6B8AD),
  onTertiary: Color(0xFF4C251F),
  tertiaryContainer: Color(0xFF673B34),
  onTertiaryContainer: Color(0xFFFFDAD4),
  tertiaryFixed: Color(0xFFFFDAD4),
  tertiaryFixedDim: Color(0xFFF6B8AD),
  onTertiaryFixed: Color(0xFF33110C),
  onTertiaryFixedVariant: Color(0xFF673B34),
  error: Color(0xFFFFB4AB),
  onError: Color(0xFF690005),
  errorContainer: Color(0xFF93000A),
  onErrorContainer: Color(0xFFFFDAD6),
  surface: Color(0xFF241C23),
  onSurface: Color(0xFFEBDFE6),
  surfaceDim: Color(0xFF241C23),
  surfaceBright: Color(0xFF493F48),
  surfaceContainerLowest: Color(0xFF1F181F),
  surfaceContainerLow: Color(0xFF2C242C),
  surfaceContainer: Color(0xFF302730),
  surfaceContainerHigh: Color(0xFF3A3139),
  surfaceContainerHighest: Color(0xFF443B43),
  onSurfaceVariant: Color(0xFFD0C3CC),
  outline: Color(0xFF998D96),
  outlineVariant: Color(0xFF4D444C),
  shadow: Color(0xFF000000),
  scrim: Color(0xFF000000),
  inverseSurface: Color(0xFFEBDEE6),
  onInverseSurface: Color(0xFF352F34),
  inversePrimary: Color(0xFF7B4E7F),
  surfaceTint: Color(0xFFEBB5ED),
);

// const ColorScheme darkColorScheme = ColorScheme(
//   brightness: Brightness.dark,

//   primary: AppDarkColors.primary600,
//   onPrimary: AppDarkColors.surfaceBackground,
//   primaryContainer: AppDarkColors.backgroundDisabled,
//   onPrimaryContainer: AppDarkColors.textHeading,

//   secondary: AppDarkColors.backgroundSecondary,
//   onSecondary: AppDarkColors.textHeading,
//   secondaryContainer: AppDarkColors.grey100,
//   onSecondaryContainer: AppDarkColors.textHeading,
  

//   tertiary: AppDarkColors.textParagraph,
//   onTertiary: AppDarkColors.textDisabled,
//   tertiaryContainer: AppDarkColors.textPrimary700,
//   onTertiaryContainer: AppDarkColors.textInactive,

//   error: AppDarkColors.backgroundDanger,
//   onError: AppDarkColors.white,
//   errorContainer: AppDarkColors.backgroundLightRed,
//   onErrorContainer: AppDarkColors.typographyDanger,

//   surface: AppDarkColors.surfaceBackground,
//   onSurface: AppDarkColors.textHeading,
//   surfaceDim: AppDarkColors.layer2Background,
//   surfaceBright: AppDarkColors.backgroundDisabled,
//   surfaceContainerLowest: AppDarkColors.surfaceBackground,
//   surfaceContainerLow: AppDarkColors.elementBackground,
//   surfaceContainer: AppDarkColors.layer2Background,
//   surfaceContainerHigh: AppDarkColors.layer3Background,
//   surfaceContainerHighest: AppDarkColors.backgroundGrey,

//   onSurfaceVariant: AppDarkColors.textLightGrey,
//   outline: AppDarkColors.borderDefault,
//   outlineVariant: AppDarkColors.borderLight,

//   shadow: AppDarkColors.darkModeDarkest,
//   scrim: AppDarkColors.darkModeDarkest,

//   inverseSurface: AppDarkColors.darkModeDarkest,
//   onInverseSurface: AppDarkColors.typographyWhite,
//   inversePrimary: AppDarkColors.primary300,

//   surfaceTint: AppDarkColors.primary600,
// );

ThemeData getDarkTheme() {
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
        disabledBackgroundColor: darkColorScheme.outlineVariant,
        disabledForegroundColor: darkColorScheme.secondary,
        shape: RoundedRectangleBorder(borderRadius: radius),
        textStyle: MyTextStyle.poppinsMedium700,
        padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 16.h),
        minimumSize: buttonSize,
        elevation: 0,
      ),
    ),

    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: darkColorScheme.onPrimary,
        foregroundColor: darkColorScheme.primary,
        disabledBackgroundColor: darkColorScheme.outlineVariant,
        disabledForegroundColor: darkColorScheme.secondary,
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
        disabledBackgroundColor: darkColorScheme.outlineVariant,
        disabledForegroundColor: darkColorScheme.secondary,
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
        color: darkColorScheme.onPrimaryFixedVariant,
      ),
      helperStyle: MyTextStyle.poppinsMedium400.copyWith(
        color: darkColorScheme.onPrimaryFixedVariant,
      ),
      errorStyle: MyTextStyle.poppinsMedium400.copyWith(
        color: darkColorScheme.error,
        fontWeight: FontWeight.w600
      ),
      prefixIconColor: darkColorScheme.onPrimaryFixedVariant,
      suffixIconColor: darkColorScheme.onPrimaryFixedVariant,

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