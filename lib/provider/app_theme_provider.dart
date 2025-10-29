import 'package:flutter/material.dart';

class AppThemeProvider extends ChangeNotifier {
  //todo: data - function.
  ThemeMode appTheme = ThemeMode.light;

  changeTheme(ThemeMode newTheme) {
    if (appTheme == newTheme) {
      return;
    }
    appTheme = newTheme;
    notifyListeners();
  }

  bool isDark() {
    return appTheme == ThemeMode;
  }
}
