import 'package:pokedex_app/app/core/services/api/errors/exception_handler_scope.dart';
import 'package:pokedex_app/app/core/services/api_service.dart';
import 'package:pokedex_app/app/features/home/domain/datasources/home_remote_data_source.dart';
import 'package:pokedex_app/app/features/home/domain/entities/pokemon_entity.dart';

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService _apiService;

  HomeRemoteDataSourceImpl(this._apiService);

  @override
  Future<List<PokemonEntity>> getListPokemons() async {
    return remoteDataSourceExceptionHandlerScope<List<PokemonEntity>>(
      () async {
        // final response =
        //     await _apiService.getDataFrom('/finance/chart/${request.code}.SA');

        // final data = DataWrapperResponse.fromJson(
        //   response.data['chart']["result"][0],
        //   response.statusCode,
        // );

        return [];
      },
    );
  }
}
