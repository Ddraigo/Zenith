
import 'package:app_demo/configs/themes/app_colors.dart';
import 'package:app_demo/configs/themes/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyTextStyle {
  const MyTextStyle._();

  static final TextStyle _basePoppins = TextStyle(
    fontFamily: AppFonts.poppins,
    color: AppColors.typography500,
  );

  static final TextStyle _baseRoboto = TextStyle(
    fontFamily: AppFonts.roboto,
    color: AppColors.typography500,
  );

  static final TextStyle _baseRobotoMono = TextStyle(
    fontFamily: AppFonts.robotoMono,
    color: AppColors.typography500,
  );

  static final TextStyle poppinsHeading1 = _basePoppins.copyWith(
    fontSize: 32.sp,
    fontWeight: FontWeight.bold,
    letterSpacing: -0.64,
    height: 1.2,
  );

  static final TextStyle poppinsHeading2 = _basePoppins.copyWith(
    fontSize: 32.sp,
    fontWeight: FontWeight.bold,
    letterSpacing: -0.32,
    height: 1.0,
  );

  static final TextStyle poppinsLarge = _basePoppins.copyWith(
    fontSize: 17.sp,
    fontWeight: FontWeight.bold,
    letterSpacing: -0.17,
    height: 1.3,
  );

  static final TextStyle poppinsMedium = _basePoppins.copyWith(
    fontSize: 15.sp,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 1.3,
  );

  static final TextStyle poppinsSmall = _basePoppins.copyWith(
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
    letterSpacing: 0,
    height: 1.3,
  );

  // ---------------- Poppins Large ----------------
  static final TextStyle poppinsLarge400 = _basePoppins.copyWith(
    fontSize: 17.sp,
    fontWeight: FontWeight.w400,
    letterSpacing: -0.17,
    height: 1.5,
  );

  static final TextStyle poppinsLarge600 = _basePoppins.copyWith(
    fontSize: 17.sp,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.17,
    height: 1.5,
  );

  static final TextStyle poppinsLarge700 = _basePoppins.copyWith(
    fontSize: 17.sp,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.17,
    height: 1.5,
  );

  // ---------------- Poppins Medium ----------------
  static final TextStyle poppinsMedium400 = _basePoppins.copyWith(
    fontSize: 15.sp,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 1.7,
  );

  static final TextStyle poppinsMedium600 = _basePoppins.copyWith(
    fontSize: 15.sp,
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
    height: 1.7,
  );

  static final TextStyle poppinsMedium700 = _basePoppins.copyWith(
    fontSize: 15.sp,
    fontWeight: FontWeight.w700,
    letterSpacing: 0,
    height: 1.7,
  );

  // ---------------- Poppins Small ----------------
  static final TextStyle poppinsSmall500 = _basePoppins.copyWith(
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
    letterSpacing: 0,
    height: 1.7,
    color: AppColors.black, 
  );

  static final TextStyle poppinsSmall600 = _basePoppins.copyWith(
    fontSize: 12.sp,
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
    height: 1.7,
  );

  static final TextStyle poppinsSmall700 = _basePoppins.copyWith(
    fontSize: 12.sp,
    fontWeight: FontWeight.w700,
    letterSpacing: 0,
    height: 1.7,
  );

  // ==================== ROBOTO ====================

  static final TextStyle robotoHeading = _baseRoboto.copyWith(
    fontSize: 24.sp,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.48,
    height: 1.0,
  );

  static final TextStyle robotoLarge = _baseRoboto.copyWith(
    fontSize: 17.sp,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.17,
    height: 1.3,
  );

  static final TextStyle robotoMedium = _baseRoboto.copyWith(
    fontSize: 15.sp,
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
    height: 1.3,
  );

  static final TextStyle robotoSmall = _baseRoboto.copyWith(
    fontSize: 12.sp,
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
    height: 1.3,
  );

  static final TextStyle robotoMonoMedium = _baseRobotoMono.copyWith(
    fontSize: 15.sp,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 1.7,
  );

  // static final TextStyle headingH1 = _baseText.copyWith(fontSize: 26.sp, fontWeight: FontWeight.bold, height: 1.5);
  // static final TextStyle headingH2 = _baseText.copyWith(fontSize: 24.sp, fontWeight: FontWeight.bold, height: 1.5);
  // static final TextStyle headingH3 = _baseText.copyWith(fontSize: 20.sp, fontWeight: FontWeight.bold, height: 1.5);
  // static final TextStyle headingH4 = _baseText.copyWith(fontSize: 16.sp, fontWeight: FontWeight.bold, height: 1.5);
  // static final TextStyle headingH5 = _baseText.copyWith(fontSize: 14.sp, fontWeight: FontWeight.bold, height: 1.5);
  // static final TextStyle headingH6 = _baseText.copyWith(fontSize: 12.sp, fontWeight: FontWeight.bold, height: 1.5);

  // // --- BODY TEXT (height: 1.8, normal) ---
  // static final TextStyle bodyTextBigNormal = _baseText.copyWith(fontSize: 16.sp, fontWeight: FontWeight.normal, height: 1.8);
  // static final TextStyle bodyTextNormal    = _baseText.copyWith(fontSize: 14.sp, fontWeight: FontWeight.normal, height: 1.8);
  // static final TextStyle bodyTextSmallNormal = _baseText.copyWith(fontSize: 12.sp, fontWeight: FontWeight.normal, height: 1.8);

  // // --- FORM TEXT (Đổi màu) ---
  // static final TextStyle formTextNormal = _baseText.copyWith(fontSize: 12.sp, fontWeight: FontWeight.normal, color: AppColors.grey400, height: 1.8);
  // static final TextStyle formTextFill   = _baseText.copyWith(fontSize: 12.sp, fontWeight: FontWeight.w700, color: AppColors.grey400, height: 1.8);

  // // --- BUTTON & LINK ---
  // static final TextStyle btnText     = _baseText.copyWith(fontSize: 14.sp, fontWeight: FontWeight.bold, color: AppColors.grey500, height: 1.8);
  // static final TextStyle linkRegular = _baseText.copyWith(fontSize: 14.sp, fontWeight: FontWeight.bold, color: AppColors.primary100, height: 1.5);
  // static final TextStyle linkSmall   = _baseText.copyWith(fontSize: 12.sp, fontWeight: FontWeight.bold, color: AppColors.primary100, height: 1.5);

  // // --- CAPTION ---
  // static final TextStyle captionBold   = _baseText.copyWith(fontSize: 10.sp, fontWeight: FontWeight.bold, height: 1.5);
  // static final TextStyle captionNormal = _baseText.copyWith(fontSize: 10.sp, fontWeight: FontWeight.normal, height: 1.5);
}
