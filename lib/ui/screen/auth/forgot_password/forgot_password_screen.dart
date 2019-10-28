import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:injector/injector.dart';
import 'package:mwwm/mwwm.dart';
import 'package:shop_app/ui/res/strings/strings.dart';
import 'package:shop_app/ui/screen/auth/forgot_password/di/forgot_password_component.dart';
import 'package:shop_app/ui/screen/auth/forgot_password/di/forgot_password_wm_builder.dart';
import 'package:shop_app/ui/screen/auth/forgot_password/forgot_password_wm.dart';

/// Экран <ForgotPassword>
class ForgotPasswordScreen extends MwwmWidget<ForgotPasswordScreenComponent> {
  ForgotPasswordScreen()
      : super(
          dependenciesBuilder: (context) =>
              ForgotPasswordScreenComponent(context),
          widgetStateBuilder: () => _ForgotPasswordScreenState(),
          widgetModelBuilder: createForgotPasswordWm,
        );
}

class _ForgotPasswordScreenState
    extends WidgetState<ForgotPasswordWidgetModel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Injector.of<ForgotPasswordScreenComponent>(context)
          .component
          .scaffoldKey,
      appBar: AppBar(
        title: Text(forgotPasswordScreenTitle),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 70.0,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(forgotPasswordTopText),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: forgotPasswordEmailField,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Container(
                height: 48.0,
                width: double.infinity,
                child: RaisedButton(
                  onPressed: () {},
                  child: Text(
                    forgotPasswordButtonText,
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
