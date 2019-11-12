import 'package:flutter/widgets.dart';
import 'package:mwwm/mwwm.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shop_app/domain/Category.dart';
import 'package:shop_app/ui/res/assets.dart';

class _InteractorMock {
  Observable<List<Category>> getCategories() => Observable.just([
        Category(
          name: 'Новое',
          imgPath: imgDemo18,
        ),
        Category(
          name: 'Одежда',
          imgPath: imgDemo15,
        ),
        Category(
          name: 'Обувь',
          imgPath: imgDemo16,
        ),
        Category(
          name: 'Аксессуары',
          imgPath: imgDemo17,
        ),
      ]).delay(Duration(milliseconds: 300));
}

/// [WidgetModel] для экрана <Catalog>
class CatalogWidgetModel extends WidgetModel {
  final GlobalKey<NavigatorState> navigator;

  final categoryListState = EntityStreamedState<List<Category>>();

  _InteractorMock _interactor = _InteractorMock();

  CatalogWidgetModel(
    WidgetModelDependencies dependencies,
    this.navigator,
  ) : super(dependencies);

  @override
  void onLoad() {
    super.onLoad();

    subscribe(_interactor.getCategories(), categoryListState.content);
  }
}
