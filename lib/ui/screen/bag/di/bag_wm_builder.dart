import 'package:flutter/material.dart';
import 'package:injector/injector.dart';
import 'package:mwwm/mwwm.dart';
import 'package:shop_app/ui/app/di/app.dart';
import 'package:shop_app/ui/base/error/standard_error_handler.dart';
import 'package:shop_app/ui/screen/bag/bag_wm.dart';

/// Билдер [WidgetModel] для эрана [Bag]
BagWidgetModel createBagWm(BuildContext context) {
  final component = Injector.of<AppComponent>(context).component;
  final dependencies = WidgetModelDependencies(
    errorHandler: StandardErrorHandler(
      component.messageController,
      component.dialogController,
      component.scInteractor,
    ),
  );

  return BagWidgetModel(
    dependencies,
    component.navigatorKey,
  );
}
