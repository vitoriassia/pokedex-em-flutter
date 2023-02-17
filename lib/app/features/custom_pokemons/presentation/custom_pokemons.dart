import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:pokedex_app/app/core/design/res/app_colors.dart';
import 'package:pokedex_app/app/features/custom_pokemons/presentation/widgets/add_custom_pokemon/add_custom_pokemon_widget.dart';

class CustomPokemons extends StatelessWidget {
  const CustomPokemons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(
          const AddCustomPokemonWidget(),
        ),
        backgroundColor: AppColors.redPokedexColor,
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
