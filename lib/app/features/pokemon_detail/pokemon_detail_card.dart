import 'package:flutter/material.dart';
import 'package:pokedex_app/app/core/design/res/dimen.dart';
import 'package:pokedex_app/app/features/home/domain/entities/pokemon_entity.dart';
import 'package:pokedex_app/app/features/home/presentation/widgets/pokemon_card/pokemon_image.dart';
import 'package:pokedex_app/app/shared/presentation/app_dialog.dart';
import 'package:pokedex_app/app/shared/presentation/app_dialog/semi_background.dart';

class PokemonDetailCard extends StatelessWidget {
  final PokemonEntity pokemonEntity;
  const PokemonDetailCard({Key? key, required this.pokemonEntity})
      : super(key: key);

  static const double _pokemonFraction = 0.76;

  @override
  Widget build(BuildContext context) {
    final heightCard = MediaQuery.of(context).size.height * 0.40;
    return AppDialog(
      color: Colors.white,
      height: heightCard,
      child: Stack(
        children: [
          SemiBackground(
            height: heightCard,
            color: pokemonEntity.color.withOpacity(0.7),
          ),
          _buildPokemon(height: heightCard),
          _shadow()
        ],
      ),
    );
  }

  Widget _buildPokemon({required double height}) {
    final pokemonSize = height * PokedexDimen.pokemonFraction;

    return Positioned(
      bottom: -2,
      right: 2,
      child: PokemonImage(
        size: Size.square(pokemonSize),
        pokemon: pokemonEntity,
      ),
    );
  }

  Widget _shadow() {
    return Positioned(
      bottom: 8,
      left: 165,
      child: Container(
        height: 17,
        width: 160,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: const <BoxShadow>[
            BoxShadow(
                color: Colors.black54,
                blurRadius: 20.0,
                offset: Offset(0.0, 0.75))
          ],
        ),
      ),
    );
  }
}
