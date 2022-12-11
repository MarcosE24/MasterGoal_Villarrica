import 'package:flutter/material.dart';
import 'package:mastergoal/pages/creditos_page.dart';
import 'package:mastergoal/pages/game_page.dart';
import 'package:mastergoal/pages/home_page.dart';
import 'package:mastergoal/pages/login_page.dart';
import 'package:mastergoal/pages/tutorial_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

//funcion para crear las rutas de las pagina [mauro]
  final _routes = {
    '/': (context) => const LoginPage(),
    '/home': (context) => const HomePage(),
    '/game': (context) => const GamePage(),
    '/tutorial': (context) => const TutorialPage(),
    '/creditos': (context) => const CreditosPage(),
  };

  // El widged main de la app
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: _routes,
    );
  }
}
