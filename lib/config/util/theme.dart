import 'package:flutter/material.dart';
import 'package:flutter_music/config/util/colors.dart';

ThemeData appTheme = ThemeData(
  primaryColor: CommonColors.primaryColor,
  backgroundColor: Colors.white,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme:
      AppBarTheme(iconTheme: IconThemeData(color: CommonColors.iconColor)),
  iconTheme: IconThemeData(
    color: CommonColors.iconColor,
  ),
  dividerTheme: DividerThemeData(color: CommonColors.dividerColor),
  dividerColor: CommonColors.dividerColor,
);
