import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Colors.dart';

class MyThemeData {
  static ThemeData lightTheme = ThemeData(
      colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: primary,
          onPrimary: Colors.white,
          secondary: Colors.black,
          onSecondary: Colors.white,
          error: Colors.red,
          onError: Colors.black,
          background: Colors.white,
          onBackground: Colors.black,
          surface: primary,
          onSurface: Colors.black),
      primaryColor: primary,
      cardColor: Colors.white,
      indicatorColor: Colors.black,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: AppBarTheme(
        backgroundColor: primary,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(50),
                bottomLeft: Radius.circular(50))),
        centerTitle: true,
        titleTextStyle: GoogleFonts.exo(fontSize: 22.sp,fontWeight: FontWeight.w400,),
        toolbarHeight: 67.h,
      )
  );
}
