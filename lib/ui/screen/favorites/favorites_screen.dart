import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:injector/injector.dart';
import 'package:mwwm/mwwm.dart';
import 'package:shop_app/domain/product.dart';
import 'package:shop_app/ui/common/bottom_bar_widget.dart';
import 'package:shop_app/ui/common/filter_persist_header.dart';
import 'package:shop_app/ui/common/list_view_type.dart';
import 'package:shop_app/ui/common/product_card_favorite.dart';
import 'package:shop_app/ui/common/product_module_favorite.dart';
import 'package:shop_app/ui/common/tags_persist_header.dart';
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
      bottomNavigationBar: BottomBarWidget(
        currentIndex: FavoritesScreenRoute.thisPageIndex,
        bagIsEmpty: false,
      ),
      body: _buildScrollBody(),
    );
  }

  Widget _buildScrollBody() {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          title: Text(favoriteScreenTitle),
          pinned: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
          ],
        ),
        SliverPersistentHeader(
          delegate: TagsPersistHeaderSliver(),
        ),
        StreamedStateBuilder<ListViewType>(
            streamedState: wm.viewTypeIndicatorState,
            builder: (context, viewType) {
              return SliverPersistentHeader(
                delegate: FilterPersistHeaderSliver(
                  viewType: viewType,
                  onChangeViewType: () => wm.changeViewTypeAction(viewType),
                ),
              );
            }),
        StreamedStateBuilder<ListViewType>(
            streamedState: wm.viewTypeListState,
            builder: (context, viewType) {
              if (viewType == ListViewType.list) {
                return _buildList(context);
              } else {
                return _buildGrid(context);
              }
            }),
      ],
    );
  }

  Widget _buildList(BuildContext context) {
    return EntityStateBuilder<List<Product>>(
      streamedState: wm.productListState,
      loadingChild: SliverList(
        delegate: SliverChildListDelegate([
          Center(
            child: CircularProgressIndicator(),
          ),
        ]),
      ),
      errorChild: SizedBox.shrink(),
      child: (context, List<Product> list) {
        return SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              Product item = list[index];
              return Padding(
                padding: EdgeInsets.only(
                    top: 8.0, bottom: 8.0, left: 16.0, right: 16.0),
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
            childCount: list.length,
          ),
        );
      },
    );
  }

  _buildGrid(BuildContext context) {
    return EntityStateBuilder<List<Product>>(
      streamedState: wm.productListState,
      loadingChild: SliverList(
        delegate: SliverChildListDelegate([
          Center(
            child: CircularProgressIndicator(),
          ),
        ]),
      ),
      errorChild: SizedBox.shrink(),
      child: (context, List<Product> list) {
        return SliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 16.0,
              mainAxisSpacing: 16.0,
              crossAxisCount: 2,
              childAspectRatio: 0.6),
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              Product item = list[index];
              return Padding(
                padding: index.isEven
                    ? EdgeInsets.only(left: 16.0)
                    : EdgeInsets.only(right: 16.0),
                child: ProductModuleFavorite(
                  productName: item.name,
                  image: item.imgPathMedium != null
                      ? Image.asset(item.imgPathMedium)
                      : null,
                  productColor: item.color,
                  productPrice: item.price,
                  productNewPrice: item.newPrice,
                  productSize: item.size,
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
            childCount: list.length,
          ),
        );
      },
    );
  }
}
