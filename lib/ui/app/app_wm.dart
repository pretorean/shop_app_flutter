import 'package:flutter/widgets.dart' as w;
import 'package:mwwm/mwwm.dart';
import 'package:rxdart/rxdart.dart';

class AppWidgetModel extends WidgetModel {
  // ignore: unused_field
  final w.GlobalKey<w.NavigatorState> _navigator;

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
  Future<void> _openFirstScreen() async {}

  Observable<bool> initApp() {
    return Observable.just(true).delay(Duration(seconds: 2));
  }
}
