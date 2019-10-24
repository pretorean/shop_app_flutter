import 'package:shop_app/config/config.dart';
import 'package:shop_app/config/env.dart';

///URL запросов сервера
abstract class Url {
  static String get testUrl => "http://localhost:8080";

  static String get prodUrl => "ttp://localhost:8080";

  static String get devUrl => "ttp://localhost:8080";

  static String get baseUrl => Environment<Config>.instance().config.url;

  static String get prodProxyUrl => "";

  static String get qaProxyUrl => "localhost";

  static String get devProxyUrl => "";
}

abstract class AuthUrl {
  static String get authUrl => "${Url.baseUrl}/auth";

  static String get confirmAuthUrl => "$authUrl/confirm";
}

///URL запросов авторизации
abstract class RegistrationUrl {
  static String get registrationUrl => "${Url.testUrl}/register";

  static String get certificateUrl => "$registrationUrl/certificate";
}
