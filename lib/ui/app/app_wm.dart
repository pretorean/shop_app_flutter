import 'package:flutter/widgets.dart';
import 'package:mwwm/mwwm.dart';
import 'package:pedantic/pedantic.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shop_app/ui/screen/main/main_route.dart';

class AppWidgetModel extends WidgetModel {
  final GlobalKey<NavigatorState> _navigator;

  // ignore: unused_field
  final MessageController _msgController;

  AppWidgetModel(
    WidgetModelDependencies dependencies,
    this._msgController,
    this._navigator,
  ) : super(dependencies);

  @override
  void onLoad() {
    super.onLoad();
    _declareBindings();
    _loadApp();
  }

  void _declareBindings() {}

  void _loadApp() async {
    subscribeHandleError<bool>(
      initApp(),
      (isAuth) {
        _openFirstScreen();
      },
    );
  }

  /// Метод открывает первый экран приложения
  Future<void> _openFirstScreen() async {
    unawaited(_navigator.currentState.pushReplacement(MainScreenRoute()));
  }

  Observable<bool> initApp() {
    return Observable.just(true).delay(Duration(seconds: 2));
  }
}
