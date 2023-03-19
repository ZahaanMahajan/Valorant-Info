import 'package:flutter/material.dart';
import 'package:valorant/constants.dart';

class AppTheme {
  // light theme
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      centerTitle: true,
      color: kPrimaryColor,
      titleTextStyle: TextStyle(
        color: kSecondaryColor,
        fontFamily: "Valorant",
        fontSize: 26,
        fontWeight: FontWeight.bold,
      ),
    ),
  );

  // dark theme
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(color: Colors.white),
      elevation: 0,
      color: kSecondaryColor,
      titleTextStyle: TextStyle(
        color: kPrimaryColor,
        fontFamily: "Valorant",
        fontSize: 26,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
