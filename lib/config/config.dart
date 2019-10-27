import 'package:shop_app/domain/debug_options.dart';

class Config {
  final String url;
  final String proxyUrl;
  final bool isDarkTheme;
  final DebugOptions debugOptions;

  Config({
    this.url,
    this.proxyUrl,
    this.isDarkTheme,
    this.debugOptions,
  });

  Config copyWith({
    String url,
    String proxyUrl,
    bool isDarkTheme,
    DebugOptions debugOptions,
  }) =>
      Config(
        url: url ?? this.url,
        proxyUrl: proxyUrl ?? this.proxyUrl,
        isDarkTheme: isDarkTheme ?? this.isDarkTheme,
        debugOptions: debugOptions ?? this.debugOptions,
      );
}
