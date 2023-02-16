import 'package:flutter/material.dart';
import 'package:pokedex_app/app/features/home/domain/entities/pokemon_ability_entity.dart';
import 'package:pokedex_app/app/features/home/domain/entities/pokemon_entity.dart';
import 'package:pokedex_app/app/features/home/domain/entities/pokemon_type_entity.dart';
import 'package:pokedex_app/app/features/home/presentation/widgets/home_scaffold.dart';
import 'package:pokedex_app/app/features/home/presentation/widgets/pokemon_card/pokemon_card.dart';
import 'package:pokedex_app/app/features/pokemon_detail/pokemon_detail_card.dart';
import 'package:pokedex_app/app/shared/presentation/show_dialog_with_scale_animation.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  PokemonEntity get _example => const PokemonEntity(
        name: 'Bulbassauro',
        number: '#001',
        id: 1,
        types: [
          PokemonTypeEntity(name: 'grass', id: 01),
          PokemonTypeEntity(name: 'bug', id: 02),
          PokemonTypeEntity(name: 'fire', id: 03),
        ],
        abilities: [
          PokemonAbilityEntity(name: 'grow', id: 12),
          PokemonAbilityEntity(name: 'grow', id: 12),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return HomeScaffold(
      body: _buildGrid(),
    );
  }

  Widget _buildGrid() {
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
                  _example,
                  onPress: () => {
                    showDialogWithScaleAnimation(
                        child: PokemonDetailCard(
                          pokemonEntity: _example,
                        ),
                        context: context)
                  },
                );
              },
              childCount: 5,
            ),
          ),
        ),
      ],
    );
  }
}
