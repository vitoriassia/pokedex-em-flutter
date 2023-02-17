import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex_app/app/core/binds/binds_helper.dart';
import 'package:pokedex_app/app/core/shared/presentation/ui_state.dart';
import 'package:pokedex_app/app/features/home/presentation/controllers/home_controller.dart';
import 'package:pokedex_app/app/features/home/presentation/widgets/home_scaffold.dart';
import 'package:pokedex_app/app/features/home/presentation/widgets/list_pokemons.dart';
import 'package:pokedex_app/app/features/home/presentation/widgets/progress_indicator_pokedex.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController _controller = BindsHelper.get<HomeController>();
  @override
  void initState() {
    _controller.loadingListPokemons(page: 1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return HomeScaffold(
      body: GetX<HomeController>(
        init: _controller,
        builder: (controller) {
          if (controller.uiState is Loading) {
            return const ProgressIndicatorPokedex();
          }

          if (controller.uiState is ErrorState) {
            final state = controller.uiState as ErrorState;
            return Center(
              child: Text(state.message),
            );
          }

          return ListPokemons(
            homeController: _controller,
          );
        },
      ),
    );
  }
}
