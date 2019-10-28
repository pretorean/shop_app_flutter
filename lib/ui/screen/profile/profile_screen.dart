import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:injector/injector.dart';
import 'package:mwwm/mwwm.dart';
import 'package:shop_app/config/env.dart';
import 'package:shop_app/ui/common/bottom_bar_widget.dart';
import 'package:shop_app/ui/res/assets.dart';
import 'package:shop_app/ui/res/colors.dart';
import 'package:shop_app/ui/res/strings/strings.dart';
import 'package:shop_app/ui/screen/profile/di/profile_component.dart';
import 'package:shop_app/ui/screen/profile/di/profile_wm_builder.dart';
import 'package:shop_app/ui/screen/profile/profile_route.dart';
import 'package:shop_app/ui/screen/profile/profile_wm.dart';

/// Экран <Profile>
class ProfileScreen extends MwwmWidget<ProfileScreenComponent> {
  ProfileScreen()
      : super(
          dependenciesBuilder: (context) => ProfileScreenComponent(context),
          widgetStateBuilder: () => _ProfileScreenState(),
          widgetModelBuilder: createProfileWm,
        );
}

class _ProfileScreenState extends WidgetState<ProfileWidgetModel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Injector.of<ProfileScreenComponent>(context).component.scaffoldKey,
      appBar: AppBar(
        title: Text(profileScreenTitle),
      ),
      bottomNavigationBar: BottomBarWidget(
        currentIndex: ProfileScreenRoute.thisPageIndex,
        bagIsEmpty: false,
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    final bool _isDark = Environment.instance().config.isDarkTheme;

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListTile(
              title: Text('Matilda Brown'),
              subtitle: Text('matildabrown@mail.com'),
              leading: CircleAvatar(
                minRadius: 16.0,
                maxRadius: 32.0,
                child: Image.asset(imgDemoAvatar),
              ),
            ),
          ),
          ListTile(
            title: Text(profileMyOrderTitle),
            subtitle: Text('Уже есть 12 заказов'),
            trailing: Icon(Icons.chevron_right,
                color: _isDark ? colorGray_dark : colorGray_light),
            onTap: () {},
          ),
          ListTile(
            title: Text(profileShippingAddressesTitle),
            subtitle: Text('3 адреса'),
            trailing: Icon(Icons.chevron_right,
                color: _isDark ? colorGray_dark : colorGray_light),
            onTap: () {},
          ),
          ListTile(
            title: Text(profilePaymentMethodsTitle),
            subtitle: Text('Visa **1665, Visa **2556'),
            trailing: Icon(Icons.chevron_right,
                color: _isDark ? colorGray_dark : colorGray_light),
            onTap: () {},
          ),
          ListTile(
            title: Text(profilePromocodesTitle),
            subtitle: Text('У вас есть специальные промо-коды'),
            trailing: Icon(Icons.chevron_right,
                color: _isDark ? colorGray_dark : colorGray_light),
            onTap: () {},
          ),
          ListTile(
            title: Text(profileMyReviewsTitle),
            subtitle: Text('Отзывы на 4 товара'),
            trailing: Icon(Icons.chevron_right,
                color: _isDark ? colorGray_dark : colorGray_light),
            onTap: () {},
          ),
          ListTile(
            title: Text(profileSettingsTitle),
            subtitle: Text('Уведомления, пароль'),
            trailing: Icon(Icons.chevron_right,
                color: _isDark ? colorGray_dark : colorGray_light),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
