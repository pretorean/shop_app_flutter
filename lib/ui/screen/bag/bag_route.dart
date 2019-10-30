import 'package:flutter/material.dart';
import 'package:shop_app/ui/screen/bag/bag_screen.dart';

/// Роут экрана <Bag>
class BagScreenRoute extends MaterialPageRoute {
  BagScreenRoute() : super(builder: (ctx) => BagScreen());

  static const int thisPageIndex = 2; // индекс иконки в нижней навигации
}
