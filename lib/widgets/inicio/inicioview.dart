import 'package:animated_background/animated_background.dart'; // Importamos el paquete de fondo animado
import 'package:google_fonts/google_fonts.dart'; // Importamos Google Fonts
import 'package:flutter/material.dart'; // Importamos el paquete de Flutter

import '../appBar/appbar.dart'; // Importamos el widget de la barra de navegación personalizada

// Widget que contiene la vista principal de la aplicacion
class PantallaInicio extends StatefulWidget {
  const PantallaInicio({Key? key}); // Constructor del widget

  @override
  State<PantallaInicio> createState() => _PantallaInicioState(); // Creamos el estado del widget
}

class _PantallaInicioState extends State<PantallaInicio>
    with TickerProviderStateMixin { // Clase de estado que proporciona un objeto de animación

  // Opciones de las imagenes en movimiento que se muestra en el inicio
  ParticleOptions particleOptions = const ParticleOptions(
    baseColor: Color.fromARGB(255, 253, 204, 69),
    maxOpacity: 0.8,
    spawnMinSpeed: 30.0,
    spawnMaxSpeed: 70.0,
    spawnMinRadius: 7.0,
    spawnMaxRadius: 15.0,
    particleCount: 20,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold( // Devolvemos un Scaffold
      // AppBar personalizado que permite navegar por la app
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: MyAppBar(), // Widget de la barra de navegación personalizada
      ),
      // Fondo animado con icono de la empresa
      body: AnimatedBackground( // Fondo animado
        vsync: this,
        behaviour: RandomParticleBehaviour(
          options: particleOptions,
        ),
        child: ListView( // Lista de widgets
          children: [
            // GIF que se muestra en el incio de la aplicacion
            Padding(
              padding: const EdgeInsets.all(20),
              child: Image.network(
                'https://i.pinimg.com/originals/dc/2e/38/dc2e38cc3a2824d16cbeceeafed9c979.gif',
                width: 0,
              ),
            ),
            // Texto de presentacion de la vista shop de la aplicacion
            Padding(
              padding: const EdgeInsets.all(12),
              child: TextoInicio(
                icono: Icons.shopping_basket,
                textoIcono: 'Amazon',
                texto:
                    'Amazon consta de un gran catálogo de artículos en el que encontrarás todo tipo de productos para cualquier tipo de necesidad.',
              ),
            ),
            // Texto explicativo de la vista game  de la aplicacion
            Padding(
              padding: const EdgeInsets.all(12),
              child: TextoInicio(
                  icono: Icons.sports_esports,
                  textoIcono: 'Juegos',
                  texto:
                      'Gracias a los juegos de Amazon, puedes obtener cupones de descuentos para tus próximas compras.'),
            ),
          ],
        ),
      ),
    );
  }
}

// Widget quye utilizamos para crear los texto explicativos que se muestra en la vista de inicio
// ignore: must_be_immutable
class TextoInicio extends StatelessWidget {
  TextoInicio(
      {Key? key,
      required this.icono,
      required this.textoIcono,
      required this.texto}); // Constructor del widget
  late IconData icono;
  late String textoIcono;
  late String texto;

  @override
  Widget build(BuildContext context) {
    return ListTile( // Devolvemos un ListTile
      title: Row( // Fila de widgets
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icono,
            size: 40,
            color: Colors.black,
          ),
          Text(textoIcono, style: GoogleFonts.lexend(fontSize: 20)), // Texto con Google Fonts
        ],
      ),
      subtitle: Text(texto, style: GoogleFonts.lexend(fontSize: 20)), // Texto con Google Fonts
    );
  }
}
