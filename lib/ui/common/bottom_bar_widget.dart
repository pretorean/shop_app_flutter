import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/config/env.dart';
import 'package:shop_app/ui/res/assets.dart';
import 'package:shop_app/ui/screen/main/main_route.dart';

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
      currentIndex: currentIndex,
      showSelectedLabels: false,
      onTap: (index) => _onItemTap(context, index),
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
              _isDark ? icHomeInactiveDark : icHomeInactiveLight),
          activeIcon: SvgPicture.asset(
              _isDark ? icHomeActivatedDark : icHomeActivatedLight),
          title: SizedBox.shrink(),
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
              _isDark ? icShopInactiveDark : icShopInactiveLight),
          activeIcon: SvgPicture.asset(
              _isDark ? icShopInactiveDark : icShopInactiveLight),
          title: SizedBox.shrink(),
        ),
        BottomNavigationBarItem(
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
          icon: SvgPicture.asset(
              _isDark ? icHeartInactiveDark : icHeartInactiveLight),
          activeIcon: SvgPicture.asset(
              _isDark ? icHeartActivatedDark : icHeartActivatedLight),
          title: SizedBox.shrink(),
        ),
        BottomNavigationBarItem(
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
        Navigator.pushReplacement(context, MainScreenRoute());
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
