import 'package:flutter/material.dart';
import 'package:news/home/category_details/category_details.dart';
import 'package:news/home/home_screen.dart';
import 'package:news/utils/app_rotes.dart';
import 'package:news/utils/app_theme.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoute.homeRouteName,
      routes: {
        AppRoute.homeRouteName : (context) => ((HomeScreen())),
        AppRoute.categoryDetailsRouteName : (context) => ((CategoryDetails())),
      },
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
    );
  }

}