import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:injector/injector.dart';
import 'package:mwwm/mwwm.dart';
import 'package:shop_app/config/env.dart';
import 'package:shop_app/ui/common/bottom_bar_widget.dart';
import 'package:shop_app/ui/common/product_card_bag.dart';
import 'package:shop_app/ui/res/assets.dart';
import 'package:shop_app/ui/res/colors.dart';
import 'package:shop_app/ui/res/strings/strings.dart';
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
        title: Text(bagScreenTitle),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      bottomNavigationBar: BottomBarWidget(
        currentIndex: BagScreenRoute.thisPageIndex,
        bagIsEmpty: false,
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    final bool _isDark = Environment.instance().config.isDarkTheme;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
              child: ProductCardBag(
                image: Image.asset(imgDemo01),
                productTitle: 'T-Shirt',
                productColor: 'Gray',
                productSize: 'L',
                productCount: '1',
                productPrice: '30\$',
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: ProductCardBag(
                image: Image.asset(imgDemo02),
                productTitle: 'Pullover',
                productColor: 'Black',
                productSize: 'L',
                productCount: '1',
                productPrice: '51\$',
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: ProductCardBag(
                image: Image.asset(imgDemo03),
                productTitle: 'Sport Dress',
                productColor: 'Black',
                productSize: 'M',
                productCount: '1',
                productPrice: '43\$',
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: bagEnterPromoText,
                  suffixIcon: IconButton(
                    color: _isDark ? colorGray_dark : colorGray_light,
                    focusColor: _isDark ? colorGray_dark : colorGray_light,
                    icon: Icon(Icons.arrow_forward),
                    onPressed: () {},
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 16.0),
              child: Row(
                children: <Widget>[
                  Text(
                    bagTotalAmountText,
                    style: TextStyle(fontSize: 14.0),
                  ),
                  Spacer(),
                  Text(
                    '124\$',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 48.0,
              width: double.infinity,
              child: RaisedButton(
                child: Text(bagCheckOutText),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
