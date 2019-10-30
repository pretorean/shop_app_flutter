import 'package:flutter/material.dart';
import 'package:injector/injector.dart';
import 'package:mwwm/mwwm.dart';
import 'package:shop_app/ui/app/di/app.dart';
import 'package:shop_app/ui/base/error/standard_error_handler.dart';
import 'package:shop_app/ui/screen/catalog/catalog_wm.dart';

/// Билдер [WidgetModel] для эрана [Catalog]
CatalogWidgetModel createCatalogWm(BuildContext context) {
  final component = Injector.of<AppComponent>(context).component;
  final dependencies = WidgetModelDependencies(
    errorHandler: StandardErrorHandler(
      component.messageController,
      component.dialogController,
      component.scInteractor,
    ),
  );

  return CatalogWidgetModel(
    dependencies,
    component.navigatorKey,
  );
}
