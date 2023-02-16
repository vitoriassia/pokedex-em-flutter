import 'package:get/get.dart';
import 'package:pokedex_app/app/core/shared/domain/use_case.dart';
import 'package:pokedex_app/app/core/shared/presentation/message_to_failure_converter/failure_to_message_converter_factory.dart';
import 'package:pokedex_app/app/core/shared/presentation/success_converter_data.dart';
import 'package:pokedex_app/app/core/shared/presentation/ui_state.dart';
import 'package:pokedex_app/app/features/home/domain/entities/pokemon_entity.dart';
import 'package:pokedex_app/app/features/home/domain/useCases/get_list_assets_use_case.dart';

class HomeController extends GetxController {
  // --- USECASES --- //
  final GetListPokemonsUseCase _getListPokemonsUseCase;
  HomeController(
    this._getListPokemonsUseCase,
  );

  // -- ATRIBUTES --- //
  final RxList<PokemonEntity> _listPokemons = <PokemonEntity>[].obs;
  RxList<PokemonEntity> get listPokemons => _listPokemons;

  final Rx<UiState> _uiState = Rx<UiState>(Initial());
  UiState get uiState => _uiState.value;

  // -- ACTIONS --- //
  Future<void> loadingListPokemons() async {
    _uiState.value = Loading();
    final result = await _getListPokemonsUseCase(NoParams());

    _uiState.value = result.fold(
      (failure) {
        final converter = FailureToMessageConverterFactory(failure).call();
        return ErrorState(converter: converter);
      },
      (List<PokemonEntity> successValue) => Success(successValue),
    );

    if (uiState is Success<List<PokemonEntity>>) {
      _listPokemons.value = SuccessConverterData<List<PokemonEntity>>()
          .call(_uiState.value as Success<List<PokemonEntity>>);
    }
  }
}
