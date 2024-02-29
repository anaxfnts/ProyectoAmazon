// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Esta clase contiene algunos widget que utilizamos en la clase appbar y appbargame

// Widget que muestra un icono y un texto que pasamos como parametro
class IconAppBar extends StatelessWidget {
  IconAppBar({Key? key, required this.icon, required this.texto}); // Constructor del widget
  final IconData icon; // Icono a mostrar
  late String texto; // Texto a mostrar
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Icon(
          icon,
          size: 40,
          color: Colors.white,
        ),
        Container(
          margin: const EdgeInsets.only(
              bottom: 10), // Añade margen inferior de 10 puntos
          child: Text(
            texto,
            style: GoogleFonts.lexend(color: Colors.white, fontSize: 20),
          ),
        ),
      ],
    );
  }
}

//  Widget que aplica la logica a cada icono que pulsamos
//  en esta caso nos redirige a la vista que pasamos por parametro
class IconOnTap extends StatelessWidget {
  IconOnTap({Key? key, required this.widget, required this.widgeticon}); // Constructor del widget
  Widget widgeticon; // Widget que contiene el icono y el texto
  Widget widget; // Widget de la vista a la que se redirige
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: widgeticon,
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => widget,
            ));
      },
    );
  }
}
