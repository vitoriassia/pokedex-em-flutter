import 'package:pokedex_app/app/features/home/domain/entities/pokemon_type_entity.dart';

class PokemonTypeModel extends PokemonTypeEntity {
  const PokemonTypeModel({
    required super.name,
    required super.id,
  });

  factory PokemonTypeModel.fromJson(Map<String, dynamic> json) =>
      PokemonTypeModel(name: json['name'], id: 0);
}
