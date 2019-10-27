import 'package:shop_app/util/sp_helper.dart';

/// Хранилище темы оформления
class ThemeStorage {
  static const _key_theme = "key_theme";

  final PreferencesHelper _preferencesHelper;

  ThemeStorage(this._preferencesHelper);

  Future<bool> getTheme() async {
    final bool _isDarkTheme =
        await _preferencesHelper.get<bool>(_key_theme, false);
    return _isDarkTheme;
  }

  Future saveTheme(bool isDarkTheme) async {
    return await _preferencesHelper.set(_key_theme, isDarkTheme);
  }
}
