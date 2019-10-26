import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:injector/injector.dart';
import 'package:mwwm/mwwm.dart';
import 'package:shop_app/ui/common/bottom_bar_widget.dart';
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
    return Container(
      child: Text("main screen"),
    );
  }
}
