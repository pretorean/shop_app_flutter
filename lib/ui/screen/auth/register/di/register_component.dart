import 'package:flutter/material.dart';
import 'package:injector/injector.dart';
import 'package:mwwm/mwwm.dart';
import 'package:shop_app/ui/base/default_dialog_controller.dart';
import 'package:shop_app/ui/base/material_message_controller.dart';

/// [Component] для экрана <Register>
class RegisterScreenComponent implements Component {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  MessageController messageController;
  DialogController dialogController;
  NavigatorState navigator;

  RegisterScreenComponent(BuildContext context) {
    messageController = MaterialMessageController(scaffoldKey);
    dialogController = DefaultDialogController(scaffoldKey);
    navigator = Navigator.of(context);
  }
}
