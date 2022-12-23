import 'package:flutter/material.dart';

class MiFicha extends StatelessWidget {
  //Jugador 1, Jugador 2, Pelota, x(vacio), o(posibles movimientos)
  final String ficha;

  //Posible toque de la pelota
  //final String hacerJugada;

  //Si esta ficha esta seleccionada o no
  final String estaSeleccionada;

  //Funcion para cuando se toque
  final onTap;

  const MiFicha(
      {required this.ficha,
      //required this.hacerJugada,
      required this.estaSeleccionada,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    if (ficha == 'd') {
      return GestureDetector(
          onTap: onTap,
          child: Container(
            color: Colors.white70,
          ));
    }
    //Si ficha es diferente a 'x' significa que hay un jugador en esa casilla
    else if (ficha != 'x') {
      return GestureDetector(
          onTap: onTap,
          child: Container(
            color: estaSeleccionada == 'seleccionado'
                ? Colors.cyan[200]
                : Colors.transparent,
            padding: const EdgeInsets.all(1),
            child: Image.asset('assets/$ficha.png'),
          ));
    }
    //posible movimiento de pelota
    // if (hacerJugada == 'j') {
    //   return GestureDetector
    //   (
    //     onTap: onTap,
    //   );
    // }

    //Si ficha = 'x' retornamos un contenedor vacio
    return Container();
  }
}
