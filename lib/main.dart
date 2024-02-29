import 'package:finalflutter/widgets/inicio/inicioview.dart'; // Importamos el widget PantallaInicio
import 'package:firebase_core/firebase_core.dart'; // Importamos Firebase Core
import 'package:flutter/material.dart';
import 'firebase_options.dart'; // Importamos las opciones de Firebase

// Main que ejecuta la aplicacion
void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Inicializamos el binding de Flutter
  await Firebase.initializeApp( // Inicializamos Firebase
    options: DefaultFirebaseOptions.android, // Opciones de Firebase para Android
  );
  runApp(const MyApp()); // Ejecutamos la aplicación
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}); // Constructor del widget

  // Widget que lanza la app ,contiene el widget de la pantalla de inicio
  @override
  Widget build(BuildContext context) {
    return const MaterialApp( // Devolvemos un MaterialApp
      title: 'Amazon', // Título de la aplicación
      home: PantallaInicio(), // Widget de la primera vista de la app
    );
  }
}
