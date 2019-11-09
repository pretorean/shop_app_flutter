import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:injector/injector.dart';
import 'package:mwwm/mwwm.dart';
import 'package:shop_app/config/env.dart';
import 'package:shop_app/ui/common/bottom_bar_widget.dart';
import 'package:shop_app/ui/res/assets.dart';
import 'package:shop_app/ui/res/colors.dart';
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
      bottomNavigationBar: BottomBarWidget(
        currentIndex: MainScreenRoute.thisPageIndex,
        bagIsEmpty: false,
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate(
              [
                _bigBannerSection(),
                _themeSwitchWidget(),
                _loginWidgetsDemo(),
              ],
            ),
          )
        ],
      ),
    );
  }

  _bigBannerSection() {
    final bool _isDark = Environment.instance().config.isDarkTheme;

    return Stack(
      alignment: Alignment.bottomLeft,
      children: <Widget>[
        StreamedStateBuilder<bool>(
          streamedState: wm.bannerImageState,
          builder: (context, bannerType) => Image.asset(
            bannerType ? imgBanner01 : imgBanner02,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fitWidth,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Модная распродажа',
                style: TextStyle(
                  fontSize: 48.0,
                  color: _isDark ? colorWhite_dark : colorWhite_light,
                ),
              ),
              SizedBox(height: 16.0),
              SizedBox(
                width: 160.0,
                child: RaisedButton(
                  child: Text('Проверьте'),
                  onPressed: () {},
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  _themeSwitchWidget() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Card(
          child: StreamedStateBuilder<bool>(
            streamedState: wm.themeState,
            builder: (context, snapshot) {
              return SwitchListTile(
                title: Text(blackThemeText),
                value: snapshot,
                onChanged: (value) {
                  wm.changeThemeAction(value);
                  setState(() {});
                },
              );
            },
          ),
        ),
      );

  _loginWidgetsDemo() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Card(
          child: Container(
            width: double.infinity,
            child: Column(
              children: <Widget>[
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
          ),
        ),
      );
}
