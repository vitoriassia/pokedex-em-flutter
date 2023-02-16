import 'package:flutter/material.dart';
import 'package:pokedex_app/app/features/home/domain/entities/pokemon_type_entity.dart';

class PokemonTypeWidget extends StatelessWidget {
  final double width;
  const PokemonTypeWidget(
    this.type, {
    Key? key,
    this.width = 30,
  }) : super(key: key);

  final PokemonTypeEntity type;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/${type.name}.png',
      width: width,
    );
  }
}
