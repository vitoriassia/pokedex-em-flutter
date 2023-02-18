import 'package:get/get.dart';
import 'package:pokedex_app/app/core/utils/file_creator.dart';
import 'package:pokedex_app/app/features/custom_pokemons/domain/entities/custom_pokemon_entity.dart';
import 'package:pokedex_app/app/features/home/domain/entities/pokemon_type_entity.dart';

class CustomPokemonsController extends GetxController {
  // --- USECASES --- //
  CustomPokemonsController();

  // -- ATRIBUTES --- //
  final Rx<CustomPokemonEntity> _customPokemon =
      const CustomPokemonEntity(id: 0, name: null, imagePath: null, types: [])
          .obs;
  Rx<CustomPokemonEntity> get customPokemon => _customPokemon;

  // -- ACTIONS --- //

  void setName(String newName) {
    _customPokemon.value = _customPokemon.value.copyWith(name: newName);
  }

  void setImagePath(String? newPath) {
    _customPokemon.value = _customPokemon.value.copyWith(imagePath: newPath);
  }

  void getPokemonPhoto() async {
    final FileCreator fileCreator = await FileCreator.init();
    final resultImage = await fileCreator.createFromGallery();
    if (resultImage != null) {
      setImagePath(resultImage.path);
    }
  }

  void setPokemonType(List<PokemonTypeEntity> listPokemonType) async {
    _customPokemon.value =
        _customPokemon.value.copyWith(types: listPokemonType);
  }
}
