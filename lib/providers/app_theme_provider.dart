import 'package:evently/utils/theme_data.dart';
import 'package:flutter/material.dart';

class AppThemeProvider extends ChangeNotifier{
  ThemeMode themeMode = ThemeMode.light;

  void changeTheme(ThemeMode newThemeMode){
    if(newThemeMode == themeMode){
      return;
    }
    themeMode = newThemeMode;
    notifyListeners();
  }
}