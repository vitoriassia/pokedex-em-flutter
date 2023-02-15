import 'package:flutter/material.dart';
import 'package:pokedex_app/app/features/home/domain/entities/pokemon_entity.dart';
import 'package:pokedex_app/app/features/home/domain/entities/pokemon_type_entity.dart';
import 'package:pokedex_app/app/features/home/presentation/widgets/home_scaffold.dart';
import 'package:pokedex_app/app/features/home/presentation/widgets/pokemon_card/pokemon_card.dart';

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

  PokemonEntity get _example =>
      const PokemonEntity(name: 'Bulbassauro', number: '#001', id: 1, types: [
        PokemonTypeEntity(name: 'grass', id: 01),
        PokemonTypeEntity(name: 'bug', id: 02),
        PokemonTypeEntity(name: 'fire', id: 03),
      ]);

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
                  onPress: () => {},
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
