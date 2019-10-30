import 'package:flutter/material.dart';
import 'package:shop_app/ui/screen/favorites/favorites_screen.dart';

/// Роут экрана <Favorites>
class FavoritesScreenRoute extends MaterialPageRoute {
  FavoritesScreenRoute() : super(builder: (ctx) => FavoritesScreen());

  static const int thisPageIndex = 3; // индекс иконки в нижней навигации
}
