import 'dart:math';

import 'package:flutter/widgets.dart' as w;
import 'package:mwwm/mwwm.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shop_app/config/config.dart';
import 'package:shop_app/config/env.dart';
import 'package:shop_app/domain/product.dart';
import 'package:shop_app/interactor/theme_storage/theme_storage.dart';
import 'package:shop_app/ui/res/assets.dart';
import 'package:shop_app/ui/screen/auth/forgot_password/forgot_password_route.dart';
import 'package:shop_app/ui/screen/auth/login/login_route.dart';
import 'package:shop_app/ui/screen/auth/register/register_route.dart';

class _InteractorMock {
  Observable<List<Product>> getSaleProductList() => Observable.just([
        Product(
          name: 'Dorothy Perkins',
          brandName: 'T-Shirt',
          price: '15\$',
          newPrice: '12\$',
          imgPathMedium: imgDemo14,
          discountLabel: '30%',
          rating: 5,
          ratingCount: 10,
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
        ),
        Product(
          name: 'Mango',
          brandName: 'T-Shirt SPANISH',
          price: '20\$',
          newPrice: '10\$',
          imgPathMedium: imgDemo13,
          discountLabel: '50%',
          rating: 5,
          ratingCount: 10,
        ),
      ]).delay(Duration(milliseconds: 300));

  Observable<List<Product>> getNewProductList() => Observable.just([
        Product(
          name: 'T-Shirt Sailing',
          brandName: 'Mango Boy',
          price: '10\$',
          imgPathMedium: imgDemo12,
          isNew: true,
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
        ),
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
          isNew: true,
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
          isNew: true,
        ),
      ]).delay(Duration(milliseconds: 300));
}

/// [WidgetModel] для экрана <Main>
class MainWidgetModel extends WidgetModel {
  final w.GlobalKey<w.NavigatorState> _navigator;

  final ThemeStorage _themeStorage;

  final saleProductListState = EntityStreamedState<List<Product>>();
  final newProductListState = EntityStreamedState<List<Product>>();

  final themeState = StreamedState<bool>();
  final bannerImageState = StreamedState<bool>();

  final changeThemeAction = Action<bool>();
  final openRegisterScreenAction = Action();
  final openLoginScreenAction = Action();
  final openForgotPasswordScreenAction = Action();

  _InteractorMock _interactor = _InteractorMock();

  final random = Random();

  Config get config => Environment.instance().config;

  set config(Config newConfig) => Environment.instance().config = newConfig;

  MainWidgetModel(
    WidgetModelDependencies dependencies,
    this._navigator,
    this._themeStorage,
  ) : super(dependencies);

  @override
  void onLoad() {
    super.onLoad();

    themeState.accept(config.isDarkTheme);
    bannerImageState.accept(random.nextBool());

    subscribe(_interactor.getSaleProductList(), saleProductListState.content);
    subscribe(_interactor.getNewProductList(), newProductListState.content);

    _bindActions();
  }

  void _bindActions() {
    bind(changeThemeAction, (value) {
      themeState.accept(value);
      config = config.copyWith(isDarkTheme: value);
      _themeStorage.saveTheme(value);
      bannerImageState.accept(random.nextBool());
    });

    bind(openRegisterScreenAction,
        (_) => _navigator.currentState.push(RegisterScreenRoute()));
    bind(openLoginScreenAction,
        (_) => _navigator.currentState.push(LoginScreenRoute()));
    bind(openForgotPasswordScreenAction,
        (_) => _navigator.currentState.push(ForgotPasswordScreenRoute()));
  }
}
