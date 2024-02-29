import 'package:finalflutter/widgets/drawer/utilsdrawer.dart';
import 'package:flutter/material.dart';

import '../api/electronics.dart';
import '../api/jewelery.dart';
import '../api/menclothing.dart';
import '../api/productoscard.dart';
import '../api/womenclothing.dart';

// Esta clase contiene el drawer navegable de la vista shop

// Widget que contiene el drawer
class DrawerInicio extends StatelessWidget {
  const DrawerInicio({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 180,
      child: ListView(
        children: <Widget>[
          // Cabezera del drawer contiene una imagen
          const DrawerHeader(
            child: Image(
              fit: BoxFit.cover,
              image: NetworkImage(
                  'https://img.icons8.com/color/480/amazon.png'),
            ),
          ),
          // Widget de texto expandible muestra todas las opciones sobre productos
          ExpansionTile(
            title: const Text("Productos"),
            children: <Widget>[
              // Item que muestra  todos los productos del catalogo
              Ink(
                width: 250,
                child: MenuItemDrawer(
                  texto: 'Todos los productos',
                  page: const ProductoCard(),
                ),
              ),
              // Widget de texto expandible anidado que muestra todas las categorias
              ExpansionTile(
                title: const Text('Categoría'),
                children: [
                  // Item que muestra todos los productos de la categoria jewelery
                  Ink(
                    width: 250,
                    child: MenuItemDrawer(
                      texto: 'Joyería',
                      page: const JeweleryCard(),
                    ),
                  ),
                  // Item que muestra todos los productos de la categoria electronics
                  Ink(
                    width: 250,
                    child: MenuItemDrawer(
                      texto: 'Electrónica',
                      page: const ElectronicCard(),
                    ),
                  ),
                  // Item que muestra todos los productos de la categoria men s clothing
                  Ink(
                    width: 250,
                    child: MenuItemDrawer(
                        texto: 'Ropa Hombre',
                        page: const MenClothingCard()),
                  ),
                  // Item que muestra todos los productos de la categoria women s clothing
                  Ink(
                    width: 250,
                    child: MenuItemDrawer(
                      texto: 'Ropa Mujer',
                      page: const WomenClothingCard(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
