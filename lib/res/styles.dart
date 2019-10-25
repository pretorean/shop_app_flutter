import 'package:flutter/material.dart';
import 'package:shop_app/res/colors.dart';
import 'package:shop_app/res/text_styles.dart';

/// Основные стили
// todo Настройка темы приложения
final themeData = ThemeData(
  primaryColor: primaryColor,
  accentColor: colorAccent,
  accentColorBrightness: Brightness.light,
  backgroundColor: backgroundColor,
  appBarTheme: AppBarTheme(
    color: appBarColor,
    brightness: Brightness.light,
    elevation: 4.0,
  ),
  brightness: Brightness.light,
  canvasColor: Colors.transparent,
  buttonColor: colorAccent,
  errorColor: colorError,
  scaffoldBackgroundColor: backgroundColor,
  hintColor: hintColor,
  textTheme: TextTheme(),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.0),
      borderSide: BorderSide(color: dividerColor),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.0),
      borderSide: BorderSide(color: colorError),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.0),
      borderSide: BorderSide(
        color: colorAccent,
        width: 2.0,
      ),
    ),
    filled: false,
    hintStyle: textRegular16Secondary,
    prefixStyle: textRegular16,
  ),
  cursorColor: black,
  textSelectionHandleColor: colorAccent,
);
