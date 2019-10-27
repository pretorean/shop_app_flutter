import 'package:flutter/widgets.dart' as w;
import 'package:mwwm/mwwm.dart';
import 'package:shop_app/config/config.dart';
import 'package:shop_app/config/env.dart';
import 'package:shop_app/interactor/theme_storage/theme_storage.dart';
import 'package:shop_app/ui/screen/auth/register/register_route.dart';

/// [WidgetModel] для экрана <Main>
class MainWidgetModel extends WidgetModel {
  final w.GlobalKey<w.NavigatorState> _navigator;

  final ThemeStorage _themeStorage;

  final themeState = StreamedState<bool>();

  final changeThemeAction = Action<bool>();
  final openRegisterScreenAction = Action();

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

    _bindActions();
  }

  void _bindActions() {
    bind(changeThemeAction, (value) {
      themeState.accept(value);
      config = config.copyWith(isDarkTheme: value);
      _themeStorage.saveTheme(value);
    });

    bind(openRegisterScreenAction,
        (_) => _navigator.currentState.push(RegisterScreenRoute()));
  }
}
