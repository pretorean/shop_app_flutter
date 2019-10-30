import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/config/env.dart';
import 'package:shop_app/ui/res/colors.dart';

class ProductCardBag extends StatelessWidget {
  const ProductCardBag({
    Key key,
    @required this.image,
    @required this.productTitle,
    @required this.productColor,
    @required this.productSize,
    @required this.productPrice,
    @required this.productCount,
  }) : super(key: key);

  final String productTitle;
  final String productColor;
  final String productSize;
  final String productPrice;
  final String productCount;

  final Image image;

  @override
  Widget build(BuildContext context) {
    final bool _isDark = Environment.instance().config.isDarkTheme;

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          image,
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0, top: 10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    productTitle,
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        'Color: ',
                        style: TextStyle(
                          fontSize: 11.0,
                          color: _isDark ? colorGray_dark : colorGray_light,
                        ),
                      ),
                      Text(
                        productColor,
                        style: TextStyle(
                          fontSize: 11.0,
                        ),
                      ),
                      SizedBox(width: 12.0),
                      Text(
                        'Size: ',
                        style: TextStyle(
                          fontSize: 11.0,
                          color: _isDark ? colorGray_dark : colorGray_light,
                        ),
                      ),
                      Text(
                        productSize,
                        style: TextStyle(
                          fontSize: 11.0,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    children: <Widget>[
                      FloatingActionButton(
                        child: Icon(Icons.add),
                        mini: true,
                        heroTag: null,
                        foregroundColor:
                            _isDark ? colorGray_dark : colorGray_light,
                        backgroundColor:
                            _isDark ? colorDark_dark : colorWhite_light,
                        onPressed: () {},
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          productCount,
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ),
                      FloatingActionButton(
                        child: Icon(Icons.remove),
                        mini: true,
                        heroTag: null,
                        foregroundColor:
                            _isDark ? colorGray_dark : colorGray_light,
                        backgroundColor:
                            _isDark ? colorDark_dark : colorWhite_light,
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Column(
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.more_vert),
                color: _isDark ? colorGray_dark : colorGray_light,
                onPressed: () {},
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0, right: 16.0),
                child: Text(
                  productPrice,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
