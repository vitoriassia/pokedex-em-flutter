import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex_app/app/core/binds/binds_helper.dart';
import 'package:pokedex_app/app/core/design/res/app_colors.dart';
import 'package:pokedex_app/app/core/design/res/dimen.dart';
import 'package:pokedex_app/app/core/design/styles/text_style.dart';
import 'package:pokedex_app/app/features/custom_pokemons/presentation/controllers/custom_pokemons_controller.dart';
import 'package:pokedex_app/app/features/custom_pokemons/presentation/widgets/add_custom_pokemon/widgets/card_button.dart';
import 'package:pokedex_app/app/features/custom_pokemons/presentation/widgets/add_custom_pokemon/widgets/preview_custom_pokemon.dart';
import 'package:pokedex_app/app/features/custom_pokemons/presentation/widgets/add_custom_pokemon/widgets/select_types_pokemon.dart';
import 'package:pokedex_app/app/shared/presentation/show_dialog_with_scale_animation.dart';
import 'package:pokedex_app/app/shared/presentation/stadium_button.dart';
import 'package:pokedex_app/app/shared/presentation/text_form_field_with_label.dart';

class AddCustomPokemonWidget extends StatefulWidget {
  const AddCustomPokemonWidget({Key? key}) : super(key: key);

  @override
  State<AddCustomPokemonWidget> createState() => _AddCustomPokemonWidgetState();
}

class _AddCustomPokemonWidgetState extends State<AddCustomPokemonWidget> {
  final CustomPokemonsController _controller =
      BindsHelper.get<CustomPokemonsController>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Custom Pokemon",
          style: PokedexTextStyle.headlineWhite,
        ),
        backgroundColor: AppColors.redPokedexColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Obx(
              () => PreviewPokemonCard(
                pokemonEntity: _controller.customPokemon.value,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormFieldWithLabel(
                label: 'Name:',
                onChanged: _controller.setName,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Obx(
                  () => CardButton(
                    icon: _controller.customPokemon.value.imagePath != null
                        ? Icons.photo
                        : Icons.add_photo_alternate,
                    description:
                        _controller.customPokemon.value.imagePath != null
                            ? 'Edit image'
                            : 'Add image',
                    onTap: _controller.getPokemonPhoto,
                  ),
                ),
                Obx(
                  () => CardButton(
                    icon: Icons.format_list_bulleted_add,
                    description:
                        _controller.customPokemon.value.types.isNotEmpty
                            ? 'Edit type'
                            : 'Add type',
                    onTap: () async {
                      await showDialogWithScaleAnimation(
                        child: SelectTypesPokemon(
                          onSave: _controller.setPokemonType,
                          preSelectList: _controller.customPokemon.value.types,
                        ),
                        context: context,
                      );
                      WidgetsBinding.instance.focusManager.primaryFocus
                          ?.unfocus();
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(PokedexDimen.medium),
              child: StadiumButton(
                onPressed: () {},
                label: 'Save',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
