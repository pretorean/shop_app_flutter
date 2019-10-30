import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/config/env.dart';
import 'package:shop_app/ui/res/colors.dart';

class ProductCardBag extends StatelessWidget {
  const ProductCardBag({
    Key key,
    @required this.title,
    @required this.image,
  }) : super(key: key);

  final String title;
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
                    title,
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
                        'Black',
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
                        'L',
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
                          '1',
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
              Padding(
                padding: const EdgeInsets.only(top: 8.0, right: 8.0),
                child: Icon(
                  Icons.more_vert,
                  color: _isDark ? colorGray_dark : colorGray_light,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 32.0, right: 16.0),
                child: Text(
                  '51\$',
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
