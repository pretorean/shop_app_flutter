import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:injector/injector.dart';
import 'package:mwwm/mwwm.dart';
import 'package:shop_app/domain/product.dart';
import 'package:shop_app/ui/common/bottom_bar_widget.dart';
import 'package:shop_app/ui/common/product_card_favorite.dart';
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
    CustomScrollView
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
      child: EntityStateBuilder<List<Product>>(
        streamedState: wm.productListState,
        loadingChild: Center(
          child: CircularProgressIndicator(),
        ),
        errorChild: SizedBox.shrink(),
        child: (context, List<Product> list) {
          return ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, int index) {
              Product item = list[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: ProductCardFavorite(
                  productName: item.name,
                  productColor: item.color,
                  productPrice: item.price,
                  productNewPrice: item.newPrice,
                  productSize: item.size,
                  image: item.imgPathSmall != null
                      ? Image.asset(item.imgPathSmall)
                      : null,
                  productBrand: item.brandName,
                  productRating: item.rating,
                  productRatingCount: item.ratingCount,
                  isSoldOut: item.isSoldOut,
                  productInBag: item.inBag,
                  productIsNew: item.isNew,
                  productDiscountLabel: item.discountLabel,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
