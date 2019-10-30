import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:injector/injector.dart';
import 'package:mwwm/mwwm.dart';
import 'package:shop_app/ui/common/bottom_bar_widget.dart';
import 'package:shop_app/ui/screen/favorites/di/favorites_component.dart';
import 'package:shop_app/ui/screen/favorites/di/favorites_wm_builder.dart';
import 'package:shop_app/ui/screen/favorites/favorites_route.dart';
import 'package:shop_app/ui/screen/favorites/favorites_wm.dart';

/// Экран <Favorites>
class FavoritesScreen extends MwwmWidget<FavoritesScreenComponent> {
  FavoritesScreen()
      : super(
          dependenciesBuilder: (context) => FavoritesScreenComponent(context),
          widgetStateBuilder: () => _FavoritesScreenState(),
          widgetModelBuilder: createFavoritesWm,
        );
}

class _FavoritesScreenState extends WidgetState<FavoritesWidgetModel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Injector.of<FavoritesScreenComponent>(context).component.scaffoldKey,
      appBar: AppBar(
        title: Text("Favorites screen"),
      ),
      bottomNavigationBar: BottomBarWidget(
        currentIndex: FavoritesScreenRoute.thisPageIndex,
        bagIsEmpty: false,
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Container(
      child: Text("Favorites screen"),
    );
  }
}
