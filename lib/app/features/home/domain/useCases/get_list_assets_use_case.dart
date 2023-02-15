// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:pokedex_app/app/core/services/api/errors/failures.dart';
import 'package:pokedex_app/app/core/shared/domain/use_case.dart';
import 'package:pokedex_app/app/features/home/data/models/get_assets_list_request.dart';
import 'package:pokedex_app/app/features/home/domain/entities/asset_entity.dart';
import 'package:pokedex_app/app/features/home/domain/repositories/asset_variation_repository.dart';

class GetListAssetsUseCase implements UseCase<NoParams, List<AssetEntity>> {
  final AssetVariationRepository _repository;

  GetListAssetsUseCase(this._repository);

  @override
  Future<Either<Failure, List<AssetEntity>>> call(NoParams params) async {
    return await _repository.getAssetsList(request);
  }

  GetAssetsListRequest get request => const GetAssetsListRequest(
        code: 'PETR4',
        limitAssets: 30,
      );
}
