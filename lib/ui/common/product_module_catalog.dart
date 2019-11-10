import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/config/env.dart';
import 'package:shop_app/ui/res/colors.dart';
import 'package:shop_app/ui/res/strings/common_strings.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class ProductModuleCatalog extends StatelessWidget {
  const ProductModuleCatalog({
    Key key,
    @required this.image,
    @required this.productName,
    @required this.productBrand,
    @required this.productPrice,
    this.productNewPrice,
    @required this.productRating,
    @required this.productRatingCount,
    this.productDiscountLabel,
    this.productIsNew,
    this.productInBag,
  }) : super(key: key);

  final String productName;
  final String productBrand;
  final String productPrice;
  final String productNewPrice;
  final double productRating;
  final int productRatingCount;
  final String productDiscountLabel;
  final bool productIsNew;
  final bool productInBag;

  final Image image;

  @override
  Widget build(BuildContext context) {
    final bool _isDark = Environment.instance().config.isDarkTheme;

    return Stack(
      children: <Widget>[
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: image ??
                    Placeholder(
                      fallbackHeight: 184.0,
                      fallbackWidth: 162.0,
                      color: _isDark ? colorGray_dark : colorGray_light,
                    ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  children: <Widget>[
                    SmoothStarRating(
                      allowHalfRating: false,
                      onRatingChanged: (value) {},
                      starCount: 5,
                      rating: productRating ?? 0,
                      size: 14.0,
                      color: colorStarColor,
                      borderColor: _isDark ? colorGray_dark : colorGray_light,
                    ),
                    Text(
                      '(${productRatingCount ?? 0})',
                      style: TextStyle(
                        fontSize: 11.0,
                        color: _isDark ? colorGray_dark : colorGray_light,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                productBrand ?? 'product brand',
                style: TextStyle(
                  fontSize: 11.0,
                  color: _isDark ? colorGray_dark : colorGray_light,
                ),
              ),
              Text(
                productName ?? 'product title',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              productNewPrice == null
                  ? Text(
                      productPrice ?? 'product price',
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  : Row(
                      children: <Widget>[
                        Text(
                          productPrice ?? 'product price',
                          style: TextStyle(
                            fontSize: 14.0,
                            color: _isDark ? colorGray_dark : colorGray_light,
                            decoration: TextDecoration.lineThrough,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 4.0),
                        Text(
                          productNewPrice ?? 'product price',
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                            color: _isDark
                                ? colorHotSale_dark
                                : colorHotSale_light,
                          ),
                        ),
                      ],
                    ),
            ],
          ),
        ),
        if (productDiscountLabel != null)
          Positioned(
            top: 8.0,
            left: 16.0,
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
            left: 16.0,
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
      ],
    );
  }
}
