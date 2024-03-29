import 'package:flutter/material.dart';

class Constants {
  static String appName = "Flutter Travel";

  //Colors for theme
  static Color lightPrimary = const Color(0xfffcfcff);
  static Color darkPrimary = Colors.black;
  static Color lightAccent = const Color.fromARGB(255, 38, 50, 56);
  static Color darkAccent = Colors.white;
  static Color lightBG = const Color(0xfffcfcff);
  static Color darkBG = Colors.black;
  static Color badgeColor = Colors.red;

  static ThemeData lightTheme = ThemeData(
    backgroundColor: lightBG,
    primaryColor: lightPrimary,
    //accentColor: lightAccent,
    //cursorColor: lightAccent,
    scaffoldBackgroundColor: lightBG,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      // textTheme: TextTheme(
      //   headline6: TextStyle(
      //     color: darkBG,
      //     fontSize: 18.0,
      //     fontWeight: FontWeight.w800,
      //   ),
      // ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    backgroundColor: darkBG,
    primaryColor: darkPrimary,
    //accentColor: darkAccent,
    scaffoldBackgroundColor: darkBG,
    // cursorColor: darkAccent,
    appBarTheme: AppBarTheme(
      elevation: 0,
      // textTheme: TextTheme(
      //   headline6: TextStyle(
      //     color: lightBG,
      //     fontSize: 18.0,
      //     fontWeight: FontWeight.w800,
      //   ),
      // ),
    ),
  );
}
