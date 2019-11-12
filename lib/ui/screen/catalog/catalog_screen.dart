import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:injector/injector.dart';
import 'package:mwwm/mwwm.dart';
import 'package:shop_app/domain/Category.dart';
import 'package:shop_app/ui/common/bottom_bar_widget.dart';
import 'package:shop_app/ui/common/category_card.dart';
import 'package:shop_app/ui/res/strings/strings.dart';
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
      bottomNavigationBar: BottomBarWidget(
        currentIndex: CatalogScreenRoute.thisPageIndex,
        bagIsEmpty: false,
      ),
      body: _buildScrollBody(),
    );
  }

  Widget _buildScrollBody() {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          title: Text(categoryScreenTitle),
          pinned: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
          ],
        ),
        EntityStateBuilder<List<Category>>(
          streamedState: wm.categoryListState,
          loadingChild: SliverList(
            delegate: SliverChildListDelegate([
              Center(
                child: CircularProgressIndicator(),
              ),
            ]),
          ),
          errorChild: SizedBox.shrink(),
          child: (context, List<Category> list) {
            return SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  Category item = list[index];
                  return Padding(
                    padding: EdgeInsets.only(
                        top: 8.0, bottom: 8.0, left: 16.0, right: 16.0),
                    child: CategoryCard(
                      onTap: () {},
                      categoryName: item.name,
                      image: item.imgPath != null
                          ? Image.asset(item.imgPath)
                          : null,
                    ),
                  );
                },
                childCount: list.length,
              ),
            );
          },
        )
      ],
    );
  }
}
