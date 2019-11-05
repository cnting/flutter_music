import 'package:flutter/material.dart';

import 'colors.dart';

ThemeData appTheme = ThemeData(
  primaryColor: CommonColors.primaryColor,
  backgroundColor: CommonColors.background,
  scaffoldBackgroundColor: CommonColors.background,
  appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(color: CommonColors.iconColor),
      color: CommonColors.background,
      elevation: 0,
      textTheme:
          TextTheme(title: TextStyle(fontSize: 17, color: Colors.black))),
  iconTheme: IconThemeData(
    color: CommonColors.iconColor,
  ),
  dividerTheme: DividerThemeData(color: CommonColors.dividerColor),
  dividerColor: CommonColors.dividerColor,
  textTheme: TextTheme(button: TextStyle(fontSize: 17, color: Colors.white)),
  buttonTheme: ButtonThemeData(
      textTheme: ButtonTextTheme.normal,
      buttonColor: CommonColors.primaryColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)))),
  colorScheme: ColorScheme(
      primary: CommonColors.primaryColor,
      primaryVariant: CommonColors.primaryColor,
      secondary: CommonColors.primaryColor,
      secondaryVariant: CommonColors.primaryColor,
      surface: Colors.white,
      background: CommonColors.background,
      error: Colors.red,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: Colors.black,
      onBackground: Colors.black,
      onError: Colors.white,
      brightness: Brightness.light),
  toggleableActiveColor: CommonColors.primaryColor,
);
