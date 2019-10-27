import 'package:flutter/widgets.dart';
import 'package:mwwm/mwwm.dart';

/// [WidgetModel] для экрана <Register>
class RegisterWidgetModel extends WidgetModel {
  final GlobalKey<NavigatorState> navigator;

  RegisterWidgetModel(
    WidgetModelDependencies dependencies,
    this.navigator,
  ) : super(dependencies);

  @override
  void onLoad() {
    super.onLoad();
    //todo
  }
}
