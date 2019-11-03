import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/config/env.dart';
import 'package:shop_app/ui/res/assets.dart';
import 'package:shop_app/ui/res/colors.dart';
import 'package:shop_app/ui/res/strings/common_strings.dart';
import 'package:shop_app/ui/res/strings/strings.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class ProductCardFavorite extends StatelessWidget {
  const ProductCardFavorite({
    Key key,
    @required this.image,
    @required this.productName,
    @required this.productBrand,
    @required this.productColor,
    @required this.productSize,
    @required this.productPrice,
    this.productNewPrice,
    @required this.productRating,
    @required this.productRatingCount,
    this.productDiscountLabel,
    this.productIsNew,
    this.productInBag,
    this.isSoldOut,
  }) : super(key: key);

  final String productName;
  final String productBrand;
  final String productColor;
  final String productSize;
  final String productPrice;
  final String productNewPrice;
  final double productRating;
  final int productRatingCount;
  final String productDiscountLabel;
  final bool productIsNew;
  final bool productInBag;
  final bool isSoldOut;

  final Image image;

  @override
  Widget build(BuildContext context) {
    final bool _isDark = Environment.instance().config.isDarkTheme;

    return Stack(
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Opacity(
              opacity: (isSoldOut ?? false) ? 0.5 : 1,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Container(
                  height: 104.0,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      image ??
                          Placeholder(
                            fallbackHeight: 104.0,
                            fallbackWidth: 104.0,
                            color: _isDark ? colorGray_dark : colorGray_light,
                          ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10.0, top: 10.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                productBrand ?? 'product brand',
                                style: TextStyle(
                                  fontSize: 11.0,
                                  color: _isDark
                                      ? colorGray_dark
                                      : colorGray_light,
                                ),
                              ),
                              Text(
                                productName ?? 'product title',
                                style: TextStyle(
                                  fontSize: 16.0,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 6.0),
                                child: Row(
                                  children: <Widget>[
                                    Text(
                                      'Color: ',
                                      style: TextStyle(
                                        fontSize: 11.0,
                                        color: _isDark
                                            ? colorGray_dark
                                            : colorGray_light,
                                      ),
                                    ),
                                    Text(
                                      productColor ?? 'product color',
                                      style: TextStyle(
                                        fontSize: 11.0,
                                      ),
                                    ),
                                    SizedBox(width: 12.0),
                                    Text(
                                      'Size: ',
                                      style: TextStyle(
                                        fontSize: 11.0,
                                        color: _isDark
                                            ? colorGray_dark
                                            : colorGray_light,
                                      ),
                                    ),
                                    Text(
                                      productSize ?? 'product size',
                                      style: TextStyle(
                                        fontSize: 11.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 12.0),
                                child: Row(
                                  children: <Widget>[
                                    productNewPrice == null
                                        ? Text(
                                            productPrice ?? 'product price',
                                            style: TextStyle(
                                              fontSize: 14.0,
                                            ),
                                          )
                                        : Row(
                                            children: <Widget>[
                                              Text(
                                                productPrice ?? 'product price',
                                                style: TextStyle(
                                                  fontSize: 14.0,
                                                  color: _isDark
                                                      ? colorGray_dark
                                                      : colorGray_light,
                                                  decoration: TextDecoration
                                                      .lineThrough,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 4.0,
                                              ),
                                              Text(
                                                productNewPrice ?? 'product price',
                                                style: TextStyle(
                                                  fontSize: 14.0,
                                                  color: _isDark
                                                      ? colorHotSale_dark
                                                      : colorHotSale_light,
                                                ),
                                              ),
                                            ],
                                          ),
                                    Spacer(),
                                    SmoothStarRating(
                                      allowHalfRating: false,
                                      onRatingChanged: (value) {},
                                      starCount: 5,
                                      rating: productRating ?? 0,
                                      size: 14.0,
                                      color: colorStarColor,
                                      borderColor: _isDark
                                          ? colorGray_dark
                                          : colorGray_light,
                                    ),
                                    Text(
                                      '(${productRatingCount ?? 0})',
                                      style: TextStyle(
                                        fontSize: 11.0,
                                        color: _isDark
                                            ? colorGray_dark
                                            : colorGray_light,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.close),
                        color: _isDark ? colorGray_dark : colorGray_light,
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ),
            if (isSoldOut ?? false)
              Text(
                favoriteSoldOutText,
                style: TextStyle(
                  fontSize: 11.0,
                  color: _isDark ? colorGray_dark : colorGray_light,
                ),
              ),
          ],
        ),
        if (productDiscountLabel != null)
          Positioned(
            top: 8.0,
            left: 8.0,
            child: Container(
              height: 24.0,
              width: 40.0,
              child: Material(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                color: _isDark ? colorHotSale_dark : colorHotSale_light,
                child: Center(
                  child: Text(
                    productDiscountLabel,
                    style: TextStyle(
                      fontSize: 11.0,
                      fontWeight: FontWeight.bold,
                      color: colorWhite_light,
                    ),
                  ),
                ),
              ),
            ),
          ),
        if (productIsNew ?? false)
          Positioned(
            top: 8.0,
            left: 8.0,
            child: Container(
              height: 24.0,
              width: 40.0,
              child: Material(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                color: colorBlackLabel,
                child: Center(
                  child: Text(
                    newLabel,
                    style: TextStyle(
                      fontSize: 11.0,
                      fontWeight: FontWeight.bold,
                      color: colorWhite_light,
                    ),
                  ),
                ),
              ),
            ),
          ),
        if (productInBag ?? false)
          Positioned(
            // card height + padding - icon height
            top: 104.0 + 8 - 36.0,
            left: MediaQuery.of(context).size.width - 36 * 2,
            child: Container(
              height: 36.0,
              width: 36.0,
              child: Center(
                child: SvgPicture.asset(
                    _isDark ? icProductInBagDark : icProductInBagLight),
              ),
            ),
          ),
      ],
    );
  }
}
