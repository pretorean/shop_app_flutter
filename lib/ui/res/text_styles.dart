import 'package:flutter/painting.dart';
import 'package:shop_app/ui/res/colors.dart';

/// Стили текстов

TextStyle _text = TextStyle(
  fontStyle: FontStyle.normal,
  color: textColorPrimary,
),

//Light
    textLight = _text.copyWith(fontWeight: FontWeight.w300),

//Regular
    textRegular = _text.copyWith(fontWeight: FontWeight.normal),
    textRegular10 = textRegular.copyWith(fontSize: 10.0),
    textRegular12 = textRegular.copyWith(fontSize: 12.0),
    textRegular14 = textRegular.copyWith(fontSize: 14.0),
    textRegular14Primary = textRegular14.copyWith(color: textColorPrimary),
    textRegular16 = textRegular.copyWith(fontSize: 16.0),
    textRegular16Primary = textRegular16.copyWith(color: textColorPrimary),
    textRegular18 = textRegular.copyWith(fontSize: 18.0),
    textRegular20 = textRegular.copyWith(fontSize: 20.0),
    textRegular21 = textRegular.copyWith(fontSize: 21.0),

//Medium
    textMedium = _text.copyWith(fontWeight: FontWeight.w500),
    textMedium14 = textMedium.copyWith(fontSize: 14.0),
    textMedium16 = textMedium.copyWith(fontSize: 16.0),
    textMedium16Primary = textMedium16.copyWith(color: textColorPrimary),
    textMedium20 = textMedium.copyWith(fontSize: 20.0),
    textMedium34 = textMedium.copyWith(fontSize: 34.0),
//Bold
    textBold = _text.copyWith(fontWeight: FontWeight.bold),
    textBold14 = textBold.copyWith(fontSize: 14.0),
    textBold16 = textBold.copyWith(fontSize: 16),
    textBold18 = textBold.copyWith(fontSize: 18.0),
    textBold24 = textBold.copyWith(fontSize: 24.0);
