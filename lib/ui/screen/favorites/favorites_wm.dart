import 'dart:math';

import 'package:flutter/widgets.dart' as w;
import 'package:mwwm/mwwm.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shop_app/domain/product.dart';
import 'package:shop_app/ui/common/list_view_type.dart';
import 'package:shop_app/ui/res/assets.dart';

class _InteractorMock {
  Observable<List<Product>> getFavoritesList() => Observable.just([
        Product(
          imgPathSmall: imgDemo04,
          imgPathMedium: imgDemo08,
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
          imgPathMedium: imgDemo09,
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
          imgPathMedium: imgDemo10,
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
          imgPathMedium: imgDemo11,
          name: 'T-Shirt',
          color: 'Black',
          size: 'S',
          brandName: '&Berries',
          price: '55\$',
          newPrice: '39\$',
          discountLabel: '30%',
          inBag: true,
        ),
      ]).delay(Duration(milliseconds: 300));
}

/// [WidgetModel] для экрана <Favorites>
class FavoritesWidgetModel extends WidgetModel {
  final w.GlobalKey<w.NavigatorState> navigator;

  final productListState = EntityStreamedState<List<Product>>();

  final viewTypeListState = StreamedState<ListViewType>();
  final viewTypeIndicatorState = StreamedState<ListViewType>();

  final changeViewTypeAction = Action<ListViewType>();

  _InteractorMock _interactor = _InteractorMock();

  final random = Random();

  FavoritesWidgetModel(
    WidgetModelDependencies dependencies,
    this.navigator,
  ) : super(dependencies);

  @override
  void onLoad() {
    super.onLoad();

    var viewType = random.nextBool() ? ListViewType.list : ListViewType.grid;
    viewTypeListState.accept(viewType);
    viewTypeIndicatorState.accept(viewType);

    subscribe(_interactor.getFavoritesList(), productListState.content);

    bind(changeViewTypeAction, (viewType) {
      if (viewType == ListViewType.list) {
        viewTypeIndicatorState.accept(ListViewType.grid);
        viewTypeListState.accept(ListViewType.grid);
      } else {
        viewTypeIndicatorState.accept(ListViewType.list);
        viewTypeListState.accept(ListViewType.list);
      }
    });
  }
}
