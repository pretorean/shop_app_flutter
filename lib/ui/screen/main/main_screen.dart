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
                _bannerSetSection(),
                _sectionSale(),
                _SectionNews(),
                _themeSwitchWidget(),
                _loginWidgetsDemo(),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _bigBannerSection() {
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
                  child: Text('Купить'),
                  onPressed: () {},
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _bannerSetSection() {
    final bool _isDark = Environment.instance().config.isDarkTheme;

    return Row(
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.width,
          width: MediaQuery.of(context).size.width / 2,
          child: Column(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.width / 2,
                width: MediaQuery.of(context).size.width / 2,
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0, bottom: 32.0),
                    child: Text(
                      'Сезонная распродажа',
                      style: TextStyle(
                        fontSize: 30.0,
                        color: _isDark ? colorHotSale_dark : colorHotSale_light,
                      ),
                    ),
                  ),
                ),
              ),
              Stack(
                alignment: Alignment.bottomLeft,
                children: <Widget>[
                  Image.asset(
                    imgBanner03,
                    height: MediaQuery.of(context).size.width / 2,
                    width: MediaQuery.of(context).size.width / 2,
                    fit: BoxFit.fitHeight,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16.0, bottom: 32.0),
                      child: Text(
                        'Чёрное',
                        style: TextStyle(
                          fontSize: 34.0,
                          color: _isDark ? colorWhite_dark : colorWhite_light,
                        ),
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {},
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        StreamedStateBuilder<bool>(
          streamedState: wm.bannerImageState,
          builder: (context, bannerType) {
            return Stack(
              alignment: Alignment.centerLeft,
              children: <Widget>[
                Image.asset(
                  bannerType ? imgBanner04 : imgBanner05,
                  height: MediaQuery.of(context).size.width,
                  width: MediaQuery.of(context).size.width / 2,
                  fit: BoxFit.fill,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Text(
                      bannerType ? 'Мужские шапки' : 'Мужские толстовки',
                      style: TextStyle(
                        fontSize: 34.0,
                        color: _isDark ? colorWhite_dark : colorWhite_light,
                      ),
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {},
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }

  Widget _sectionSale() {
    final bool _isDark = Environment.instance().config.isDarkTheme;

    return Padding(
      padding: const EdgeInsets.only(top: 32.0, left: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Распродажа',
                style: TextStyle(fontSize: 34.0),
              ),
              FlatButton(
                onPressed: () {},
                child: Text(
                  'Смотреть всё',
                  style: TextStyle(
                      fontSize: 11.0,
                      color: _isDark ? colorWhite_dark : colorBlack_light),
                ),
              ),
            ],
          ),
          SizedBox(height: 4.0),
          Text(
            'Супер летняя распродажа',
            style: TextStyle(
              fontSize: 11.0,
              color: _isDark ? colorGray_dark : colorGray_light,
            ),
          ),
          SizedBox(height: 20.0),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: <Widget>[
                Placeholder(
                  fallbackWidth: 150.0,
                  fallbackHeight: 260.0,
                ),
                SizedBox(width: 16.0),
                Placeholder(
                  fallbackWidth: 150.0,
                  fallbackHeight: 260.0,
                ),
                SizedBox(width: 16.0),
                Placeholder(
                  fallbackWidth: 150.0,
                  fallbackHeight: 260.0,
                ),
                SizedBox(width: 16.0),
                Placeholder(
                  fallbackWidth: 150.0,
                  fallbackHeight: 260.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _SectionNews() {
    final bool _isDark = Environment.instance().config.isDarkTheme;

    return Padding(
      padding: const EdgeInsets.only(top: 32.0, left: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Новое',
                style: TextStyle(fontSize: 34.0),
              ),
              FlatButton(
                onPressed: () {},
                child: Text(
                  'Смотреть всё',
                  style: TextStyle(
                      fontSize: 11.0,
                      color: _isDark ? colorWhite_dark : colorBlack_light),
                ),
              ),
            ],
          ),
          SizedBox(height: 4.0),
          Text(
            'Вы никогда не видели этого раньше!',
            style: TextStyle(
              fontSize: 11.0,
              color: _isDark ? colorGray_dark : colorGray_light,
            ),
          ),
          SizedBox(height: 20.0),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: <Widget>[
                Placeholder(
                  fallbackWidth: 150.0,
                  fallbackHeight: 260.0,
                ),
                SizedBox(width: 16.0),
                Placeholder(
                  fallbackWidth: 150.0,
                  fallbackHeight: 260.0,
                ),
                SizedBox(width: 16.0),
                Placeholder(
                  fallbackWidth: 150.0,
                  fallbackHeight: 260.0,
                ),
                SizedBox(width: 16.0),
                Placeholder(
                  fallbackWidth: 150.0,
                  fallbackHeight: 260.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _themeSwitchWidget() => Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
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

  Widget _loginWidgetsDemo() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
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
        ),
      );
}
