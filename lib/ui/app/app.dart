import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:injector/injector.dart';
import 'package:mwwm/mwwm.dart';
import 'package:shop_app/config/config.dart';
import 'package:shop_app/config/env.dart';
import 'package:shop_app/domain/debug_options.dart';
import 'package:shop_app/ui/app/app_wm.dart';
import 'package:shop_app/ui/app/di/app.dart';
import 'package:shop_app/ui/app/di/app_wm_builder.dart';
import 'package:shop_app/ui/res/styles.dart';

/// Виджет приложения
class App extends MwwmWidget<AppComponent> {
  App({
    Key key,
    WidgetModelBuilder wmBuilder = createAppWm,
  }) : super(
          key: key,
          dependenciesBuilder: (_) => AppComponent(),
          widgetStateBuilder: () => _AppState(),
          widgetModelBuilder: createAppWm,
        );
}

class _AppState extends WidgetState<AppWidgetModel> {
  GlobalKey<NavigatorState> _navigatorKey;

  @override
  void initState() {
    _navigatorKey = Injector.of<AppComponent>(context).component.navigatorKey;
    super.initState();
    Environment.instance().addListener(_setStateOnChangeConfig);
  }

  @override
  void dispose() {
    Environment.instance().removeListener(_setStateOnChangeConfig);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: _navigatorKey,
      theme: getConfig().isDarkTheme ? darkThemeData : lightThemeData,
      showPerformanceOverlay: getDebugConfig().showPerformanceOverlay,
      debugShowMaterialGrid: getDebugConfig().debugShowMaterialGrid,
      checkerboardRasterCacheImages:
          getDebugConfig().checkerboardRasterCacheImages,
      checkerboardOffscreenLayers: getDebugConfig().checkerboardOffscreenLayers,
      showSemanticsDebugger: getDebugConfig().showSemanticsDebugger,
      debugShowCheckedModeBanner: getDebugConfig().debugShowCheckedModeBanner,
      home: Scaffold(
        key: Injector.of<AppComponent>(context).component.scaffoldKey,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.shopping_cart,
                size: 150,
                color: Colors.indigo,
              ),
              SizedBox(height: 50),
              Text(
                'Shop App',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.indigo,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _setStateOnChangeConfig() {
    setState(() {});
  }

  DebugOptions getDebugConfig() => Environment.instance().config.debugOptions;

  Config getConfig() => Environment.instance().config;
}
