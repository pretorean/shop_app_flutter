import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:injector/injector.dart';
import 'package:mwwm/mwwm.dart';
import 'package:shop_app/ui/screen/auth/login/di/login_component.dart';
import 'package:shop_app/ui/screen/auth/login/di/login_wm_builder.dart';
import 'package:shop_app/ui/screen/auth/login/login_wm.dart';

/// Экран <Login>
class LoginScreen extends MwwmWidget<LoginScreenComponent> {
  LoginScreen()
      : super(
          dependenciesBuilder: (context) => LoginScreenComponent(context),
          widgetStateBuilder: () => _LoginScreenState(),
          widgetModelBuilder: createLoginWm,
        );
}

class _LoginScreenState extends WidgetState<LoginWidgetModel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Injector.of<LoginScreenComponent>(context).component.scaffoldKey,
      appBar: AppBar(
        title: Text("Login screen"),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Container(
      child: Text("Login screen"),
    );
  }
}
