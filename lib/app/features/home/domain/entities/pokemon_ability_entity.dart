import 'package:equatable/equatable.dart';

class PokemonAbilityEntity extends Equatable {
  final String name;
  final int? id;
  const PokemonAbilityEntity({
    required this.name,
    required this.id,
  });

  @override
  List<Object?> get props => [name, id];
}
