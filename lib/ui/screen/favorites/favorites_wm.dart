import 'package:flutter/widgets.dart';
import 'package:mwwm/mwwm.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shop_app/domain/product.dart';
import 'package:shop_app/ui/res/assets.dart';

class _InteractorMock {
  Observable<List<Product>> getFavoritesList() => Observable.just([
        Product(
          imgPathSmall: imgDemo04,
          name: 'Shirt',
          color: 'Blue',
          size: 'L',
          brandName: 'Lime',
          price: '32\$',
          rating: 5,
          ratingCount: 10,
          inBag: true,
        ),
        Product(
          imgPathSmall: imgDemo06,
          name: 'Longsleeve Violeta',
          color: 'Orange',
          size: 'S',
          brandName: 'Mango',
          price: '46\$',
          isNew: true,
          inBag: true,
        ),
        Product(
          imgPathSmall: imgDemo05,
          name: 'Shirt',
          color: 'Gray',
          size: 'L',
          brandName: 'Oliver',
          price: '52\$',
          rating: 4,
          ratingCount: 3,
          isSoldOut: true,
        ),
        Product(
          imgPathSmall: imgDemo07,
          name: 'T-Shirt',
          color: 'Black',
          size: 'S',
          brandName: '&Berries',
          price: '55\$',
          newPrice: '39\$',
          discountLabel: '30%',
          inBag: true,
        ),
      ]).delay(Duration(seconds: 1));
}

/// [WidgetModel] для экрана <Favorites>
class FavoritesWidgetModel extends WidgetModel {
  final GlobalKey<NavigatorState> navigator;

  final productListState = EntityStreamedState<List<Product>>();

  _InteractorMock _interactor = _InteractorMock();

  FavoritesWidgetModel(
    WidgetModelDependencies dependencies,
    this.navigator,
  ) : super(dependencies);

  @override
  void onLoad() {
    super.onLoad();

    subscribe(_interactor.getFavoritesList(), productListState.content);
  }
}
