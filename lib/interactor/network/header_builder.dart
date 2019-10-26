import 'package:network/network.dart';
import 'package:shop_app/interactor/token/token_storage.dart';
import 'package:shop_app/ui/res/strings/common_strings.dart';

/// Реализация билдера заголовков http запросов
class DefaultHeaderBuilder extends HeadersBuilder {
  String t = emptyString;

  final AuthInfoStorage _ts;

  DefaultHeaderBuilder(this._ts);

  @override
  Future<Map<String, String>> buildDynamicHeader(String url) async {
    var token = await _ts.getAccessToken();
    return url != emptyString //todo доработать
        ? {
            "X-Auth-Token": token,
          }
        : {};
  }
}
