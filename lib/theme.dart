import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'res/app_colors.dart';

class AppTheme {
  final bool isDark;

  AppTheme({required this.isDark});

  ThemeData build() {
    return ThemeData(
      scaffoldBackgroundColor: _color(
        AppColors.backgroundDark,
        AppColors.backgroundLight,
      ),

      canvasColor: _color(AppColors.cardDark, AppColors.searchLightColor),
      // searchColorLight
      cardColor: _color(AppColors.cardDark, AppColors.white),
      primaryColor: _color(AppColors.white, AppColors.black),

      unselectedWidgetColor: _color(
        // AppColors.indicatorDark,
        // AppColors.indicatorLight,
        AppColors.unselectDark,
        AppColors.unselectList,
      ),

      primaryColorLight: AppColors.black,
      brightness: isDark ? Brightness.light : Brightness.dark,

      hintColor: _color(AppColors.hintDark, AppColors.hintLight),
      dialogTheme: _dialogTheme(),
      cardTheme: _cardTheme(),
      // iconTheme: _iconTheme(),
      appBarTheme: _appBarTheme(),
      dividerTheme: _dividerTheme(),
      elevatedButtonTheme: _buttonTheme(),

      progressIndicatorTheme: _progressIndicatorTheme(),
      indicatorColor: _color(AppColors.white, AppColors.black),
      dropdownMenuTheme: _dropdownMenuTheme(),
    );
  }

  T _color<T>(T dark, T light) => isDark ? dark : light;

  DropdownMenuThemeData _dropdownMenuTheme() => DropdownMenuThemeData(
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 15.h),
      filled: true,
      fillColor: _color( AppColors.cardDark, AppColors.white),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: _color(AppColors.white, AppColors.black),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(15.r),
      ),
    ),
  );

  DialogThemeData _dialogTheme() => DialogThemeData(
    backgroundColor: _color(AppColors.cardDark, AppColors.white),

    titleTextStyle: GoogleFonts.poppins(
      color: _color(AppColors.white, AppColors.black),
      fontSize: 18.sp,
      fontWeight: FontWeight.bold,
    ),
    contentTextStyle: GoogleFonts.poppins(
      color: _color(
        AppColors.white.withOpacity(.7),
        AppColors.black.withOpacity(.7),
      ),
      fontSize: 15.sp,
      fontWeight: FontWeight.normal,
    ),
  );

  AppBarTheme _appBarTheme() => AppBarTheme(
    iconTheme: IconThemeData(
      color: _color(AppColors.backgroundDark, AppColors.backgroundLight),
    ),
    backgroundColor: _color(
      AppColors.backgroundDark,
      AppColors.backgroundLight,
    ),
    titleTextStyle: GoogleFonts.roboto(
      color: _color(AppColors.white, AppColors.black),
      fontSize: 22.sp,
      fontWeight: FontWeight.bold,
    ),
    centerTitle: true,
  );

  DividerThemeData _dividerTheme() => DividerThemeData(
    color: _color(AppColors.hintDark, AppColors.hintLight),
    thickness: 2,
  );

  ProgressIndicatorThemeData _progressIndicatorTheme() =>
      ProgressIndicatorThemeData(
        color: AppColors.white,
        linearTrackColor: AppColors.red,
        circularTrackColor: AppColors.red,
        refreshBackgroundColor: AppColors.red,
      );

  CardThemeData _cardTheme() => CardThemeData(
    elevation: 2,
    color: _color(AppColors.cardDark, AppColors.white),
  );

  ElevatedButtonThemeData _buttonTheme() => ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      padding: EdgeInsets.zero,
      backgroundColor: AppColors.accentGreen,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
    ),
  );
}


