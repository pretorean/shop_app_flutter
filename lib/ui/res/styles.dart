import 'package:flutter/material.dart';
import 'package:shop_app/ui/res/colors.dart';

/// Основные стили

/// светлая тема
final lightThemeData = ThemeData(
  brightness: Brightness.light,
  primaryColor: colorPrimary_light,
  //
  fontFamily: 'Metropolis',

  backgroundColor: colorBackground_light,
  errorColor: colorError_light,
);

/// темная тема
final darkThemeData = ThemeData(
  brightness: Brightness.dark,
  primaryColor: colorPrimary_dark,
  //
  fontFamily: 'Metropolis',

  backgroundColor: colorBackground_dark,
  errorColor: colorError_dark,
);
