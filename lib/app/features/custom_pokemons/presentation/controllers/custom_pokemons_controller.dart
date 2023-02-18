import 'package:get/get.dart';
import 'package:pokedex_app/app/core/shared/presentation/message_to_failure_converter/failure_to_message_converter_factory.dart';
import 'package:pokedex_app/app/core/shared/presentation/ui_state.dart';
import 'package:pokedex_app/app/core/utils/file_creator.dart';
import 'package:pokedex_app/app/features/custom_pokemons/domain/entities/custom_pokemon_entity.dart';
import 'package:pokedex_app/app/features/custom_pokemons/domain/useCases/register_custom_pokemon_use_case.dart';
import 'package:pokedex_app/app/features/home/domain/entities/pokemon_type_entity.dart';

class CustomPokemonsController extends GetxController {
  // --- USECASES --- //
  final RegisterCustomPokemonUseCase _registerCustomPokemonUseCase;
  CustomPokemonsController(this._registerCustomPokemonUseCase);

  // -- ATRIBUTES --- //
  Rx<CustomPokemonEntity> _customPokemon =
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

  final Rx<UiState> _uiState = Rx<UiState>(Initial());
  Rx<UiState> get uiState => _uiState;

  Future<void> registerCustomPokemon() async {
    _uiState.value = Loading();

    final result = await _registerCustomPokemonUseCase(
      RegisterCustomPokemonParams(
        customPokemonEntity: _customPokemon.value,
      ),
    );

    _uiState.value = result.fold(
      (failure) => ErrorState(
        converter: FailureToMessageConverterFactory(failure)(),
        failure: failure,
      ),
      (succes) => const Success(null),
    );
  }

  void disposeForm() {
    _uiState.value = Initial();
    _customPokemon =
        const CustomPokemonEntity(id: 0, name: null, imagePath: null, types: [])
            .obs;
  }
}
