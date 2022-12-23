import 'package:flutter/material.dart';
import 'package:mastergoal/clases/ficha.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  int posicionBalon = 71;
  int indiceFichaActualSeleccionada = 1;
  String fichaActualSeleccionada = '';
  bool estaFichaEstaMarcada = false;

  //Para pintar los cuadros verdes mas claros
  List<int> cuadrosVerde = [
    0,
    2,
    4,
    6,
    8,
    10,
    12,
    14,
    16,
    18,
    20,
    0 + 22,
    2 + 22,
    4 + 22,
    6 + 22,
    8 + 22,
    10 + 22,
    12 + 22,
    14 + 22,
    16 + 22,
    18 + 22,
    20 + 22,
    0 + (22 * 2),
    2 + (22 * 2),
    4 + (22 * 2),
    6 + (22 * 2),
    8 + (22 * 2),
    10 + (22 * 2),
    12 + (22 * 2),
    14 + (22 * 2),
    16 + (22 * 2),
    18 + (22 * 2),
    20 + (22 * 2),
    0 + (22 * 3),
    2 + (22 * 3),
    4 + (22 * 3),
    6 + (22 * 3),
    8 + (22 * 3),
    10 + (22 * 3),
    12 + (22 * 3),
    14 + (22 * 3),
    16 + (22 * 3),
    18 + (22 * 3),
    20 + (22 * 3),
    0 + (22 * 4),
    2 + (22 * 4),
    4 + (22 * 4),
    6 + (22 * 4),
    8 + (22 * 4),
    10 + (22 * 4),
    12 + (22 * 4),
    14 + (22 * 4),
    16 + (22 * 4),
    18 + (22 * 4),
    20 + (22 * 4),
    0 + (22 * 5),
    2 + (22 * 5),
    4 + (22 * 5),
    6 + (22 * 5),
    8 + (22 * 5),
    10 + (22 * 5),
    12 + (22 * 5),
    14 + (22 * 5),
    16 + (22 * 5),
    18 + (22 * 5),
    20 + (22 * 5),
    0 + (22 * 6),
    2 + (22 * 6),
    4 + (22 * 6),
    6 + (22 * 6),
    8 + (22 * 6),
    10 + (22 * 6),
  ];

  //Posiciones iniciles de las fichas y posiciones en blanco y prohibidas
  var fichas = [
    //[Ficha,Seleccionado, AreaPelota]
    //Posiciones en blanco(x)
    ["x", "noseleccionado", ''],
    ["x", "noseleccionado", ''],
    ["x", "noseleccionado", ''],
    ["x", "noseleccionado", ''],
    ["x", "noseleccionado", ''],
    ["x", "noseleccionado", ''],
    ["x", "noseleccionado", ''],
    ["x", "noseleccionado", ''],
    ["x", "noseleccionado", ''],
    ["x", "noseleccionado", ''],
    ["x", "noseleccionado", ''],
    ["x", "noseleccionado", ''],
    ["x", "noseleccionado", ''],
    ["x", "noseleccionado", ''],
    ["x", "noseleccionado", ''],
    ["x", "noseleccionado", ''],
    ["jugador2", "noseleccionado", ''], //Jugador 2(defensa) posicion 16
    ["x", "noseleccionado", ''],
    ["x", "noseleccionado", ''],
    ["x", "noseleccionado", ''],
    ["x", "noseleccionado", ''],
    ["x", "noseleccionado", ''],
    ["x", "noseleccionado", ''],
    ["x", "noseleccionado", ''],
    ["x", "noseleccionado", ''],
    ["x", "noseleccionado", ''],
    ["x", "noseleccionado", ''],
    ["x", "noseleccionado", ''],
    ["x", "noseleccionado", ''],
    ["x", "noseleccionado", ''],
    ["x", "noseleccionado", ''],
    ["x", "noseleccionado", ''],
    ["x", "noseleccionado", ''],
    ["x", "noseleccionado", ''],
    ["x", "noseleccionado", ''],
    ["x", "noseleccionado", ''],
    ["x", "noseleccionado", ''],
    ["x", "noseleccionado", ''],
    ["jugador2", "noseleccionado", ''], //Jugador 2(delantero) posicion 38
    ["x", "noseleccionado", ''],
    ["x", "noseleccionado", ''],
    ["x", "noseleccionado", ''],
    ["x", "noseleccionado", ''],
    ["x", "noseleccionado", ''],
    ["x", "noseleccionado", ''],
    ["x", "noseleccionado", ''],
    ["x", "noseleccionado", ''],
    ["x", "noseleccionado", ''],
    ["x", "noseleccionado", ''],
    ["x", "noseleccionado", ''],
    ["x", "noseleccionado", ''],
    ["x", "noseleccionado", ''],
    ["x", "noseleccionado", ''],
    ["x", "noseleccionado", ''],
    ["x", "noseleccionado", ''],
    ["x", "noseleccionado", ''],
    ["x", "noseleccionado", ''],
    ["x", "noseleccionado", ''],
    ["x", "noseleccionado", ''],
    ["x", "noseleccionado", 'ab'],
    ["x", "noseleccionado", 'ab'],
    ["x", "noseleccionado", 'ab'],
    ["x", "noseleccionado", ''],
    ["x", "noseleccionado", ''],
    ["x", "noseleccionado", ''],
    ["x", "noseleccionado", ''],
    ["x", "noseleccionado", ''],
    ["x", "noseleccionado", ''],
    ["x", "noseleccionado", ''],
    ["x", "noseleccionado", ''],
    ["x", "noseleccionado", 'ab'],
    ["balon", "noseleccionado", ''], //Pelota posicion 71
    ["x", "noseleccionado", 'ab'],
    ["x", "noseleccionado", ''],
    ["x", "noseleccionado", ''],
    ["x", "noseleccionado", ''],
    ["x", "noseleccionado", ''],
    ["x", "noseleccionado", ''],
    ["x", "noseleccionado", ''],
    ["x", "noseleccionado", ''],
    ["x", "noseleccionado", ''],
    ["x", "noseleccionado", 'ab'],
    ["x", "noseleccionado", 'ab'],
    ["x", "noseleccionado", 'ab'],
    ["x", "noseleccionado", ''],
    ["x", "noseleccionado", ''],
    ["x", "noseleccionado", ''],
    ["x", "noseleccionado", ''],
    ["x", "noseleccionado", ''],
    ["x", "noseleccionado", ''],
    ["x", "noseleccionado", ''],
    ["x", "noseleccionado", ''],
    ["x", "noseleccionado", ''],
    ["x", "noseleccionado", ''],
    ["x", "noseleccionado", ''],
    ["x", "noseleccionado", ''],
    ["x", "noseleccionado", ''],
    ["x", "noseleccionado", ''],
    ["x", "noseleccionado", ''],
    ["x", "noseleccionado", ''],
    ["x", "noseleccionado", ''],
    ["x", "noseleccionado", ''],
    ["x", "noseleccionado", ''],
    ["x", "noseleccionado", ''],
    ["jugador1", "noseleccionado", ''], //Jugador 1(delantero) posicion 104
    ["x", "noseleccionado", ''],
    ["x", "noseleccionado", ''],
    ["x", "noseleccionado", ''],
    ["x", "noseleccionado", ''],
    ["x", "noseleccionado", ''],
    ["x", "noseleccionado", ''],
    ["x", "noseleccionado", ''],
    ["x", "noseleccionado", ''],
    ["x", "noseleccionado", ''],
    ["x", "noseleccionado", ''],
    ["x", "noseleccionado", ''],
    ["x", "noseleccionado", ''],
    ["x", "noseleccionado", ''],
    ["x", "noseleccionado", ''],
    ["x", "noseleccionado", ''],
    ["x", "noseleccionado", ''],
    ["x", "noseleccionado", ''],
    ["x", "noseleccionado", ''],
    ["x", "noseleccionado", ''],
    ["x", "noseleccionado", ''],
    ["x", "noseleccionado", ''],
    ["jugador1", "noseleccionado", ''], //Jugador 1(defensa) posicion 126
    ["x", "noseleccionado", ''],
    ["x", "noseleccionado", ''],
    ["x", "noseleccionado", ''],
    ["x", "noseleccionado", ''],
    ["x", "noseleccionado", ''],
    ["x", "noseleccionado", ''],
    ["x", "noseleccionado", ''],
    ["x", "noseleccionado", ''],
    ["x", "noseleccionado", ''],
    ["x", "noseleccionado", ''],
    ["x", "noseleccionado", ''],
    ["x", "noseleccionado", ''],
    ["x", "noseleccionado", ''],
    ["x", "noseleccionado", ''],
    ["x", "noseleccionado", ''],
    ["x", "noseleccionado", '']
  ];

  //Metodo que reconoce que estamos queriendo hacer cuando tocamos una casilla
  void casillaSeleccionada(int indice) {
    //print("Se selecciono al ${fichas[index - 11][1].toString()}");

    //Si la casilla seleccionada es una casilla disponible para moverse
    if (fichas[indice][0].toString() == "d") {
      fichas[indice][0] = fichaActualSeleccionada;
      fichas[indiceFichaActualSeleccionada][0] = 'x';
      desmarcarTodo();

      //Verifica si la ficha del jugador se encuentra en el area de la pelota
      if ((fichas[indice][0] == 'jugador1' ||
              fichas[indice][0] == 'jugador2') &&
          fichas[indice][2] == 'ab') {
        movimientoPatearBalon(indice);
      }
    }

    //Si la casilla seleccionada es una casilla disponible para que el balon se mueva, hacemos el
    //movimiento y actualizamos la posicion del balon
    else if (fichas[indice][0] == 'mb') {
      fichas[indice][0] = 'balon';
      fichas[posicionBalon][0] = 'x';
      posicionBalon = indice;
      areaDelBalon();
      desmarcarTodo();
    }

    //Si la casilla seleccionada contiene cualquiera de las fichas
    else if (fichas[indice][0].toString() != "x" &&
        fichas[indice][1].toString() == 'noseleccionado') {
      desmarcarTodo();
      setState(() {
        indiceFichaActualSeleccionada = indice;
        fichaActualSeleccionada = fichas[indice][0].toString();
        fichas[indice][1] = 'seleccionado';
      });
      if (fichas[indice][0].toString() == 'balon') {
      } else {
        jugadorMarcado(indice);
      }
    }
  }

  //Metodo que se encarga de desmarcar las casillas con posibles movimientos de los jugadores y del
  //balon
  void desmarcarTodo() {
    setState(() {
      //Desmarca las casillas de los posibles movimientos, ya sea de los jugadores como del balon
      for (int i = 0; i < fichas.length; i++) {
        fichas[i][1] = 'noseleccionado';
        if (fichas[i][0] == 'd' || fichas[i][0] == 'mb') {
          fichas[i][0] = 'x';
        }
      }
    });
  }

  void jugadorMarcado(int indice) {
    //Mostrar posibles movimientos para Jugador 1
    //Movimiento hacia arriba
    if (indice - 11 >= 0 &&
        indice - 11 < 143 &&
        fichas[indice - 11][0] == 'x') {
      fichas[indice - 11][0] = 'd';
    }
    if (indice - (11 * 2) >= 0 &&
        indice - (11 * 2) < 143 &&
        fichas[indice - (11 * 2)][0] == 'x') {
      fichas[indice - (11 * 2)][0] = 'd';
    }

    //Movimiento diagonal arriba-derecha
    if (indice - 10 >= 0 &&
        indice - 10 < 143 &&
        fichas[indice - 10][0] == 'x') {
      fichas[indice - 10][0] = 'd';
    }
    if (indice - (10 * 2) >= 0 &&
        indice - (10 * 2) < 143 &&
        fichas[indice - (10 * 2)][0] == 'x') {
      fichas[indice - (10 * 2)][0] = 'd';
    }

    //Movimiento hacia la derecha
    if (indice + 1 >= 0 && indice + 1 < 143 && fichas[indice + 1][0] == 'x') {
      fichas[indice + 1][0] = 'd';
    }
    if (indice + (1 * 2) >= 0 &&
        indice + (1 * 2) < 143 &&
        fichas[indice + (1 * 2)][0] == 'x') {
      fichas[indice + (1 * 2)][0] = 'd';
    }

    //Movimiento diagonal abajo-derecha
    if (indice + 12 >= 0 &&
        indice + 12 < 143 &&
        fichas[indice + 12][0] == 'x') {
      fichas[indice + 12][0] = 'd';
    }
    if (indice + (12 * 2) >= 0 &&
        indice + (12 * 2) < 143 &&
        fichas[indice + (12 * 2)][0] == 'x') {
      fichas[indice + (12 * 2)][0] = 'd';
    }

    //Movimiento hacia abajo
    if (indice + 11 >= 0 &&
        indice + 11 < 143 &&
        fichas[indice + 11][0] == 'x') {
      fichas[indice + 11][0] = 'd';
    }
    if (indice + (11 * 2) >= 0 &&
        indice + (11 * 2) < 143 &&
        fichas[indice + (11 * 2)][0] == 'x') {
      fichas[indice + (11 * 2)][0] = 'd';
    }

    //Movimiento diagonal abajo-izquierda
    if (indice + 10 >= 0 &&
        indice + 10 < 143 &&
        fichas[indice + 10][0] == 'x') {
      fichas[indice + 10][0] = 'd';
    }
    if (indice + (10 * 2) >= 0 &&
        indice + (10 * 2) < 143 &&
        fichas[indice + (10 * 2)][0] == 'x') {
      fichas[indice + (10 * 2)][0] = 'd';
    }

    //Movimiento hacia la izquierda
    if (indice - 1 >= 0 && indice - 1 < 143 && fichas[indice - 1][0] == 'x') {
      fichas[indice - 1][0] = 'd';
    }
    if (indice - (1 * 2) >= 0 &&
        indice - (1 * 2) < 143 &&
        fichas[indice - (1 * 2)][0] == 'x') {
      fichas[indice - (1 * 2)][0] = 'd';
    }

    //Movimiento diagonal arriba-izquierda
    if (indice - 12 >= 0 &&
        indice - 12 < 143 &&
        fichas[indice - 12][0] == 'x') {
      fichas[indice - 12][0] = 'd';
    }
    if (indice - (12 * 2) >= 0 &&
        indice - (12 * 2) < 143 &&
        fichas[indice - (12 * 2)][0] == 'x') {
      fichas[indice - (12 * 2)][0] = 'd';
    }
  }

  void movimientoPatearBalon(int indice) {
    for (int i = 1; i < 5; i++) {
      //Movimiento hacia Arriba
      if (posicionBalon - (11 * i) >= 0 &&
          posicionBalon - (11 * i) < 143 &&
          fichas[posicionBalon - (11 * i)][0] == 'x') {
        fichas[posicionBalon - (11 * i)][0] = 'mb';
      }

      //Movimiento diagonal arriba-derecha
      if (posicionBalon - (10 * i) >= 0 &&
          posicionBalon - (10 * i) < 143 &&
          fichas[posicionBalon - (10 * i)][0] == 'x') {
        fichas[posicionBalon - (10 * i)][0] = 'mb';
      }

      //Movimiento hacia la derecha
      if (posicionBalon + (1 * i) >= 0 &&
          posicionBalon + (1 * i) < 143 &&
          fichas[posicionBalon + (1 * i)][0] == 'x') {
        fichas[posicionBalon + (1 * i)][0] = 'mb';
      }

      //Movimiento diagonal abajo-derecha
      if (posicionBalon + (12 * i) >= 0 &&
          posicionBalon + (12 * i) < 143 &&
          fichas[posicionBalon + (12 * i)][0] == 'x') {
        fichas[posicionBalon + (12 * i)][0] = 'mb';
      }

      //Movimiento hacia abajo
      if (posicionBalon + (11 * i) >= 0 &&
          posicionBalon + (11 * i) < 143 &&
          fichas[posicionBalon + (11 * i)][0] == 'x') {
        fichas[posicionBalon + (11 * i)][0] = 'mb';
      }

      //Movimiento diagonal abajo-izquierda
      if (posicionBalon + (10 * i) >= 0 &&
          posicionBalon + (10 * i) < 143 &&
          fichas[posicionBalon + (10 * i)][0] == 'x') {
        fichas[posicionBalon + (10 * i)][0] = 'mb';
      }

      //Movimiento hacia la izquierda
      if (posicionBalon - (1 * i) >= 0 &&
          posicionBalon - (1 * i) < 143 &&
          fichas[posicionBalon - (1 * i)][0] == 'x') {
        fichas[posicionBalon - (1 * i)][0] = 'mb';
      }

      //Movimiento diagonal arriba-izquierda
      if (posicionBalon - (12 * i) >= 0 &&
          posicionBalon - (12 * i) < 143 &&
          fichas[posicionBalon - (12 * i)][0] == 'x') {
        fichas[posicionBalon - (12 * i)][0] = 'mb';
      }
    }
  }

  //Metodo que se encarga de eliminar el area vieja del balon si se ha movido y crear un area nuevo
  //alrededor de la posicion nueva del balon
  void areaDelBalon() {
    for (int i = 0; i < 143; i++) {
      //Quita el area del balon de la antigua posicion del balon
      if (fichas[i][2] == 'ab') {
        fichas[i][2] = '';
      }
    }

    //Marcamos la nueva area del balon
    //Casilla superior
    if (posicionBalon - 11 > -1 && posicionBalon - 11 < 143) {
      fichas[posicionBalon - 11][2] = 'ab';
    }

    //Casilla superior-derecha
    if (posicionBalon - 10 > -1 && posicionBalon - 10 < 143) {
      fichas[posicionBalon - 10][2] = 'ab';
    }

    //Casilla derecha
    if (posicionBalon + 1 > -1 && posicionBalon + 1 < 143) {
      fichas[posicionBalon + 1][2] = 'ab';
    }

    //Casilla inferior-derecha
    if (posicionBalon + 12 > -1 && posicionBalon + 12 < 143) {
      fichas[posicionBalon + 12][2] = 'ab';
    }

    //Casilla inferior
    if (posicionBalon + 11 > -1 && posicionBalon + 11 < 143) {
      fichas[posicionBalon + 11][2] = 'ab';
    }

    //Casilla inferior-izquierda
    if (posicionBalon + 10 > -1 && posicionBalon + 10 < 143) {
      fichas[posicionBalon + 10][2] = 'ab';
    }

    //Casilla izquierda
    if (posicionBalon - 1 > -1 && posicionBalon - 1 < 143) {
      fichas[posicionBalon - 1][2] = 'ab';
    }

    //Casilla superior-izquierda
    if (posicionBalon - 10 > -1 && posicionBalon - 10 < 143) {
      fichas[posicionBalon - 10][2] = 'ab';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("MasterGoal")),
        backgroundColor: Colors.teal.shade900,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.center,
                //color: Colors.amber,
                width: 392,
                height: 100,
                child: const Text("Aca iran los marcadores y el cronometro",
                    textAlign: TextAlign.center),
              ),
            ),
            /*SizedBox(
              height: 150,
            ),*/
            Expanded(
              flex: 7,
              child: GridView.builder(
                  itemCount: 165,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 11),
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int indice) {
                    if (indice > 10 && indice < 154) {
                      return Container(
                        alignment: Alignment.center,
                        color: cuadrosVerde.contains(indice - 11)
                            ? Colors.green
                            : Colors.green.shade900,
                        child: MiFicha(
                          ficha: fichas[indice - 11][0].toString(),
                          estaSeleccionada: fichas[indice - 11][1].toString(),
                          onTap: () {
                            casillaSeleccionada(indice - 11);
                          },
                        ),
                      );
                    } else {
                      return Container(
                        color: Colors.transparent,
                        child: const Text(
                          "0",
                          textAlign: TextAlign.center,
                        ),
                      );
                    }
                  }),
            ),
          ],
        ));
  }
}
