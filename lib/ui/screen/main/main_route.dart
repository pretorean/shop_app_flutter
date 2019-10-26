import 'package:flutter/material.dart';
import 'package:shop_app/ui/screen/main/main_screen.dart';

/// Роут экрана <Main>
class MainScreenRoute extends MaterialPageRoute {
  MainScreenRoute() : super(builder: (ctx) => MainScreen());

  static const int thisPageIndex = 0; // индекс иконки в нижней навигации
}
