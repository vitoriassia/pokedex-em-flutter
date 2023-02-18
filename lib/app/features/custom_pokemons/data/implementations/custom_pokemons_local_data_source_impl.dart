import 'package:pokedex_app/app/core/services/api/errors/exception_handler_scope.dart';
import 'package:pokedex_app/app/core/storage/custom_pokemon/custom_pokemon_reader.dart';
import 'package:pokedex_app/app/core/storage/custom_pokemon/custom_pokemon_writer.dart';
import 'package:pokedex_app/app/features/custom_pokemons/domain/datasources/custom_pokemons_local_data_source.dart';
import 'package:pokedex_app/app/features/custom_pokemons/domain/entities/custom_pokemon_entity.dart';

class CustomPokemonsLocalDataSourceImpl
    implements CustomPokemonsLocalDataSource {
  final CustomPokemonWriter _writer;
  final CustomPokemonReader _reader;

  CustomPokemonsLocalDataSourceImpl(this._writer, this._reader);

  @override
  Future<void> registerCustomPokemon(CustomPokemonEntity customPokemonEntity) {
    return localDataSourceExceptionHandlerScope(
      () async {
        await _writer.put(customPokemonEntity.toBox());
      },
    );
  }
}
