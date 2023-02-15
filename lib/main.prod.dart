import 'package:pokedex_app/app/core/config/build_config.dart';
import 'package:pokedex_app/app/run_app.dart';

void main() {
  BuildConfig.baseProduction();
  RunApp.init();
}
