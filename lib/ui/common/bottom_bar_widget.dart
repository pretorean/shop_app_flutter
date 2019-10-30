import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/config/env.dart';
import 'package:shop_app/ui/res/assets.dart';
import 'package:shop_app/ui/res/colors.dart';
import 'package:shop_app/ui/screen/bag/bag_route.dart';
import 'package:shop_app/ui/screen/catalog/catalog_route.dart';
import 'package:shop_app/ui/screen/favorites/favorites_route.dart';
import 'package:shop_app/ui/screen/main/main_route.dart';
import 'package:shop_app/ui/screen/profile/profile_route.dart';

class BottomBarWidget extends StatelessWidget {
  BottomBarWidget({
    this.currentIndex,
    this.bagIsEmpty = true,
  });

  final int currentIndex;
  final bool bagIsEmpty;

  @override
  Widget build(BuildContext context) {
    final bool _isDark = Environment.instance().config.isDarkTheme;

    return BottomNavigationBar(
      fixedColor: Theme.of(context).accentColor,
      backgroundColor: _isDark ? colorBackground_dark : colorBackground_light,
      currentIndex: currentIndex,
      showSelectedLabels: false,
      onTap: (index) => _onItemTap(context, index),
      items: [
        BottomNavigationBarItem(
          backgroundColor:
              _isDark ? colorBackground_dark : colorBackground_light,
          icon: SvgPicture.asset(
              _isDark ? icHomeInactiveDark : icHomeInactiveLight),
          activeIcon: SvgPicture.asset(
              _isDark ? icHomeActivatedDark : icHomeActivatedLight),
          title: SizedBox.shrink(),
        ),
        BottomNavigationBarItem(
          backgroundColor:
              _isDark ? colorBackground_dark : colorBackground_light,
          icon: SvgPicture.asset(
              _isDark ? icShopInactiveDark : icShopInactiveLight),
          activeIcon: SvgPicture.asset(
              _isDark ? icShopActivatedDark : icShopActivatedLight),
          title: SizedBox.shrink(),
        ),
        BottomNavigationBarItem(
          backgroundColor:
              _isDark ? colorBackground_dark : colorBackground_light,
          icon: SvgPicture.asset(bagIsEmpty
              ? (_isDark ? icBagInactiveDark : icBagInactiveLight)
              : (_isDark
                  ? icBagIndicatorInactiveDark
                  : icBagIndicatorInactiveLight)),
          activeIcon: SvgPicture.asset(
              _isDark ? icBagActivatedDark : icBagActivatedLight),
          title: SizedBox.shrink(),
        ),
        BottomNavigationBarItem(
          backgroundColor:
              _isDark ? colorBackground_dark : colorBackground_light,
          icon: SvgPicture.asset(
              _isDark ? icHeartInactiveDark : icHeartInactiveLight),
          activeIcon: SvgPicture.asset(
              _isDark ? icHeartActivatedDark : icHeartActivatedLight),
          title: SizedBox.shrink(),
        ),
        BottomNavigationBarItem(
          backgroundColor:
              _isDark ? colorBackground_dark : colorBackground_light,
          icon: SvgPicture.asset(
              _isDark ? icProfileInactiveDark : icProfileInactiveLight),
          activeIcon: SvgPicture.asset(
              _isDark ? icProfileActivatedDark : icProfileActivatedLight),
          title: SizedBox.shrink(),
        ),
      ],
    );
  }

  void _onItemTap(BuildContext context, int index) {
    switch (index) {
      case MainScreenRoute.thisPageIndex:
        Navigator.push(context, MainScreenRoute());
        break;

      case ProfileScreenRoute.thisPageIndex:
        Navigator.push(context, ProfileScreenRoute());
        break;

      case CatalogScreenRoute.thisPageIndex:
        Navigator.push(context, CatalogScreenRoute());
        break;

      case BagScreenRoute.thisPageIndex:
        Navigator.push(context, BagScreenRoute());
        break;

      case FavoritesScreenRoute.thisPageIndex:
        Navigator.push(context, FavoritesScreenRoute());
        break;

      default:
        Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text('can route to $index screen'),
            backgroundColor: Theme.of(context).errorColor,
          ),
        );
    }
  }
}
