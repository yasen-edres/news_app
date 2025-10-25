import 'package:flutter/material.dart';
import 'package:news/utils/app_color.dart';
import 'package:news/utils/app_styles.dart';

class AppTheme{
  static final ThemeData lightTheme = ThemeData(
    splashColor: AppColor.blackColor,
    scaffoldBackgroundColor: AppColor.whiteColor,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: AppColor.whiteColor,
      titleTextStyle: TextStyle(
        color: AppColor.blackColor,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    textTheme: TextTheme(
      labelMedium: AppStyle.medium14Black,
      labelLarge:AppStyle.bold16Black,
    )

  );
  static final ThemeData darkTheme = ThemeData(
      splashColor: AppColor.whiteColor,
      scaffoldBackgroundColor: AppColor.blackColor,
      appBarTheme: AppBarTheme(
        centerTitle: true,
        backgroundColor: AppColor.blackColor,
        titleTextStyle: TextStyle(
          color: AppColor.whiteColor,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      textTheme: TextTheme(
        labelMedium: AppStyle.medium14White,
        labelLarge:AppStyle.bold16White,
      )
  );
}