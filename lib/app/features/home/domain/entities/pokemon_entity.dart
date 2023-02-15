import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_app/app/features/home/domain/entities/pokemon_type_entity.dart';

class PokemonEntity extends Equatable {
  final String name;
  final String number;
  final int id;
  final List<PokemonTypeEntity> types;
  const PokemonEntity({
    required this.name,
    required this.number,
    required this.id,
    required this.types,
  });

  Color get color => types.first.color;

  @override
  List<Object> get props => [
        name,
        number,
      ];
}
