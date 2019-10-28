import 'package:flutter/material.dart';
import 'package:injector/injector.dart';
import 'package:mwwm/mwwm.dart';
import 'package:shop_app/ui/app/di/app.dart';
import 'package:shop_app/ui/base/error/standard_error_handler.dart';
import 'package:shop_app/ui/screen/auth/login/login_wm.dart';

/// Билдер [WidgetModel] для эрана [Login]
LoginWidgetModel createLoginWm(BuildContext context) {
  final component = Injector.of<AppComponent>(context).component;
  final dependencies = WidgetModelDependencies(
    errorHandler: StandardErrorHandler(
      component.messageController,
      component.dialogController,
      component.scInteractor,
    ),
  );

  return LoginWidgetModel(
    dependencies,
    component.navigatorKey,
  );
}
