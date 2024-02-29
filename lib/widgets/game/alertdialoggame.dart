// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../inicio/inicioview.dart';

// Widget que utilizamos para crear la alerta que meustra al pulsar el boton eniar resultados
class AlertDialogGame extends StatelessWidget {
  AlertDialogGame(
      {super.key,
      required this.descuento,
      required this.nombre,
      required this.puntos});

  String nombre = '';
  int puntos = 0;
  String descuento = '';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Recompensa'),
      content: Text('Ganaste un cupón: $descuento'),
      actions: [
        // Boton aceptar
        MaterialButton(
          onPressed: () async {
            // Al pulsar obtiene los datos del juego obtenidos y los envia a la base de datos
            await insertarDatos(descuento, puntos, nombre);

            // Y nos lleva de nuevo a la pantalla principal
            // ignore: use_build_context_synchronously
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const PantallaInicio()),
            );
          },
          child: const Text('Aceptar'),
        ),
        // Boton cancelar
        MaterialButton(
          onPressed: () {
            // Nos lleva de vuelta a la vista del juego sin modificar nada
            Navigator.pop(context);
          },
          child: const Text('Cancelar'),
        ),
      ],
    );
  }
}

// Método que realiza un insert sobre la base de datos
Future<void> insertarDatos(String descuento, int puntos, String nombre) async {
  await FirebaseFirestore.instance.collection('clasificacion').doc(nombre).set({
    'nombre': nombre,
    'puntos': puntos.toString(),
    'descuento': descuento,
  });
}
