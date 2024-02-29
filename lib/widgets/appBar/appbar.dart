import 'package:flutter/material.dart';

import '../api/productoscard.dart'; // Importamos el widget ProductoCard
import '../game/game.dart'; // Importamos el widget GameWidget
import '../inicio/inicioview.dart'; // Importamos el widget PantallaInicio
import 'utilsappbar.dart'; // Importamos el widget IconAppBar y IconOnTap

// Widget que utilizamos para navegar entre la diferente vista de la aplicacion
class MyAppBar extends StatefulWidget {
  const MyAppBar({super.key}); // Constructor del widget

  @override
  State<MyAppBar> createState() => _AppBarState(); // Método para crear el estado del widget
}

class _AppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 38, 21, 100),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 13,
          ),
        ],
      ),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Icono home nos lleva a la vista principal de la aplicacion
          IconOnTap(
            widget: const PantallaInicio(),
            widgeticon: IconAppBar(
              icon: Icons.home,
              texto: 'Inicio',
            ),
          ),
          // Icono shop nos lleva a la vista donde se encuentra el catalogo de productos de la aplicacion
          IconOnTap(
            widget: const ProductoCard(),
            widgeticon: IconAppBar(
              icon: Icons.shopping_basket,
              texto: 'Tienda',
            ),
          ),
          // Icono game que nos lleva al jeugo de las ofertas
          IconOnTap(
            widget: const GameWidget(),
            widgeticon: IconAppBar(
              icon: Icons.sports_esports,
              texto: 'Juegos',
            ),
          ),
        ],
      ),
    );
  }
}
