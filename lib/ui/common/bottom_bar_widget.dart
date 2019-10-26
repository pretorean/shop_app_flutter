import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/ui/res/assets.dart';
import 'package:shop_app/ui/screen/main/main_route.dart';

class BottomBarWidget extends StatelessWidget {
  BottomBarWidget({
    this.currentIndex,
    this.bagIsEmpty,
  });

  final int currentIndex;
  final bool bagIsEmpty;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      fixedColor: Theme.of(context).accentColor,
      currentIndex: currentIndex,
      showSelectedLabels: false,
      onTap: (index) => _onItemTap(context, index),
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(icHomeInactive),
          activeIcon: SvgPicture.asset(icHomeActivated),
          title: SizedBox.shrink(),
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(icShopInactive),
          activeIcon: SvgPicture.asset(icShopInactive),
          title: SizedBox.shrink(),
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
              bagIsEmpty ? icBagInactive : icBagIndicatorInactive),
          activeIcon: SvgPicture.asset(icBagActivated),
          title: SizedBox.shrink(),
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(icHeartInactive),
          activeIcon: SvgPicture.asset(icHeartActivated),
          title: SizedBox.shrink(),
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(icProfileInactive),
          activeIcon: SvgPicture.asset(icProfileActivated),
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
            backgroundColor: Colors.red,
          ),
        );
    }
  }
}
