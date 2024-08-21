import 'package:flutter/material.dart'
    show ThemeData, Colors, AppBarTheme, IconThemeData, TextStyle, Color;
import 'package:flutter_screenutil/flutter_screenutil.dart';

ThemeData appTheme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    fontFamily: 'Muli',
    appBarTheme: _appBarTheme(),
  );
}

AppBarTheme _appBarTheme() {
  return AppBarTheme(
    color: Colors.white,
    elevation: 0,
    centerTitle: true,
    iconTheme: const IconThemeData(color: Color(0XFF8B8B8B)),
    titleTextStyle: TextStyle(color: const Color(0XFF8B8B8B), fontSize: 18.sp),
  );
}
