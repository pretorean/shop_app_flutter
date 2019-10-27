import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:injector/injector.dart';
import 'package:mwwm/mwwm.dart';
import 'package:shop_app/ui/res/assets.dart';
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
        title: Text(
          registerScreenTitle,
        ),
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
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: registerNameField,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: registerEmailField,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: registerPasswordField,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(registerAlreadyHaveAccountText),
                  IconButton(
                    icon: SvgPicture.asset(icRoundArrowRightDark),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Container(
                height: 48.0,
                child: RaisedButton(
                  onPressed: () {},
                  child: Text(
                    registerButtonText,
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
