import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:pokedex_app/app/features/home/domain/entities/pokemon_type_entity.dart';

class CustomPokemonEntity extends Equatable {
  final String? name;
  final String? imagePath;
  final int id;
  final List<PokemonTypeEntity> types;
  const CustomPokemonEntity({
    required this.name,
    required this.id,
    required this.imagePath,
    required this.types,
  });

  Color get color => types.isNotEmpty ? types.first.color : Colors.grey;

  String get number => id < 10
      ? '#00$id'
      : id < 100
          ? '#0$id'
          : '#$id';

  @override
  List<Object?> get props => [
        name,
        imagePath,
        id,
        types,
      ];

  CustomPokemonEntity copyWith({
    String? name,
    String? imagePath,
    int? id,
    List<PokemonTypeEntity>? types,
  }) {
    return CustomPokemonEntity(
      name: name ?? this.name,
      imagePath: imagePath ?? this.imagePath,
      id: id ?? this.id,
      types: types ?? this.types,
    );
  }
}
