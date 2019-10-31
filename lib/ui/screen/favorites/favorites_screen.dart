import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:injector/injector.dart';
import 'package:mwwm/mwwm.dart';
import 'package:shop_app/config/env.dart';
import 'package:shop_app/ui/common/bottom_bar_widget.dart';
import 'package:shop_app/ui/common/product_card_favorite.dart';
import 'package:shop_app/ui/res/assets.dart';
import 'package:shop_app/ui/res/strings/strings.dart';
import 'package:shop_app/ui/screen/favorites/di/favorites_component.dart';
import 'package:shop_app/ui/screen/favorites/di/favorites_wm_builder.dart';
import 'package:shop_app/ui/screen/favorites/favorites_route.dart';
import 'package:shop_app/ui/screen/favorites/favorites_wm.dart';

/// Экран <Favorites>
class FavoritesScreen extends MwwmWidget<FavoritesScreenComponent> {
  FavoritesScreen()
      : super(
          dependenciesBuilder: (context) => FavoritesScreenComponent(context),
          widgetStateBuilder: () => _FavoritesScreenState(),
          widgetModelBuilder: createFavoritesWm,
        );
}

class _FavoritesScreenState extends WidgetState<FavoritesWidgetModel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Injector.of<FavoritesScreenComponent>(context).component.scaffoldKey,
      appBar: AppBar(
        title: Text(favoriteScreenTitle),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      bottomNavigationBar: BottomBarWidget(
        currentIndex: FavoritesScreenRoute.thisPageIndex,
        bagIsEmpty: false,
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    final bool _isDark = Environment.instance().config.isDarkTheme;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
              child: ProductCardFavorite(
                image: Image.asset(imgDemo04),
                productTitle: 'Shirt',
                productColor: 'Blue',
                productSize: 'L',
                productBrand: 'Lime',
                productPrice: '32\$',
                productRating: 5,
                productRatingCount: 10,
                productInBag: true,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: ProductCardFavorite(
                image: Image.asset(imgDemo06),
                productTitle: 'Longsleeve Violeta',
                productColor: 'Orange',
                productSize: 'S',
                productBrand: 'Mango',
                productPrice: '46\$',
                productRating: 0,
                productRatingCount: 0,
                productIsNew: true,
                productInBag: true,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: ProductCardFavorite(
                image: Image.asset(imgDemo05),
                productTitle: 'Shirt',
                productColor: 'Gray',
                productSize: 'L',
                productBrand: 'Oliver',
                productPrice: '52\$',
                productRating: 4,
                productRatingCount: 3,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: ProductCardFavorite(
                image: Image.asset(imgDemo07),
                productTitle: 'T-Shirt',
                productColor: 'Black',
                productSize: 'S',
                productBrand: '&Berries',
                productPrice: '55\$',
                productRating: 0,
                productRatingCount: 0,
                productDiscountLabel: '30%',
                productInBag: true,
              ),
            ),
//            Padding(
//              padding: const EdgeInsets.only(bottom: 16.0),
//              child: ProductCardFavorite(),
//            ),
          ],
        ),
      ),
    );
  }
}
