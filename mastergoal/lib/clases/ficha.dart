import 'package:flutter/material.dart';

class MiFicha extends StatelessWidget {
  //Jugador 1, Jugador 2, Pelota, x(vacio), o(posibles movimientos)
  final String ficha;

  //Si esta ficha esta seleccionada o no
  final String estaSeleccionada;

  //Funcion para cuando se toque
  final onTap;

  final int indice;

  const MiFicha(
      {required this.ficha,
      //required this.hacerJugada,
      required this.estaSeleccionada,
      required this.indice,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    //Si ficha es 'd' entonces es una casilla disponible para moverse; Si ficha es 'mb' entonces es
    //una casilla disponible para que la pelota se mueva
    if (ficha == 'd' || ficha == 'mb') {
      return GestureDetector(
          onTap: onTap,
          child: Container(
            color: Colors.white70,
          ));
    }

    //Si ficha es 'arco' solo devuelve un contenedor vacio
    else if (ficha == 'arco') {
      return Container();
    }

    //Si ficha es diferente a 'x' significa que hay un jugador en esa casilla
    else if (ficha != 'x') {
      return GestureDetector(
          onTap: onTap,
          child: Container(
            color: estaSeleccionada == 'seleccionado'
                ? Colors.cyan[200]
                : Colors.transparent,
            //padding: const EdgeInsets.all(1),
            child: Image.asset('assets/$ficha.png'),
          ));
    }

    //Si ficha = 'x' retornamos un contenedor vacio
    return Container(
      decoration: decoracion(),
    );
  }

  BoxDecoration decoracion() {
    //Solamente lado izquierdo
    if (indice == 12 ||
        indice == 13 ||
        indice == 23 ||
        indice == 34 ||
        indice == 122 ||
        indice == 133 ||
        indice == 144 ||
        indice == 145) {
      return const BoxDecoration(
          border: Border(left: BorderSide(color: Colors.white, width: 2)));
    }
    //Solamente lado derecho
    if (indice == 19 ||
        indice == 20 ||
        indice == 31 ||
        indice == 42 ||
        indice == 130 ||
        indice == 141 ||
        indice == 151 ||
        indice == 152) {
      return const BoxDecoration(
          border: Border(right: BorderSide(color: Colors.white, width: 2)));
    }
    //Solamente esquina inferior izquierda
    else if (indice == 45 || indice == 24) {
      return const BoxDecoration(
          border: Border(
              left: BorderSide(color: Colors.white, width: 2),
              bottom: BorderSide(color: Colors.white, width: 2)));
    }
    //Solamente esquina inferior derecha
    else if (indice == 30 || indice == 53) {
      return const BoxDecoration(
          border: Border(
              right: BorderSide(color: Colors.white, width: 2),
              bottom: BorderSide(color: Colors.white, width: 2)));
    }
    //Solamente esquina superior Izquierda
    else if (indice == 111 || indice == 134) {
      return const BoxDecoration(
          border: Border(
              left: BorderSide(color: Colors.white, width: 2),
              top: BorderSide(color: Colors.white, width: 2)));
    }
    //Solamente esquina superior derecha
    else if (indice == 119 || indice == 140) {
      return const BoxDecoration(
          border: Border(
              right: BorderSide(color: Colors.white, width: 2),
              top: BorderSide(color: Colors.white, width: 2)));
    }
    //Solmanete lado inferior
    else if ((24 < indice && indice < 30) || (45 < indice && indice < 53)) {
      return const BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.white, width: 2)));
    }
    //Solamente lado superior
    else if ((111 < indice && indice < 119) || (134 < indice && indice < 140)) {
      return const BoxDecoration(
          border: Border(top: BorderSide(color: Colors.white, width: 2)));
    } else {
      return const BoxDecoration();
    }
  }
}
