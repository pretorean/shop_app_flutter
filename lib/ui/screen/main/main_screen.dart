import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:injector/injector.dart';
import 'package:mwwm/mwwm.dart';
import 'package:shop_app/ui/common/bottom_bar_widget.dart';
import 'package:shop_app/ui/res/strings/common_strings.dart';
import 'package:shop_app/ui/screen/main/di/main_component.dart';
import 'package:shop_app/ui/screen/main/di/main_wm_builder.dart';
import 'package:shop_app/ui/screen/main/main_route.dart';
import 'package:shop_app/ui/screen/main/main_wm.dart';

/// Экран <Main>
class MainScreen extends MwwmWidget<MainScreenComponent> {
  MainScreen()
      : super(
          dependenciesBuilder: (context) => MainScreenComponent(context),
          widgetStateBuilder: () => _MainScreenState(),
          widgetModelBuilder: createMainWm,
        );
}

class _MainScreenState extends WidgetState<MainWidgetModel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Injector.of<MainScreenComponent>(context).component.scaffoldKey,
      appBar: AppBar(
        title: Text('Main screen'),
      ),
      bottomNavigationBar: BottomBarWidget(
        currentIndex: MainScreenRoute.thisPageIndex,
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          StreamedStateBuilder<bool>(
            streamedState: wm.themeState,
            builder: (context, snapshot) {
              return SwitchListTile(
                title: Text(blackThemeText),
                value: snapshot,
                onChanged: wm.changeThemeAction,
              );
            },
          ),
          RaisedButton(
            child: Text('Открыть экран регистрации'),
            onPressed: wm.openRegisterScreenAction,
          ),
          RaisedButton(
            child: Text('Открыть экран входа'),
            onPressed: wm.openLoginScreenAction,
          ),
          RaisedButton(
            child: Text('Открыть экран восстановления пароля'),
            onPressed: wm.openForgotPasswordScreenAction,
          ),
        ],
      ),
    );
  }
}
