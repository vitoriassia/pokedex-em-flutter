import 'package:pokedex_app/app/features/home/data/models/get_assets_list_request.dart';
import 'package:pokedex_app/app/features/home/domain/entities/asset_entity.dart';

abstract class AssetVariationRemoteDataSource {
  Future<List<AssetEntity>> getAssetsList(GetAssetsListRequest request);
}
