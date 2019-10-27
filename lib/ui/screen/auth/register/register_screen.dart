import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:injector/injector.dart';
import 'package:mwwm/mwwm.dart';
import 'package:shop_app/ui/res/strings/strings.dart';
import 'package:shop_app/ui/screen/auth/register/di/register_component.dart';
import 'package:shop_app/ui/screen/auth/register/di/register_wm_builder.dart';
import 'package:shop_app/ui/screen/auth/register/register_wm.dart';

/// Экран <Register>
class RegisterScreen extends MwwmWidget<RegisterScreenComponent> {
  RegisterScreen()
      : super(
          dependenciesBuilder: (context) => RegisterScreenComponent(context),
          widgetStateBuilder: () => _RegisterScreenState(),
          widgetModelBuilder: createRegisterWm,
        );
}

class _RegisterScreenState extends WidgetState<RegisterWidgetModel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Injector.of<RegisterScreenComponent>(context).component.scaffoldKey,
      appBar: AppBar(
        title: Text(registerScreenTitle, ),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Column(
      children: <Widget>[
        TextFormField(),
        TextFormField(),
        TextFormField(),
        RaisedButton(
          onPressed: () {},
        ),
      ],
    );
  }
}
