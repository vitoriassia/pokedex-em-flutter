import 'package:dartz/dartz.dart';
import 'package:pokedex_app/app/core/services/api/errors/failures.dart';
import 'package:pokedex_app/app/features/home/data/models/get_assets_list_request.dart';
import 'package:pokedex_app/app/features/home/domain/entities/asset_entity.dart';

abstract class AssetVariationRepository {
  Future<Either<Failure, List<AssetEntity>>> getAssetsList(
    GetAssetsListRequest request,
  );
}
