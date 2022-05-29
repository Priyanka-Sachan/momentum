import 'package:flutter/material.dart';

class MomentumTheme {
  static TextTheme lightTextTheme = TextTheme(
    headline1: TextStyle(fontSize: 56, fontFamily: 'Lato', color: Colors.black),
    headline2: TextStyle(fontSize: 48, fontFamily: 'Lato', color: Colors.black),
    headline3: TextStyle(fontSize: 40, fontFamily: 'Lato', color: Colors.black),
    headline4: TextStyle(fontSize: 32, fontFamily: 'Lato', color: Colors.black),
    headline5: TextStyle(fontSize: 24, fontFamily: 'Lato', color: Colors.black),
    headline6: TextStyle(fontSize: 20, fontFamily: 'Lato', color: Colors.black),
    subtitle1: TextStyle(fontSize: 18, fontFamily: 'Lato', color: Colors.black),
    subtitle2: TextStyle(fontSize: 16, fontFamily: 'Lato', color: Colors.black),
    bodyText1: TextStyle(fontSize: 14, fontFamily: 'Lato', color: Colors.black),
    bodyText2: TextStyle(fontSize: 14, fontFamily: 'Lato', color: Colors.grey),
  );

  static ThemeData light() {
    return ThemeData(
      brightness: Brightness.light,
      colorScheme: ColorScheme.light(
        primary: Colors.redAccent,
        secondary: Color(0xff0c1020),
      ),
      appBarTheme: const AppBarTheme(
        elevation: 0,
        foregroundColor: Colors.black,
        backgroundColor: Colors.transparent,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        foregroundColor: Colors.white,
        backgroundColor: Colors.redAccent,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: Colors.black,
      ),
      textTheme: lightTextTheme,
    );
  }
}
