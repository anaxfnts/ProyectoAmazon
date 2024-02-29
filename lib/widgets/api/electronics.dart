import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../../models/producto.dart'; // Importamos el modelo Producto
import '../card/listacardapi.dart'; // Importamos el widget MostrarCartas
import '../inicio/inicioview.dart'; // Importamos el widget PantallaInicio

// Widget que consulta a la api los resultado de la categoria electronics y la muestra en cards
class ElectronicCard extends StatefulWidget {
  const ElectronicCard({super.key}); // Constructor del widget

  @override
  State<ElectronicCard> createState() => _MyWidgetState(); // Método para crear el estado del widget
}

class _MyWidgetState extends State<ElectronicCard> {
  List<Producto> producto = []; // Lista para almacenar los productos obtenidos de la API

  // Consultamos a la api los resultado de la categoria electronics y lo almcenamos en una lista que devolvemos llena
  Future<List<Producto>> cogerDatos() async {
    final respuesta = await http.get(
      Uri.parse('https://fakestoreapi.com/products/category/electronics'),
    );

    var datos = jsonDecode(respuesta.body); // Convertimos la respuesta en un objeto JSON
    if (respuesta.statusCode == 200) { // Si la respuesta es exitosa
      setState(() { // Actualizamos el estado para reflejar los cambios
        for (var item in datos) { // Iteramos sobre los datos obtenidos
          // Creamos objetos productos con los resultado de json que devuelve la api y lo añadimos a la lista
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
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          title: const Text('Electrónica', style: TextStyle(color: Colors.white)),
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
                    ));
              },
            ),
          ],
        ),
      ),
      // Mostramos el contenido de la lista en cartas
      body: MostrarCartas(lista: producto),
    );
  }
}
