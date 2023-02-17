import 'package:flutter/material.dart';
import 'package:pokedex_app/app/core/design/res/app_colors.dart';

class CustomPokemons extends StatelessWidget {
  const CustomPokemons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColors.redPokedexColor,
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
