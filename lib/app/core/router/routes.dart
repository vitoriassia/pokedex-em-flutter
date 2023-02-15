import 'package:get/get.dart';
import 'package:pokedex_app/app/core/router/routes_path.dart';
import 'package:pokedex_app/app/features/home/data/asset_variation_binds.dart';
import 'package:pokedex_app/app/features/home/presentation/home_page.dart';

abstract class Routes {
  static const _defaultTranstion = Transition.rightToLeft;
  static List<GetPage<dynamic>>? get getPages => [
        GetPage(
          name: RoutesPath.home,
          page: () => const HomePage(),
          transition: _defaultTranstion,
          binding: AssetVariationBinds(),
        ),
      ];
}
