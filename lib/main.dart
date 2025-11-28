import 'package:flutter/material.dart';
import 'package:news/home/home_screen.dart';
import 'package:news/home/webview/webview.dart';
import 'package:news/provider/app_theme_provider.dart';
import 'package:news/utils/app_rotes.dart';
import 'package:news/utils/app_theme.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => AppThemeProvider()),
    ],
    child: MyApp(),
  ));
}
class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoute.homeRouteName,
      routes: {
        AppRoute.homeRouteName : (context) => ((HomeScreen())),
        AppRoute.webviewRouteName: (context) => ((Webview())),
      },
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeProvider.appTheme,
    );
  }

}