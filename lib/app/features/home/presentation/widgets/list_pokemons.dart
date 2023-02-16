import 'package:flutter/material.dart';
import 'package:pokedex_app/app/features/home/domain/entities/pokemon_entity.dart';
import 'package:pokedex_app/app/features/home/presentation/widgets/pokemon_card/pokemon_card.dart';
import 'package:pokedex_app/app/features/pokemon_detail/pokemon_detail_card.dart';
import 'package:pokedex_app/app/shared/presentation/show_dialog_with_scale_animation.dart';

class ListPokemons extends StatelessWidget {
  final List<PokemonEntity> _listPokemons;
  const ListPokemons(
    this._listPokemons, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.all(28),
          sliver: SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.4,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            delegate: SliverChildBuilderDelegate(
              (_, index) {
                return PokemonCard(
                  _listPokemons[index],
                  onPress: () => {
                    showDialogWithScaleAnimation(
                        child: PokemonDetailCard(
                          pokemonEntity: _listPokemons[index],
                        ),
                        context: context)
                  },
                );
              },
              childCount: _listPokemons.length,
            ),
          ),
        ),
      ],
    );
  }
}
