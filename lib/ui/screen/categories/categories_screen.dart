import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:injector/injector.dart';
import 'package:mwwm/mwwm.dart';
import 'package:shop_app/ui/screen/categories/categories_wm.dart';
import 'package:shop_app/ui/screen/categories/di/categories_component.dart';
import 'package:shop_app/ui/screen/categories/di/categories_wm_builder.dart';

/// Экран <Category>
class CategoryScreen extends MwwmWidget<CategoryScreenComponent> {
  CategoryScreen()
      : super(
          dependenciesBuilder: (context) => CategoryScreenComponent(context),
          widgetStateBuilder: () => _CategoryScreenState(),
          widgetModelBuilder: createCategoryWm,
        );
}

class _CategoryScreenState extends WidgetState<CategoryWidgetModel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Injector.of<CategoryScreenComponent>(context).component.scaffoldKey,
      appBar: AppBar(
        title: Text("Category screen"),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Container(
      child: Text("Category screen"),
    );
  }
}
