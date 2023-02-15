import 'package:pokedex_app/app/core/services/api/errors/exception_handler_scope.dart';
import 'package:pokedex_app/app/features/home/domain/datasources/asset_variation_remote_data_source.dart';
import 'package:pokedex_app/app/features/home/domain/entities/asset_entity.dart';
import 'package:pokedex_app/app/features/home/data/models/get_assets_list_request.dart';
import 'package:pokedex_app/app/core/services/api/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:pokedex_app/app/features/home/domain/repositories/asset_variation_repository.dart';

class AssetVariationRepositoyImpl extends AssetVariationRepository {
  final AssetVariationRemoteDataSource _remoteDataSource;

  AssetVariationRepositoyImpl(this._remoteDataSource);
  @override
  Future<Either<Failure, List<AssetEntity>>> getAssetsList(
      GetAssetsListRequest request) async {
    return repositoryExceptionHandlerScope(
      () async => await _remoteDataSource.getAssetsList(request),
    );
  }
}
