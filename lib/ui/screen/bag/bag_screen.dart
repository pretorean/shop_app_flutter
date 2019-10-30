import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:injector/injector.dart';
import 'package:mwwm/mwwm.dart';
import 'package:shop_app/ui/common/bottom_bar_widget.dart';
import 'package:shop_app/ui/screen/bag/bag_route.dart';
import 'package:shop_app/ui/screen/bag/bag_wm.dart';
import 'package:shop_app/ui/screen/bag/di/bag_component.dart';
import 'package:shop_app/ui/screen/bag/di/bag_wm_builder.dart';

/// Экран <Bag>
class BagScreen extends MwwmWidget<BagScreenComponent> {
  BagScreen()
      : super(
          dependenciesBuilder: (context) => BagScreenComponent(context),
          widgetStateBuilder: () => _BagScreenState(),
          widgetModelBuilder: createBagWm,
        );
}

class _BagScreenState extends WidgetState<BagWidgetModel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Injector.of<BagScreenComponent>(context).component.scaffoldKey,
      appBar: AppBar(
        title: Text("Bag screen"),
      ),
      bottomNavigationBar: BottomBarWidget(
        currentIndex: BagScreenRoute.thisPageIndex,
        bagIsEmpty: false,
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Container(
      child: Text("Bag screen"),
    );
  }
}
