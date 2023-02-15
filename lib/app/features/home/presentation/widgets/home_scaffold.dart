import 'package:flutter/material.dart';
import 'package:pokedex_app/app/core/design/images/app_images.dart';

class HomeScaffold extends StatelessWidget {
  final Widget body;
  const HomeScaffold({Key? key, required this.body})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Pokedex',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image(
            image: AppImages.pokeball,
            color: Colors.grey.withOpacity(0.2),
          ),
          SafeArea(
            child: body,
          )
        ],
      ),
    );
  }
}
