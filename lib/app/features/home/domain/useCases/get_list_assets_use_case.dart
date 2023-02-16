import 'package:dartz/dartz.dart';

import 'package:pokedex_app/app/core/services/api/errors/failures.dart';
import 'package:pokedex_app/app/core/shared/domain/use_case.dart';
import 'package:pokedex_app/app/features/home/domain/entities/pokemon_entity.dart';
import 'package:pokedex_app/app/features/home/domain/repositories/home_repository.dart';

class GetListPokemonsUseCase implements UseCase<NoParams, List<PokemonEntity>> {
  final HomeRepository _repository;

  GetListPokemonsUseCase(this._repository);

  @override
  Future<Either<Failure, List<PokemonEntity>>> call(NoParams params) async {
    return await _repository.getListPokemons();
  }
}
