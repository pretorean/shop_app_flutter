import 'package:flutter/material.dart';
import 'package:shop_app/ui/screen/catalog/catalog_screen.dart';

/// Роут экрана <Catalog>
class CatalogScreenRoute extends MaterialPageRoute {
  CatalogScreenRoute() : super(builder: (ctx) => CatalogScreen());

  static const int thisPageIndex = 1; // индекс иконки в нижней навигации
}
