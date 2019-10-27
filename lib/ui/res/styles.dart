import 'package:flutter/material.dart';
import 'package:shop_app/ui/res/colors.dart';

/// Основные стили

/// светлая тема
final lightThemeData = ThemeData(
  brightness: Brightness.light,
  primaryColor: colorPrimary_light,
  backgroundColor: colorBackground_light,
  scaffoldBackgroundColor: colorBackground_light,
  appBarTheme: AppBarTheme(
    color: colorBackground_light,
    iconTheme: IconThemeData(color: colorBlack_light),
    textTheme: TextTheme(
      title: TextStyle(
        fontSize: 34.0,
        fontStyle: FontStyle.normal,
        color: colorBlack_light,
      ),
      body1: TextStyle(),
    ),
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: colorPrimary_light,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
  ),
  errorColor: colorError_light,
);

/// темная тема
final darkThemeData = ThemeData(
  brightness: Brightness.dark,
  primaryColor: colorPrimary_dark,
  backgroundColor: colorBackground_dark,
  scaffoldBackgroundColor: colorBackground_dark,
  appBarTheme: AppBarTheme(
    color: colorBackground_dark,
    iconTheme: IconThemeData(color: colorWhite_dark),
    textTheme: TextTheme(
      title: TextStyle(
        fontSize: 34.0,
        fontStyle: FontStyle.normal,
        color: colorWhite_dark,
      ),
      body1: TextStyle(),
    ),
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: colorPrimary_dark,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
  ),
  errorColor: colorError_dark,
);
