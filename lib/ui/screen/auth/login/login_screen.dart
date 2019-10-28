import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:injector/injector.dart';
import 'package:mwwm/mwwm.dart';
import 'package:shop_app/config/env.dart';
import 'package:shop_app/ui/res/assets.dart';
import 'package:shop_app/ui/res/strings/strings.dart';
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
        title: Text(loginScreenTitle),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    final bool _isDark = Environment.instance().config.isDarkTheme;

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
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: loginEmailField,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: loginPasswordField,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(loginForgotPasswordText),
                  IconButton(
                    icon: SvgPicture.asset(_isDark
                        ? icRoundArrowRightDark
                        : icRoundArrowRightLight),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(loginNotHaveAccountText),
                  IconButton(
                    icon: SvgPicture.asset(_isDark
                        ? icRoundArrowRightDark
                        : icRoundArrowRightLight),
                    onPressed: () {},
                  ),
                ],
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
                    loginButtonText,
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
