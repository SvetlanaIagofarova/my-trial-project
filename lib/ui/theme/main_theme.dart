import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MainTheme {
  ThemeData mainTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.red,
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: Colors.red,
      selectionColor:  Colors.red,
      selectionHandleColor:  Colors.red
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor:  Colors.red,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.blueGrey,
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: const TextStyle(
        color: Colors.blueGrey,
        fontWeight: FontWeight.w300,
      ),
      isDense: true,
      contentPadding: EdgeInsets.all(1.5.h),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.red,
        ),
      ),
    ),
  );
}
