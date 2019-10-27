import 'package:flutter/material.dart';
import 'package:shop_app/ui/res/colors.dart';
import 'package:shop_app/ui/res/text_styles.dart';

/// Основные стили

/// светлая тема
final lightThemeData = ThemeData(
  brightness: Brightness.light,
  //
  primaryColor: colorPrimary_light,

  //    primaryColorLight ??= isDark ? Colors.grey[500] : primarySwatch[100];
  //    primaryColorDark ??= isDark ? Colors.black : primarySwatch[700];
  //    final bool primaryIsDark = primaryColorBrightness == Brightness.dark;
  //    toggleableActiveColor ??= isDark ? Colors.tealAccent[200] : (accentColor ?? primarySwatch[600]);
  //    accentColor ??= isDark ? Colors.tealAccent[200] : primarySwatch[500];
  //    accentColorBrightness ??= estimateBrightnessForColor(accentColor);
  //    final bool accentIsDark = accentColorBrightness == Brightness.dark;
  //    canvasColor ??= isDark ? Colors.grey[850] : Colors.grey[50];
  //    scaffoldBackgroundColor ??= canvasColor;
  //    bottomAppBarColor ??= isDark ? Colors.grey[800] : Colors.white;
  //    cardColor ??= isDark ? Colors.grey[800] : Colors.white;
  //    dividerColor ??= isDark ? const Color(0x1FFFFFFF) : const Color(0x1F000000);

  backgroundColor: colorBackground_light,
  errorColor: colorError_light,
);

/// темная тема
final darkThemeData = ThemeData(
  brightness: Brightness.dark,
  //

  primaryColor: colorPrimary_dark,

  backgroundColor: colorBackground_dark,
  errorColor: colorError_dark,
);

final themeData = ThemeData(
  accentColorBrightness: Brightness.light,
  backgroundColor: backgroundColor,
  appBarTheme: AppBarTheme(
    color: appBarColor,
    brightness: Brightness.light,
    elevation: 4.0,
  ),
  brightness: Brightness.light,
  canvasColor: Colors.transparent,
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
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.0),
      borderSide: BorderSide(
        width: 2.0,
      ),
    ),
    filled: false,
    hintStyle: textRegular16Secondary,
    prefixStyle: textRegular16,
  ),
  cursorColor: black,
);
