import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_text.dart';

ThemeData appTheme = ThemeData(
  primaryColor: mainColor,
  scaffoldBackgroundColor: backgroundColor,
  fontFamily: 'Inter',
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.white,
    iconTheme: const IconThemeData(color: fontColor),
    elevation: 0,
    titleTextStyle: mediumTextStyle.copyWith(fontSize: 24),
    centerTitle: false,
  ),
  textTheme: TextTheme(
    headline1: regularTextStyle.copyWith(fontSize: 32),
    headline2: regularTextStyle.copyWith(fontSize: 20),
    headline3: regularTextStyle.copyWith(fontSize: 18),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: mainColor,
      foregroundColor: mainColor,
      elevation: 0,
      minimumSize: const Size(double.infinity, 46),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(21),
      ),
      textStyle: semiBoldTextStyle,
      shadowColor: Colors.transparent,
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      textStyle: mediumTextStyle,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(9),
      ),
      side: const BorderSide(
        color: mainColor,
        width: 1,
      ),
      backgroundColor: mainColor,
      foregroundColor: mainColor,
      minimumSize: const Size(double.infinity, 46),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      backgroundColor: mainColor,
      foregroundColor: mainColor,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(9),
      ),
      textStyle: semiBoldTextStyle.copyWith(color: backgroundColor),
      shadowColor: Colors.transparent,
    ),
  ),
  iconTheme: const IconThemeData(
    color: mainColor,
  ),
  listTileTheme: ListTileThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  ),
  checkboxTheme: CheckboxThemeData(
    fillColor: MaterialStateProperty.all(mainColor),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4),
    ),
    side: const BorderSide(
      color: mainColor,
      width: 1,
    ),
  ),
  radioTheme: RadioThemeData(
    fillColor: MaterialStateProperty.all(mainColor),
  ),
  
);