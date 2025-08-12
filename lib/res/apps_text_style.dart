import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppsTextStyle {
  static BuildContext get context => Get.context!;

// Get the current ThemeData
  static ThemeData get theme => Theme.of(context);

// Apps Logo
// Apps Logo (Modify) okay
  static TextStyle get logoTextStyle =>
      GoogleFonts.pacifico(
        color: AppColors.deepGreenAccent,
        fontSize: 24.sp,
        letterSpacing: 1.2,
        fontWeight: FontWeight.w900,
      );

  // Large  Title Text Style (modify) (okay)
  static TextStyle get largeTitle =>
      GoogleFonts.roboto(
          color: theme.primaryColor,
          fontSize: 28.sp,
          fontWeight: FontWeight.w900);

  // MOdify (need to update)
  static TextStyle get authIntroTitleTextStyle =>
      GoogleFonts.roboto(
          color: theme.primaryColor,
          fontSize: 28.sp,
          fontWeight: FontWeight.w900,
          height: 1.3,
          letterSpacing: 1.2);

  // // Ttile
  // static TextStyle get titleSignPageTextStyle => GoogleFonts.roboto(
  //     color: theme.primaryColor,
  //     fontSize: 28.sp,
  //     fontWeight: FontWeight.w900,
  //     height: 1.3,
  //     letterSpacing: 1.2);

  // textCardOrder Details
  // Ttile

  // static TextStyle get orderDateCard => GoogleFonts.poppins(
  //     color: AppColors.white,
  //     fontSize: 28.sp,
  //     fontWeight: FontWeight.bold,
  //     letterSpacing: 1.2);


  // // Large  Title Text Style (Modify)
  // static TextStyle get headingTextStyle => GoogleFonts.roboto(
  //     color: theme.primaryColor, fontSize: 28.sp, fontWeight: FontWeight.w900);

  // Large Bold Text (Modify)
  static TextStyle get largeBoldText =>
      _baseStyle(fontSize: 17, fontWeight: FontWeight.w800);

// Medium Bold Text (Modify)
  static TextStyle get mediumBoldText =>
      _baseStyle(fontSize: 15, fontWeight: FontWeight.bold);

  // Description (Modify)
  static TextStyle get descrptionTextStyle =>
      GoogleFonts.roboto(
          color: AppColors.black.withOpacity(.7),
          fontSize: 15.sp,
          fontWeight: FontWeight.normal,
          height: 1.6,
          letterSpacing: 1.2);

  // Label Text (Modify)
  static TextStyle get labelTextStyle =>
      GoogleFonts.poppins(
        color: theme.primaryColor,
        fontSize: 15.sp,
        fontWeight: FontWeight.w700,
      );

// TextFieldInputStyle(Modify)
  static TextStyle textFieldInputTextStyle(bool isEnable) =>
      GoogleFonts.poppins(
        fontSize: 15.sp,
        color: isEnable ? AppColors.black : AppColors.black.withOpacity(.8),
        fontWeight: isEnable ? FontWeight.w600 : FontWeight.w800,
      );


// subtitle
  static TextStyle get subTitleTextStyle =>
      GoogleFonts.poppins(
        fontWeight: FontWeight.w600,
        fontSize: 15.sp,
        color: theme.hintColor,
      );


  static TextStyle get secondaryTextStyle =>
      _baseStyle(
        fontSize: 15,
        fontWeight: FontWeight.w400,
      );

  /// start
  /// Text style for primary buttons with bold white text and medium size.
  static TextStyle get button =>
      GoogleFonts.poppins(
        color: AppColors.white,
        fontWeight: FontWeight.bold,
        fontSize: 15.sp,
      );


  // Description (Modify)
  static TextStyle get authIntroDescriptionTextStyle =>
      GoogleFonts.roboto(
          color: AppColors.black.withOpacity(.8),
          fontSize: 17.sp,
          fontWeight: FontWeight.normal,
          height: 1.6,
          letterSpacing: 1.2);

  // Common TextStyle helpers
  static TextStyle _baseStyle({
    Color? color,
    required double fontSize,
    FontWeight fontWeight = FontWeight.normal,
    double letterSpacing = 0.0,
    TextDecoration decoration = TextDecoration.none,
  }) {
    return GoogleFonts.poppins(
      color: color ?? theme.primaryColor,
      fontSize: fontSize.sp,
      fontWeight: fontWeight,
      letterSpacing: letterSpacing,
      decoration: decoration,
    );
  }

  // Large Normal Text
  static TextStyle get largeNormalText =>
      GoogleFonts.poppins(
        fontSize: 16.sp,
        color: theme.primaryColor,
        fontWeight: FontWeight.w400,
      );


// App Logo Text Style
  static TextStyle get appLogoStyle =>
      _baseStyle(
          color: AppColors.accentGreen,
          fontSize: 22,
          fontWeight: FontWeight.w900);

  // Title Text Style (App Bar) // Working
  static TextStyle get titleTextStyle =>
      _baseStyle(fontSize: 20, fontWeight: FontWeight.w800);

  // Subtitle Text Style
  static TextStyle get subtitleTextStyle =>
      _baseStyle(
        fontWeight: FontWeight.w600,
        fontSize: 14,
        color: theme.hintColor,
      );

  // Button Text Style (modify)
  static TextStyle get buttonTextStyle =>
      _baseStyle(
          color: AppColors.white, fontWeight: FontWeight.bold, fontSize: 15);

  // Medium Bold Text
  static TextStyle get prouductLarge =>
      _baseStyle(fontSize: 18, fontWeight: FontWeight.w700);

  // Medium Normal Text
  static TextStyle get mediumNormalText =>
      _baseStyle(fontSize: 14, fontWeight: FontWeight.w400);

  // Large Bold Text in Red
  static TextStyle get largeBoldRedText =>
      _baseStyle(
          color: AppColors.red, fontSize: 18, fontWeight: FontWeight.w800);

  // Text Field Input Style
  static TextStyle textFieldInputStyle([bool isEnable = false]) =>
      _baseStyle(
        fontSize: 14,
        color: isEnable ? AppColors.black : AppColors.black.withOpacity(.8),
        fontWeight: isEnable ? FontWeight.w600 : FontWeight.w800,
      );

  // Onboarding Title Text Style
  static TextStyle get onboardingTitleStyle =>
      _baseStyle(
          fontSize: 30, fontWeight: FontWeight.w900, color: AppColors.black);

// Body Text Style
  static TextStyle get bodyTextStyle =>
      _baseStyle(fontWeight: FontWeight.w700, fontSize: 15);

  static TextStyle get largeText =>
      GoogleFonts.roboto(
          fontSize: 16, fontWeight: FontWeight.w700, color: theme.primaryColor);

// Larget Text
  static TextStyle get largestText =>
      _baseStyle(fontSize: 18, fontWeight: FontWeight.bold);

  static TextStyle get largestProductText =>
      _baseStyle(
        letterSpacing: 1.2,
        color: AppColors.red,
        fontSize: 18,
        fontWeight: FontWeight.w900,
      );

  static TextStyle get largeTitleTextStyle =>
      GoogleFonts.roboto(fontSize: 22, fontWeight: FontWeight.w900);


  static TextStyle get hintTextStyle =>
      _baseStyle(
        fontSize: 14,
        color: AppColors.grey,
      );

  static TextStyle get hintBoldTextStyle =>
      _baseStyle(
        fontSize: 14.sp,
        color: AppColors.black.withOpacity(.7),
        fontWeight: FontWeight.w600,
      );

  static TextStyle get forgetPasswordTextStyle =>
      _baseStyle(
        fontSize: 14.sp,
        color: AppColors.hintLight,
        fontWeight: FontWeight.w700,
      );

  static TextStyle mediumText400lineThrough = GoogleFonts.roboto(
      decoration: TextDecoration.lineThrough,
      color: const Color(0xffcecfd2),
      fontSize: 14.sp,
      fontWeight: FontWeight.w700);

  static TextStyle get mediumText600 =>
      GoogleFonts.roboto(
          color: AppColors.red, fontSize: 14, fontWeight: FontWeight.w600);

  static TextStyle get rowTextbold =>
      GoogleFonts.roboto(fontSize: 14, fontWeight: FontWeight.bold);

  static TextStyle get mediumTextbold =>
      GoogleFonts.roboto(
          color: AppColors.red, fontSize: 14, fontWeight: FontWeight.bold);

// Small Bold Text
  static TextStyle get smallBoldText =>
      _baseStyle(fontSize: 14.sp, fontWeight: FontWeight.w700);

  static TextStyle get smallestText =>
      _baseStyle(
        fontSize: 10,
      );

  static TextStyle emptyTestStyle = _baseStyle(
      color: AppColors.red, fontSize: 25, fontWeight: FontWeight.bold);

  static TextStyle get rattingText =>
      _baseStyle(
        color: theme.hintColor,
        fontWeight: FontWeight.w600,
        fontSize: 13,
      );

}



  // static TextStyle get subTitleTextStyle => _baseStyle(
  //       fontSize: 14.sp,
  //       color: theme.primaryColor,
  //       fontWeight: FontWeight.normal,
  //     );


  // static TextStyle get bodyTextStyle => _baseStyle(
  //     color: theme.primaryColor,
  //     fontWeight: FontWeight.normal,
  //     fontSize: 14.sp);

  
  // static TextStyle get titleTextStyle => GoogleFonts.roboto(
  //     color: theme.primaryColor, fontSize: 18.sp, fontWeight: FontWeight.bold);

    // static TextStyle get largeProductFontStyle => _baseStyle(
  //     color: AppColors.red, fontSize: 18.sp, fontWeight: FontWeight.w800);