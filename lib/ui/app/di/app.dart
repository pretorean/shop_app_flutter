import 'package:flutter/material.dart';
import 'package:injector/injector.dart';
import 'package:mwwm/mwwm.dart';
import 'package:network/network.dart';
import 'package:shop_app/config/config.dart';
import 'package:shop_app/config/env.dart';
import 'package:shop_app/interactor/auth/auth_interactor.dart';
import 'package:shop_app/interactor/network/header_builder.dart';
import 'package:shop_app/interactor/network/status_mapper.dart';
import 'package:shop_app/interactor/session/session_changed_interactor.dart';
import 'package:shop_app/interactor/token/token_storage.dart';
import 'package:shop_app/res/strings/common_strings.dart';
import 'package:shop_app/ui/base/default_dialog_controller.dart';
import 'package:shop_app/ui/base/material_message_controller.dart';
import 'package:shop_app/util/sp_helper.dart';

/// Component per app
class AppComponent implements Component {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  PreferencesHelper preferencesHelper = PreferencesHelper();
  AuthInfoStorage authStorage;
  RxHttp http;
  SessionChangedInteractor scInteractor;
  AuthInteractor authInteractor;

  MessageController messageController;
  DialogController dialogController;

  AppComponent() {
    authStorage = AuthInfoStorage(preferencesHelper);

    http = _initHttp(authStorage);
    scInteractor = SessionChangedInteractor(authStorage);

    authInteractor = AuthInteractor(
      scInteractor,
    );

    messageController = MaterialMessageController(scaffoldKey);
    dialogController = DefaultDialogController(scaffoldKey);
  }

  RxHttp _initHttp(AuthInfoStorage authStorage) {
    var proxyUrl = Environment<Config>.instance().config.proxyUrl;
    var dioHttp = DioHttp(
      config: HttpConfig(
        emptyString,
        Duration(seconds: 30),
        proxyUrl: proxyUrl,
      ),
      errorMapper: DefaultStatusMapper(),
      headersBuilder: DefaultHeaderBuilder(authStorage),
    );
    return RxHttpDelegate(dioHttp);
  }
}
