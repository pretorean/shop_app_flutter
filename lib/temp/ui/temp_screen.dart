import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:injector/injector.dart';
import 'package:mwwm/mwwm.dart';
import 'package:shop_app/res/colors.dart';
import 'package:shop_app/temp/ui/di/temp_component.dart';
import 'package:shop_app/temp/ui/di/temp_wm_builder.dart';
import 'package:shop_app/temp/ui/temp_wm.dart';

/// Экран <todo>
class TempScreen extends MwwmWidget<TempScreenComponent> {
  TempScreen()
      : super(
          dependenciesBuilder: (context) => TempScreenComponent(context),
          widgetStateBuilder: () => _TempScreenState(),
          widgetModelBuilder: createTempWm,
        );
}

class _TempScreenState extends WidgetState<TempWidgetModel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Injector.of<TempScreenComponent>(context).component.scaffoldKey,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: white,
        ),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Container(
      child: Text("temp screen"),
    );
  }
}
