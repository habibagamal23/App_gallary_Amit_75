import 'package:flutter/material.dart';

import '../core/Theme/Theme.dart';

class ThemeProvider extends ChangeNotifier{
  bool isDark =false;

  ThemeData get  currentTheme => isDark?  ThemeCustom.darkTheme :ThemeCustom.lightTheme;

  void ToggleTheme(){
    isDark = !isDark;
    notifyListeners();
  }

}