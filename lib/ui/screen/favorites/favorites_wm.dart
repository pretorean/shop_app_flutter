import 'package:flutter/widgets.dart';
import 'package:mwwm/mwwm.dart';

/// [WidgetModel] для экрана <Favorites>
class FavoritesWidgetModel extends WidgetModel {
  final GlobalKey<NavigatorState> navigator;

  FavoritesWidgetModel(
    WidgetModelDependencies dependencies,
    this.navigator,
  ) : super(dependencies);

  @override
  void onLoad() {
    super.onLoad();
    //todo
  }
}
