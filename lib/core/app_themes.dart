import 'package:evently/core/app_colors.dart';
import 'package:flutter/material.dart';

class AppThemes {
  static ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.purple,
      onPrimary: AppColors.white,
      secondary: AppColors.black,
      onSecondary: AppColors.white,
      error: Colors.red,
      onError: AppColors.white,
      surface: AppColors.lightBlue,
      onSurface: AppColors.purple,
    ),

    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        padding: EdgeInsets.all(16),
        textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        padding: EdgeInsets.all(16),
        textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: TextStyle(
          fontWeight: FontWeight.w500,
          decoration: TextDecoration.underline,
          fontStyle: FontStyle.italic,
          fontSize: 16,
        ),
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      elevation: 0,
      backgroundColor: AppColors.purple,
      shape: CircleBorder(side: BorderSide(color: AppColors.white)),
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(color: AppColors.purple),
      titleMedium: TextStyle(color: AppColors.purple),
      titleSmall: TextStyle(color: AppColors.purple),
      bodyLarge: TextStyle(color: AppColors.black),
      bodyMedium: TextStyle(color: AppColors.black),
      bodySmall: TextStyle(color: AppColors.black),
      labelLarge: TextStyle(color: AppColors.black),
      labelMedium: TextStyle(color: AppColors.black),
      labelSmall: TextStyle(color: AppColors.black),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.lightBlue,
      foregroundColor: AppColors.purple,
      elevation: 0,
      surfaceTintColor: Colors.transparent,
    ),
    inputDecorationTheme: InputDecorationTheme(
      iconColor: AppColors.gray,
      suffixIconColor: AppColors.gray,
      prefixIconColor: AppColors.gray,
      hintStyle: TextStyle(
        color: AppColors.gray,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(width: 1, color: AppColors.gray),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(width: 1, color: AppColors.gray),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(width: 1, color: Colors.red),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(width: 1, color: Colors.red),
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      unselectedItemColor: AppColors.lightBlue,
      selectedItemColor: AppColors.lightBlue,
      selectedIconTheme: IconThemeData(color: AppColors.lightBlue),
      unselectedIconTheme: IconThemeData(color: AppColors.lightBlue),
      backgroundColor: AppColors.purple,
      type: BottomNavigationBarType.fixed,
    ),
  );
  static ThemeData darkTheme = ThemeData(
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: AppColors.purple,
      onPrimary: AppColors.white,
      secondary: AppColors.white,
      onSecondary: AppColors.darkPurple,
      error: Colors.red,
      onError: AppColors.white,
      surface: AppColors.darkPurple,
      onSurface: AppColors.white,
    ),

    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        padding: EdgeInsets.all(16),
        textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        padding: EdgeInsets.all(16),
        textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: TextStyle(
          fontWeight: FontWeight.w500,
          decoration: TextDecoration.underline,
          fontStyle: FontStyle.italic,
          fontSize: 16,
        ),
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      elevation: 0,
      backgroundColor: AppColors.darkPurple,
      shape: CircleBorder(side: BorderSide(color: AppColors.white)),
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(color: AppColors.purple),
      titleMedium: TextStyle(color: AppColors.purple),
      titleSmall: TextStyle(color: AppColors.purple),
      bodyLarge: TextStyle(color: AppColors.white),
      bodyMedium: TextStyle(color: AppColors.white),
      bodySmall: TextStyle(color: AppColors.white),
      labelLarge: TextStyle(color: AppColors.white),
      labelMedium: TextStyle(color: AppColors.white),
      labelSmall: TextStyle(color: AppColors.white),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.darkPurple,
      foregroundColor: AppColors.purple,
      elevation: 0,
      surfaceTintColor: Colors.transparent,
    ),
    inputDecorationTheme: InputDecorationTheme(
      iconColor: AppColors.white,
      suffixIconColor: AppColors.white,
      prefixIconColor: AppColors.white,
      hintStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(width: 1, color: AppColors.purple),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(width: 1, color: AppColors.purple),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(width: 1, color: Colors.red),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(width: 1, color: Colors.red),
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      unselectedItemColor: AppColors.white,
      selectedItemColor: AppColors.white,
      selectedIconTheme: IconThemeData(color: AppColors.white),
      unselectedIconTheme: IconThemeData(color: AppColors.white),
      backgroundColor: AppColors.darkPurple,
      type: BottomNavigationBarType.fixed,
    ),
  );
}
