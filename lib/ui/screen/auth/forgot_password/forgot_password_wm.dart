import 'package:flutter/widgets.dart';
import 'package:mwwm/mwwm.dart';

/// [WidgetModel] для экрана <ForgotPassword>
class ForgotPasswordWidgetModel extends WidgetModel {
  final GlobalKey<NavigatorState> navigator;

  ForgotPasswordWidgetModel(
    WidgetModelDependencies dependencies,
    this.navigator,
  ) : super(dependencies);

  @override
  void onLoad() {
    super.onLoad();
    //todo
  }
}
