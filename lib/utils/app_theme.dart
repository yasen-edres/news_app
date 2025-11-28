import 'package:flutter/material.dart';
import 'package:news/utils/app_color.dart';
import 'package:news/utils/app_styles.dart';

class AppTheme{
  static final ThemeData lightTheme = ThemeData(
      primaryColor: AppColor.whiteColor,
    splashColor: AppColor.blackColor,
    scaffoldBackgroundColor: AppColor.whiteColor,
    appBarTheme: AppBarTheme(
      centerTitle: true,
        backgroundColor: AppColor.whiteColor,
        iconTheme: IconThemeData(
            color: AppColor.blackColor
        )
    ),
    textTheme: TextTheme(
      labelMedium: AppStyle.medium14Black,
      labelLarge:AppStyle.bold16Black,
      headlineMedium: AppStyle.medium24Black,
      titleMedium: AppStyle.medium20Black,
    )

  );
  static final ThemeData darkTheme = ThemeData(
      primaryColor: AppColor.blackColor,
      splashColor: AppColor.whiteColor,
      scaffoldBackgroundColor: AppColor.blackColor,
      appBarTheme: AppBarTheme(
        centerTitle: true,
        backgroundColor: AppColor.blackColor,
          iconTheme: IconThemeData(
              color: AppColor.whiteColor
          )
      ),
      textTheme: TextTheme(
        labelMedium: AppStyle.medium14White,
        labelLarge:AppStyle.bold16White,
        headlineMedium: AppStyle.medium24White,
        titleMedium: AppStyle.medium20White,

      )
  );
}