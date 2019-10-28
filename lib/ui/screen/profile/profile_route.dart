import 'package:flutter/material.dart';
import 'package:shop_app/ui/screen/profile/profile_screen.dart';

/// Роут экрана <Profile>
class ProfileScreenRoute extends MaterialPageRoute {
  ProfileScreenRoute() : super(builder: (ctx) => ProfileScreen());

  static const int thisPageIndex = 4; // индекс иконки в нижней навигации
}
