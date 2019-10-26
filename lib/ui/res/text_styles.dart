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
    textRegular10White = textRegular10.copyWith(color: white),
    textRegular12 = textRegular.copyWith(fontSize: 12.0),
    textRegular12Secondary = textRegular12.copyWith(color: textColorSecondary),
    textRegular12Accent = textRegular12.copyWith(color: colorAccent),
    textRegular12Red = textRegular12.copyWith(color: textColorRed),
    textRegular12White = textRegular12.copyWith(color: white),
    textRegularError = textRegular12.copyWith(color: colorError),
    textRegular14 = textRegular.copyWith(fontSize: 14.0),
    textRegular14Primary = textRegular14.copyWith(color: textColorPrimary),
    textRegular14Secondary = textRegular14.copyWith(color: textColorSecondary),
    textRegular14White = textRegular14.copyWith(color: white),
    textRegular14Red = textRegular14.copyWith(color: textColorRed),
    textRegular14Green = textRegular14.copyWith(color: textColorGreen),
    textRegular14Grey = textRegular14.copyWith(color: textColorGrey),
    textRegular16 = textRegular.copyWith(fontSize: 16.0),
    textRegular16Primary = textRegular16.copyWith(color: textColorPrimary),
    textRegular16Secondary = textRegular16.copyWith(color: textColorSecondary),
    textRegular16Grey = textRegular16.copyWith(color: textColorGrey),
    textRegular16GreyChateau =
        textRegular16.copyWith(color: textColorGreyChateau),
    textRegular16White = textRegular16.copyWith(color: white),
    textRegular16Blue = textRegular16.copyWith(color: textColorBlue),
    textRegular16Black = textRegular16.copyWith(color: textColorBlack),
    textRegular16Orange = textRegular16.copyWith(color: textColorOrange),
    textRegular18 = textRegular.copyWith(fontSize: 18.0),
    textRegular18White = textRegular18.copyWith(color: textColorWhite),
    textRegular20 = textRegular.copyWith(fontSize: 20.0),
    textRegular20Red = textRegular20.copyWith(color: textColorRed),
    textRegular20Blue = textRegular20.copyWith(color: textColorNewMidnightBlue),
    textRegular21 = textRegular.copyWith(fontSize: 21.0),
    textRegular21White = textRegular21.copyWith(color: textColorWhite),

//Medium
    textMedium = _text.copyWith(fontWeight: FontWeight.w500),
    textMedium14 = textMedium.copyWith(fontSize: 14.0),
    textMedium14Red = textMedium14.copyWith(color: textColorRed),
    textMedium16 = textMedium.copyWith(fontSize: 16.0),
    textMedium16White = textMedium16.copyWith(color: white),
    textMedium16Primary = textMedium16.copyWith(color: textColorPrimary),
    textMedium16Secondary = textMedium16.copyWith(color: textColorSecondary),
    textMedium16Red = textMedium16.copyWith(color: textColorRed),
    textMedium16Error = textMedium16.copyWith(color: textColorError),
    textMedium20 = textMedium.copyWith(fontSize: 20.0),
    textMedium34 = textMedium.copyWith(fontSize: 34.0),
//Bold
    textBold = _text.copyWith(fontWeight: FontWeight.bold),
    textBold14 = textBold.copyWith(fontSize: 14.0),
    textBold14White = textBold14.copyWith(color: textColorWhite),
    textBold16 = textBold.copyWith(fontSize: 16),
    textBold16White = textBold16.copyWith(color: white),
    textBold18 = textBold.copyWith(fontSize: 18.0),
    textBold18Black = textBold18.copyWith(color: textColorBlack),
    textBold18White = textBold18.copyWith(color: textColorWhite),
    textBold24 = textBold.copyWith(fontSize: 24.0);
