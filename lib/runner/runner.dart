import 'package:flutter/widgets.dart';
import 'package:shop_app/ui/app/app.dart';

void run() async {
  _initCrashlytics();
  _initLogger();
  _runApp();
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
