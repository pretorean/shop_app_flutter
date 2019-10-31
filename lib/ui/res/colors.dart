import 'dart:ui';

import 'package:flutter/material.dart';

// Семантические алиасы
// Пополняютсфя по мере необходимости
// Используют только основную палитру

Color
// light theme colors
    colorWhite_light = _white,
    colorBackground_light = _whiteSmoke_F9,
    colorHotSale_light = _alizarin,
    colorPrimary_light = _alizarin,
    colorGray_light = _nobel,
    colorBlack_light = _nero,
    colorSuccess_light = _eucalyptus,
    colorError_light = _scarlet,

// dark theme colors
    colorHotSale_dark = _coralRed,
    colorDark_dark = _blackRock,
    colorBackground_dark = _blackRussian,
    colorPrimary_dark = _amaranth,
    colorGray_dark = _heather,
    colorWhite_dark = _whiteSmoke_F6,
    colorSuccess_dark = _pastelGreen,
    colorError_dark = _redOrange,

// other colors
    colorBlackLabel = Colors.black,
    colorStarColor = _koromiko,
    colorBadColors = _magenta,
    textColorPrimary = _magenta;

// Основная палитра (http://www.color-blindness.com/color-name-hue/)
Color
// light theme colors
    _white = Colors.white, //White
    _whiteSmoke_F9 = Color(0xFFF9F9F9), //Background
    _alizarin = Color(0xFFDB3022), //Primary //Sale, Hot
    _nobel = Color(0xFF9B9B9B), //Gray
    _nero = Color(0xFF222222), //Black
    _eucalyptus = Color(0xFF2AA952), //Success
    _scarlet = Color(0xFFF01F0E), //Error

// black theme colors
    _coralRed = Color(0xFFFF3E3E), //Sale, Hot
    _blackRock = Color(0xFF2A2C36), //Dark
    _blackRussian = Color(0xFF1E1F28), //Background
    _amaranth = Color(0xFFEF3651), // Primary
    _heather = Color(0xFFABB4BD), //Gray
    _whiteSmoke_F6 = Color(0xFFF6F6F6), //White
    _pastelGreen = Color(0xFF55D85A), //Success
    _redOrange = Color(0xFFFF2424), //Error

// other colors
    _koromiko = Color(0xFFFFBA49),
    _magenta = Color(0xFFFF00FF); // цвет ошибочной палитры
