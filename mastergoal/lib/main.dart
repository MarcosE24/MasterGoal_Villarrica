import 'package:flutter/material.dart';
import 'package:mastergoal/pages/creditos_page.dart';
import 'package:mastergoal/pages/game_page.dart';
import 'package:mastergoal/pages/home_page.dart';
import 'package:mastergoal/pages/login_page.dart';
import 'package:mastergoal/pages/timer_page.dart';
import 'package:mastergoal/pages/tutorial_page.dart';
import 'package:mastergoal/pages/tutorial_page_2.dart';
import 'package:mastergoal/pages/tutorial_page_3.dart';
import 'package:mastergoal/pages/tutorial_page_4.dart';
import 'package:mastergoal/pages/tutorial_page_5.dart';
import 'package:mastergoal/pages/tutorial_page_6.dart';
import 'package:mastergoal/pages/tutorial_page_7.dart';
import 'package:mastergoal/pages/tutorial_page_8.dart';
import 'package:mastergoal/pages/tutorial_page_9.dart';
import 'package:mastergoal/pages/tutorial_page_10.dart';
import 'package:mastergoal/pages/preconf_page.dart';

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
    '/tutorial2': (context) => const TutorialPage2(),
    '/tutorial3': (context) => const TutorialPage3(),
    '/tutorial4': (context) => const TutorialPage4(),
    '/tutorial5': (context) => const TutorialPage5(),
    '/tutorial6': (context) => const TutorialPage6(),
    '/tutorial7': (context) => const TutorialPage7(),
    '/tutorial8': (context) => const TutorialPage8(),
    '/tutorial9': (context) => const TutorialPage9(),
    '/tutorial10': (context) => const TutorialPage10(),
    '/preconf': (context) => const PreConf(),
    '/timer': (context) => const TimerPage(),
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
