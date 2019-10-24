import 'package:shop_app/config/build_types.dart';
import 'package:shop_app/config/config.dart';
import 'package:shop_app/config/env.dart';
import 'package:shop_app/domain/debug_options.dart';
import 'package:shop_app/interactor/common/urls.dart';
import 'package:shop_app/runner/runner.dart';

//Main entry point of app
void main() async {
  Environment.init(
    buildType: BuildType.qa,
    config: Config(
      url: Url.testUrl,
      proxyUrl: Url.qaProxyUrl,
      debugOptions: DebugOptions(
        debugShowCheckedModeBanner: true,
      ),
    ),
  );

  run();
}
