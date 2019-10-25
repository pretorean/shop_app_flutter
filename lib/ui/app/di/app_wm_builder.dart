import 'package:flutter/material.dart';
import 'package:injector/injector.dart';
import 'package:mwwm/mwwm.dart';
import 'package:shop_app/ui/app/app_wm.dart';
import 'package:shop_app/ui/app/di/app.dart';
import 'package:shop_app/ui/base/error/standard_error_handler.dart';

/// Билдер [WidgetModel] для виджета приложения [App]
AppWidgetModel createAppWm(BuildContext context) {
  final component = Injector.of<AppComponent>(context).component;
  final dependencies = WidgetModelDependencies(
    errorHandler: StandardErrorHandler(
      component.messageController,
      component.dialogController,
      component.scInteractor,
    ),
  );

  return AppWidgetModel(
    dependencies,
    component.messageController,
    component.navigatorKey,
  );
}
