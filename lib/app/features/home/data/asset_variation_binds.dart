import 'package:get/instance_manager.dart';
import 'package:pokedex_app/app/core/binds/binds_helper.dart';
import 'package:pokedex_app/app/core/services/api/api_service_impl.dart';
import 'package:pokedex_app/app/features/home/data/asset_variation_remote_data_source_impl.dart';
import 'package:pokedex_app/app/features/home/data/asset_variation_repository_impl.dart';
import 'package:pokedex_app/app/features/home/domain/useCases/get_list_assets_use_case.dart';

class AssetVariationBinds implements Bindings {
  @override
  void dependencies() {
    // ================== DOMAIN =================== //
    Get.put<AssetVariationRemoteDataSourceImpl>(
      AssetVariationRemoteDataSourceImpl(
        BindsHelper.get<ApiServiceImpl>(),
      ),
    );
    Get.put<AssetVariationRepositoyImpl>(
      AssetVariationRepositoyImpl(
        BindsHelper.get<AssetVariationRemoteDataSourceImpl>(),
      ),
    );
    // ================== USE CASES ============== //
    Get.put<GetListAssetsUseCase>(
      GetListAssetsUseCase(
        BindsHelper.get<AssetVariationRepositoyImpl>(),
      ),
    );

    // ================ CONTROLLER =============== //
  }
}
