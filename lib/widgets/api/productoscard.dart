import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../../models/producto.dart'; // Importamos el modelo Producto
import '../card/listacardapi.dart'; // Importamos el widget MostrarCartas
import '../drawer/drawer.dart'; // Importamos el widget DrawerInicio
import '../inicio/inicioview.dart'; // Importamos el widget PantallaInicio

// Widget que muestra todo los producto obtenidos de la api en cards
class ProductoCard extends StatefulWidget {
  const ProductoCard({Key? key}) : super(key: key); // Constructor del widget

  @override
  State<ProductoCard> createState() => _MyWidgetState(); // Método para crear el estado del widget
}

class _MyWidgetState extends State<ProductoCard> {
  List<Producto> producto = []; // Lista para almacenar los productos obtenidos de la API

  // Consulta todo los productos de la api
  Future<List<Producto>> cogerDatos() async {
    final respuesta = await http.get(
      Uri.parse('https://fakestoreapi.com/products'),
    );

    var datos = jsonDecode(respuesta.body); // Convertimos la respuesta en un objeto JSON

    if (respuesta.statusCode == 200) { // Si la respuesta es exitosa
      setState(() { // Actualizamos el estado para reflejar los cambios
        // Creamos objetos productos con los resultado de json que devuelve la api y lo añadimos a la lista
        for (var item in datos) {
          producto.add(
            Producto(item["id"], item["title"], item["price"],
                item["description"], item["category"], item["image"]),
          );
        }
      });
    }
    return producto; // Devolvemos la lista de productos
  }

  // Metodo que se ejecuta al incializar la vista
  @override
  void initState() {
    super.initState();
    // Ejecuta la consulta y almacena los datos en la lista de productos
    cogerDatos().then((value) => producto);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerInicio(), // Agregamos el drawer
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          title: const Text('Todos los productos', style: TextStyle(color: Colors.white)),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 38, 21, 100),
          actions: [
            // Icono home que utilizamos para volver a la pantalla de incio desde la vista shop
            GestureDetector(
              child: const Icon(
                Icons.home,
                size: 45,
                color: Colors.white,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PantallaInicio(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      // Mostramos el contenido de la lista en cards
      body: MostrarCartas(lista: producto),
    );
  }
}
