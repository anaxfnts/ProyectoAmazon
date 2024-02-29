import 'package:finalflutter/widgets/card/utiliswidgets.dart'; // Importamos los widgets de las tarjetas
import 'package:flutter/material.dart'; // Importamos el paquete de Flutter
import '../../models/producto.dart'; // Importamos el modelo de Producto

// Widget que muestra una lista de tarjetas de productos
// ignore: must_be_immutable
class MostrarCartas extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  MostrarCartas({Key? key, required this.lista}); // Constructor del widget
  late List<Producto> lista; // Lista de productos

  @override
  Widget build(BuildContext context) {
    return ListView.builder( // Devolvemos un ListView.builder
        itemCount: lista.length, // Número de elementos en la lista
        itemBuilder: (context, index) {
          // ignore: avoid_unnecessary_containers
          return Container( // Devolvemos un Container
            child: Card( // Devolvemos una Card
              shape: RoundedRectangleBorder( // Forma de la tarjeta
                side: const BorderSide( // Borde de la tarjeta
                  width: 3,
                  color: Color.fromARGB(255, 38, 21, 100),
                ),
                borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
              ),
              margin: const EdgeInsets.all(15), // Margen de la tarjeta
              child: ClipRRect( // Devolvemos un ClipRRect
                child: Column( // Devolvemos una Columna
                  children: <Widget>[ // Lista de widgets
                    EncabezadoCard( // Widget de encabezado de la tarjeta
                        titulo: lista[index].categoria.toUpperCase(), // Título de la tarjeta
                        subtitulo: lista[index].titulo), // Subtítulo de la tarjeta
                    ImagenCard(imagen: lista[index].imagen), // Widget de imagen de la tarjeta
                    PrecioCard(precio: lista[index].precio), // Widget de precio de la tarjeta
                    PieCard( // Widget de pie de la tarjeta
                      titulo: 'Descripción', // Título del pie de la tarjeta
                      subtitulo: lista[index].descripcion, // Subtítulo del pie de la tarjeta
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
