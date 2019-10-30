import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:injector/injector.dart';
import 'package:mwwm/mwwm.dart';
import 'package:shop_app/ui/common/bottom_bar_widget.dart';
import 'package:shop_app/ui/screen/catalog/catalog_route.dart';
import 'package:shop_app/ui/screen/catalog/catalog_wm.dart';
import 'package:shop_app/ui/screen/catalog/di/catalog_component.dart';
import 'package:shop_app/ui/screen/catalog/di/catalog_wm_builder.dart';

/// Экран <Catalog>
class CatalogScreen extends MwwmWidget<CatalogScreenComponent> {
  CatalogScreen()
      : super(
          dependenciesBuilder: (context) => CatalogScreenComponent(context),
          widgetStateBuilder: () => _CatalogScreenState(),
          widgetModelBuilder: createCatalogWm,
        );
}

class _CatalogScreenState extends WidgetState<CatalogWidgetModel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Injector.of<CatalogScreenComponent>(context).component.scaffoldKey,
      appBar: AppBar(
        title: Text("Catalog screen"),
      ),
      bottomNavigationBar: BottomBarWidget(
        currentIndex: CatalogScreenRoute.thisPageIndex,
        bagIsEmpty: false,
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Container(
      child: Text("Catalog screen"),
    );
  }
}
