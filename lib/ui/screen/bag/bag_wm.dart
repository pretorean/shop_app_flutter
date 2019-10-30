import 'package:flutter/widgets.dart';
import 'package:mwwm/mwwm.dart';

/// [WidgetModel] для экрана <Bag>
class BagWidgetModel extends WidgetModel {
  final GlobalKey<NavigatorState> navigator;

  BagWidgetModel(
    WidgetModelDependencies dependencies,
    this.navigator,
  ) : super(dependencies);

  @override
  void onLoad() {
    super.onLoad();
    //todo
  }
}
