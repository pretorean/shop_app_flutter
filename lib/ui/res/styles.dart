import 'package:flutter/material.dart';
import 'package:shop_app/ui/res/colors.dart';

/// Основные стили

/// светлая тема
final lightThemeData = ThemeData(
  brightness: Brightness.light,
  primaryColor: colorPrimary_light,
  backgroundColor: colorBackground_light,
  scaffoldBackgroundColor: colorBackground_light,
  errorColor: colorError_light,
  appBarTheme: AppBarTheme(
    color: colorBackground_light,
    brightness: Brightness.light,
    elevation: 0.0,
    iconTheme: IconThemeData(
      color: colorBlack_light,
    ),
    textTheme: TextTheme(
      title: TextStyle(
        fontSize: 34.0,
        fontStyle: FontStyle.normal,
        color: colorBlack_light,
      ),
      body1: TextStyle(
        color: colorBadColors,
      ),
    ),
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: colorPrimary_light,
    textTheme: ButtonTextTheme.primary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(25.0),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: colorWhite_light,
    labelStyle: TextStyle(color: colorGray_light),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.transparent,
        width: 0.0,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.transparent,
        width: 0.0,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: colorError_light,
        width: 1.0,
      ),
    ),
  ),
);

/// темная тема
final darkThemeData = ThemeData(
  brightness: Brightness.dark,
  primaryColor: colorPrimary_dark,
  backgroundColor: colorBackground_dark,
  scaffoldBackgroundColor: colorBackground_dark,
  errorColor: colorError_dark,
  appBarTheme: AppBarTheme(
    color: colorBackground_dark,
    iconTheme: IconThemeData(
      color: colorWhite_dark,
    ),
    brightness: Brightness.dark,
    textTheme: TextTheme(
      title: TextStyle(
        fontSize: 34.0,
        fontStyle: FontStyle.normal,
        color: colorWhite_dark,
      ),
      body1: TextStyle(
        color: colorBadColors,
      ),
    ),
  ),
  buttonTheme: ButtonThemeData(
    textTheme: ButtonTextTheme.primary,
    buttonColor: colorPrimary_dark,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(25.0),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: colorDark_dark,
    labelStyle: TextStyle(color: colorGray_dark),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.transparent,
        width: 0.0,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.transparent,
        width: 0.0,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: colorError_dark,
        width: 1.0,
      ),
    ),
  ),
);
