import 'package:flutter/widgets.dart';
import 'package:shop_app/config/env.dart';
import 'package:shop_app/interactor/theme_storage/theme_storage.dart';
import 'package:shop_app/ui/app/app.dart';
import 'package:shop_app/util/sp_helper.dart';

void run() async {
  _initCrashlytics();
  _initLogger();
  _restoreTheme();
  _runApp();
}

void _restoreTheme() async {
  final ThemeStorage _themeStorage = ThemeStorage(PreferencesHelper());
  final bool _isDarkTheme = await _themeStorage.getTheme();
  Environment.instance().config = Environment.instance().config.copyWith(
        isDarkTheme: _isDarkTheme,
      );
}

void _runApp() {
//  runZoned<Future<void>>(
//    () async {
//      runApp(App());
//    },
//    onError: Crashlytics.instance.recordError,
//  );

  runApp(App());
}

void _initCrashlytics() {
//  FlutterError.onError = Crashlytics.instance.recordFlutterError;
}

void _initLogger() {
//  RemoteLogger.addStrategy(CrashlyticsRemoteLogStrategy());
//  Logger.addStrategy(DebugLogStrategy());
//  Logger.addStrategy(RemoteLogStrategy());
}
