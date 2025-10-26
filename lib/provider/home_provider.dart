import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  ThemeMode appTheme = ThemeMode.light;
  String locale = "en";
  int currentPageIndex = 0;

  void changeLocale(String newLocale) {
    if (newLocale == locale) return;
    locale = newLocale;
    notifyListeners();
  }

  void changeTheme(ThemeMode newTheme) {
    if (newTheme == appTheme) return;
    appTheme = newTheme;
    notifyListeners();
  }

  void setPageIndex(int index) {
    if (currentPageIndex != index) {
      currentPageIndex = index;
      notifyListeners();
    }
  }

  bool isDark() {
    return appTheme == ThemeMode.dark;
  }

  bool isEn() {
    return locale == "en";
  }
}
