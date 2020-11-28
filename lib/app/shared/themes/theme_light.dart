import 'package:flutter/material.dart';

/// Classe que representa o tema light usado no aplicativo.
class ThemeLight {
  static final ThemeLight _singleton = ThemeLight._internal();

  factory ThemeLight() {
    return _singleton;
  }

  ThemeLight._internal();

  static final Color primaryColor = Color(0xff25498B);
  static final Color secondaryColor = Color(0xff3E72C1);
  static final Color accentColor = Color(0xffFCC92F);

  static final OutlineInputBorder _outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(5)),
    borderSide: BorderSide(color: primaryColor, width: 1),
  );

  static ThemeData get getThemeData {
    return ThemeData(
      primaryColor: primaryColor,
      accentColor: accentColor,
      secondaryHeaderColor: secondaryColor,
      backgroundColor: Color(0xffffee6b),
      brightness: Brightness.light,
      hintColor: primaryColor,
      textTheme: TextTheme(
        headline4: TextStyle(color: primaryColor, fontWeight: FontWeight.bold),
        bodyText2: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        button: TextStyle(
            color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: TextStyle(fontSize: 14),
        border: _outlineInputBorder,
        enabledBorder: _outlineInputBorder.copyWith(
          borderSide: BorderSide(width: 1, color: primaryColor),
        ),
        focusedBorder: _outlineInputBorder.copyWith(
          borderSide: BorderSide(width: 2, color: primaryColor),
        ),
      ),
      cardTheme: CardTheme(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      appBarTheme: AppBarTheme(
        brightness: Brightness.dark,
        color: Color(0xff0a14a3),
        elevation: 1,
      ),
    );
  }
}
