import 'package:flutter/material.dart';
import 'package:mastergoal/clases/ficha.dart';
import 'package:mastergoal/pages/timer_page.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  String jugadorRojo = '';
  String jugadorAzul = '';
  String ganadorPartido = '';
  int posicionBalon = 82;
  int cont = 0;
  int cont2 = 0;
  int marcador1 = 0;
  int marcador2 = 0;
  int indiceFichaActualSeleccionada = -1;
  int numPases = 0;
  String fichaActualSeleccionada = '';
  String jugadorUltimoPase = '';
  String turnoJugador = 'jugador1';
  String tiempo = "";
  bool estaFichaEstaMarcada = false;
  bool golEnContra = false;
  bool esGol = false;
  bool finalizarPartido = false;

  //Para pintar los cuadros verdes mas claros
  List<int> cuadrosVerde = [
    11,
    13,
    15,
    17,
    19,
    21,
    23,
    25,
    27,
    29,
    31,
    11 + 22,
    13 + 22,
    15 + 22,
    17 + 22,
    19 + 22,
    21 + 22,
    23 + 22,
    25 + 22,
    27 + 22,
    29 + 22,
    31 + 22,
    11 + (22 * 2),
    13 + (22 * 2),
    15 + (22 * 2),
    17 + (22 * 2),
    19 + (22 * 2),
    21 + (22 * 2),
    23 + (22 * 2),
    25 + (22 * 2),
    27 + (22 * 2),
    29 + (22 * 2),
    31 + (22 * 2),
    11 + (22 * 3),
    13 + (22 * 3),
    15 + (22 * 3),
    17 + (22 * 3),
    19 + (22 * 3),
    21 + (22 * 3),
    23 + (22 * 3),
    25 + (22 * 3),
    27 + (22 * 3),
    29 + (22 * 3),
    31 + (22 * 3),
    11 + (22 * 4),
    13 + (22 * 4),
    15 + (22 * 4),
    17 + (22 * 4),
    19 + (22 * 4),
    21 + (22 * 4),
    23 + (22 * 4),
    25 + (22 * 4),
    27 + (22 * 4),
    29 + (22 * 4),
    31 + (22 * 4),
    11 + (22 * 5),
    13 + (22 * 5),
    15 + (22 * 5),
    17 + (22 * 5),
    19 + (22 * 5),
    21 + (22 * 5),
    23 + (22 * 5),
    25 + (22 * 5),
    27 + (22 * 5),
    29 + (22 * 5),
    31 + (22 * 5),
    11 + (22 * 6),
    13 + (22 * 6),
    15 + (22 * 6),
    17 + (22 * 6),
    19 + (22 * 6),
    21 + (22 * 6),
  ];

  //Posiciones iniciles de las fichas y posiciones en blanco y prohibidas
  var fichas = [
    //[Ficha,Seleccionado, AreaBalon,ParedTablero]
    //Ficha: pude ser en blanco(x), Jugador 1(jugador1), Jugador 2(jugador2) o Balon(balon); el
    //'arco' son las posiciones de las porterias, estas son inalterables
    //Seleccionado: Puede estar seleccionado(seleccionado) o no(noseleccionado)
    //AreaBalon: Puede ser que marque el area del balon(ab) o que esta libre( )
    //ParedTablero: Delimitan las lineas tanto izquierda como derecha
    //Posiciones en blanco(x)
    ["x", "noseleccionado", '', ''],
    ["x", "noseleccionado", '', ''],
    ["x", "noseleccionado", '', ''],
    ["arco", "noseleccionado", '', ''], //Zona del Arco
    ["arco", "noseleccionado", '', ''], //Zona del Arco
    ["arco", "noseleccionado", '', ''], //Zona del Arco
    ["arco", "noseleccionado", '', ''], //Zona del Arco
    ["arco", "noseleccionado", '', ''], //Zona del Arco
    ["x", "noseleccionado", '', ''],
    ["x", "noseleccionado", '', ''],
    ["x", "noseleccionado", '', ''],
    ["x", "noseleccionado", '', '|i'],
    ["x", "noseleccionado", '', ''],
    ["x", "noseleccionado", '', ''],
    ["x", "noseleccionado", '', ''],
    ["x", "noseleccionado", '', ''],
    ["x", "noseleccionado", '', ''],
    ["x", "noseleccionado", '', ''],
    ["x", "noseleccionado", '', ''],
    ["x", "noseleccionado", '', ''],
    ["x", "noseleccionado", '', ''],
    ["x", "noseleccionado", '', '|d'],
    ["x", "noseleccionado", '', '|i'],
    ["x", "noseleccionado", '', ''],
    ["x", "noseleccionado", '', ''],
    ["x", "noseleccionado", '', ''],
    ["x", "noseleccionado", '', ''],
    ["jugador2", "noseleccionado", '', ''], //Jugador 2(defensa) posicion 27
    ["x", "noseleccionado", '', ''],
    ["x", "noseleccionado", '', ''],
    ["x", "noseleccionado", '', ''],
    ["x", "noseleccionado", '', ''],
    ["x", "noseleccionado", '', '|d'],
    ["x", "noseleccionado", '', '|i'],
    ["x", "noseleccionado", '', ''],
    ["x", "noseleccionado", '', ''],
    ["x", "noseleccionado", '', ''],
    ["x", "noseleccionado", '', ''],
    ["x", "noseleccionado", '', ''],
    ["x", "noseleccionado", '', ''],
    ["x", "noseleccionado", '', ''],
    ["x", "noseleccionado", '', ''],
    ["x", "noseleccionado", '', ''],
    ["x", "noseleccionado", '', '|d'],
    ["x", "noseleccionado", '', '|i'],
    ["x", "noseleccionado", '', ''],
    ["x", "noseleccionado", '', ''],
    ["x", "noseleccionado", '', ''],
    ["x", "noseleccionado", '', ''],
    ["jugador2", "noseleccionado", '', ''], //Jugador 2(delantero) posicion 49
    ["x", "noseleccionado", '', ''],
    ["x", "noseleccionado", '', ''],
    ["x", "noseleccionado", '', ''],
    ["x", "noseleccionado", '', ''],
    ["x", "noseleccionado", '', '|d'],
    ["x", "noseleccionado", '', '|i'],
    ["x", "noseleccionado", '', ''],
    ["x", "noseleccionado", '', ''],
    ["x", "noseleccionado", '', ''],
    ["x", "noseleccionado", '', ''],
    ["x", "noseleccionado", '', ''],
    ["x", "noseleccionado", '', ''],
    ["x", "noseleccionado", '', ''],
    ["x", "noseleccionado", '', ''],
    ["x", "noseleccionado", '', ''],
    ["x", "noseleccionado", '', '|d'],
    ["x", "noseleccionado", '', '|i'],
    ["x", "noseleccionado", '', ''],
    ["x", "noseleccionado", '', ''],
    ["x", "noseleccionado", '', ''],
    ["x", "noseleccionado", 'ab', ''],
    ["x", "noseleccionado", 'ab', ''],
    ["x", "noseleccionado", 'ab', ''],
    ["x", "noseleccionado", '', ''],
    ["x", "noseleccionado", '', ''],
    ["x", "noseleccionado", '', ''],
    ["x", "noseleccionado", '', '|d'],
    ["x", "noseleccionado", '', '|i'],
    ["x", "noseleccionado", '', ''],
    ["x", "noseleccionado", '', ''],
    ["x", "noseleccionado", '', ''],
    ["x", "noseleccionado", 'ab', ''],
    ["balon", "noseleccionado", '', ''], //Pelota posicion 82
    ["x", "noseleccionado", 'ab', ''],
    ["x", "noseleccionado", '', ''],
    ["x", "noseleccionado", '', ''],
    ["x", "noseleccionado", '', ''],
    ["x", "noseleccionado", '', '|d'],
    ["x", "noseleccionado", '', '|i'],
    ["x", "noseleccionado", '', ''],
    ["x", "noseleccionado", '', ''],
    ["x", "noseleccionado", '', ''],
    ["x", "noseleccionado", 'ab', ''],
    ["x", "noseleccionado", 'ab', ''],
    ["x", "noseleccionado", 'ab', ''],
    ["x", "noseleccionado", '', ''],
    ["x", "noseleccionado", '', ''],
    ["x", "noseleccionado", '', ''],
    ["x", "noseleccionado", '', '|d'],
    ["x", "noseleccionado", '', '|i'],
    ["x", "noseleccionado", '', ''],
    ["x", "noseleccionado", '', ''],
    ["x", "noseleccionado", '', ''],
    ["x", "noseleccionado", '', ''],
    ["x", "noseleccionado", '', ''],
    ["x", "noseleccionado", '', ''],
    ["x", "noseleccionado", '', ''],
    ["x", "noseleccionado", '', ''],
    ["x", "noseleccionado", '', ''],
    ["x", "noseleccionado", '', '|d'],
    ["x", "noseleccionado", '', '|i'],
    ["x", "noseleccionado", '', ''],
    ["x", "noseleccionado", '', ''],
    ["x", "noseleccionado", '', ''],
    ["x", "noseleccionado", '', ''],
    ["jugador1", "noseleccionado", '', ''], //Jugador 1(delantero) posicion 115
    ["x", "noseleccionado", '', ''],
    ["x", "noseleccionado", '', ''],
    ["x", "noseleccionado", '', ''],
    ["x", "noseleccionado", '', ''],
    ["x", "noseleccionado", '', '|d'],
    ["x", "noseleccionado", '', '|i'],
    ["x", "noseleccionado", '', ''],
    ["x", "noseleccionado", '', ''],
    ["x", "noseleccionado", '', ''],
    ["x", "noseleccionado", '', ''],
    ["x", "noseleccionado", '', ''],
    ["x", "noseleccionado", '', ''],
    ["x", "noseleccionado", '', ''],
    ["x", "noseleccionado", '', ''],
    ["x", "noseleccionado", '', ''],
    ["x", "noseleccionado", '', '|d'],
    ["x", "noseleccionado", '', '|i'],
    ["x", "noseleccionado", '', ''],
    ["x", "noseleccionado", '', ''],
    ["x", "noseleccionado", '', ''],
    ["x", "noseleccionado", '', ''],
    ["jugador1", "noseleccionado", '', ''], //Jugador 1(defensa) posicion 137
    ["x", "noseleccionado", '', ''],
    ["x", "noseleccionado", '', ''],
    ["x", "noseleccionado", '', ''],
    ["x", "noseleccionado", '', ''],
    ["x", "noseleccionado", '', '|d'],
    ["x", "noseleccionado", '', '|i'],
    ["x", "noseleccionado", '', ''],
    ["x", "noseleccionado", '', ''],
    ["x", "noseleccionado", '', ''],
    ["x", "noseleccionado", '', ''],
    ["x", "noseleccionado", '', ''],
    ["x", "noseleccionado", '', ''],
    ["x", "noseleccionado", '', ''],
    ["x", "noseleccionado", '', ''],
    ["x", "noseleccionado", '', ''],
    ["x", "noseleccionado", '', '|d'],
    ["x", "noseleccionado", '', ''],
    ["x", "noseleccionado", '', ''],
    ["x", "noseleccionado", '', ''],
    ["arco", "noseleccionado", '', ''],
    ["arco", "noseleccionado", '', ''],
    ["arco", "noseleccionado", '', ''],
    ["arco", "noseleccionado", '', ''],
    ["arco", "noseleccionado", '', ''],
    ["x", "noseleccionado", '', ''],
    ["x", "noseleccionado", '', ''],
    ["x", "noseleccionado", '', '']
  ];

  //Metodo que reconoce que estamos queriendo hacer cuando tocamos una casilla
  void casillaSeleccionada(int indice) {
    if (!finalizarPartido) {
      esGol = false;
      //Si la casilla seleccionada es una casilla disponible para moverse, movemos la fichas a la
      //casilla elegida y resteamos su anterior posicion
      if (fichas[indice][0].toString() == "d") {
        fichas[indice][0] = fichaActualSeleccionada;
        fichas[indiceFichaActualSeleccionada][0] = 'x';
        indiceFichaActualSeleccionada = indice;
        desmarcarTodo();

        //Verifica si la ficha del jugador se encuentra en el area de la pelota, si es verdad se
        //habilitan los movimientos posibles
        if ((fichas[indice][0] == jugadorRojo ||
                fichas[indice][0] == jugadorAzul) &&
            fichas[indice][2] == 'ab') {
          jugadorUltimoPase = fichas[indice][0];
          turnoJugador == jugadorRojo
              ? turnoJugador = jugadorRojo
              : turnoJugador = jugadorAzul;

          movimientoPatearBalon();
        } else {
          turnoJugador == jugadorRojo
              ? turnoJugador = jugadorAzul
              : turnoJugador = jugadorRojo;
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
        jugadaGol(indice);
        if (esPase(posicionBalon)) {
          numPases++;
          turnoJugador = jugadorUltimoPase;
          indiceFichaActualSeleccionada = obtenerIndice();
          movimientoPatearBalon();
        } else {
          numPases = 0;
          if (turnoJugador == jugadorRojo) {
            turnoJugador = jugadorAzul;
          } else {
            turnoJugador = jugadorRojo;
          }
        }
      }

      //Si la casilla seleccionada contiene cualquiera de las fichas
      else if (fichas[indice][0].toString() != "x" &&
          fichas[indice][1].toString() == 'noseleccionado') {
        if (fichas[indice][0] == turnoJugador) {
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
        } else {
          desmarcarTodo();
        }
      }

      if (marcador1 == 2) {
        finalizarPartido = true;
        ganadorPartido = jugadorRojo;
      } else if (marcador2 == 2) {
        finalizarPartido = true;
        ganadorPartido = jugadorAzul;
      }

      if (finalizarPartido) {
        setState(() {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text(
                ganadorPartido == "jugador1"
                    ? "La partida se ha acabado\nEl ganador es el Equipo Rojo"
                    : "La partida se ha acabado\nEl ganador es el Equipo Azul",
                style: const TextStyle(color: Colors.black, fontSize: 20),
              ),
              content: const Text(''),
              actions: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/',
                    );
                  },
                  child: Text('OK'),
                ),
              ],
            ),
          );
        });
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
        if ((i > 2 && i < 8) || (i > 156 && i < 162)) {
          fichas[i][0] = 'arco';
        }
      }
    });
  }

  //Metodo que muestra los posibles movimientos para los jugadores
  void jugadorMarcado(int indice) {
    int i;
    //Mostrar posibles movimientos para Jugador 1
    //Para la izquierda, derecha y diagonales son validaciones un poco diferentes
    //Movimiento hacia arriba
    for (i = 1; i < 3; i++) {
      if (enTablero(indice - (11 * i)) && fichas[indice - (11 * i)][0] == 'x') {
        fichas[indice - (11 * i)][0] = 'd';
      }
    }

    //Movimiento diagonal arriba-derecha
    for (i = 1; i < 3; i++) {
      if (enTablero(indice - (10 * i))) {
        if (fichas[indice][3] != '|d' && fichas[indice - (10 * i)][0] == 'x') {
          fichas[indice - (10 * i)][0] = 'd';
        }
        if (fichas[indice - (10 * i)][3] == '|d') {
          break;
        }
      }
    }

    //Movimiento hacia la derecha
    for (i = 1; i < 3; i++) {
      if (enTablero(indice + (1 * i))) {
        if (fichas[indice][3] != '|d' && fichas[indice + (1 * i)][0] == 'x') {
          fichas[indice + (1 * i)][0] = 'd';
        }
        if (fichas[indice + (1 * i)][3] == '|d') {
          break;
        }
      }
    }

    //Movimiento diagonal abajo-derecha
    for (i = 1; i < 3; i++) {
      if (enTablero(indice + (12 * i))) {
        if (fichas[indice][3] != '|d' && fichas[indice + (12 * i)][0] == 'x') {
          fichas[indice + (12 * i)][0] = 'd';
        }
        if (fichas[indice + (12 * i)][3] == '|d') {
          break;
        }
      }
    }

    //Movimiento hacia abajo
    for (i = 1; i < 3; i++) {
      if (enTablero(indice + (11 * i)) && fichas[indice + (11 * i)][0] == 'x') {
        fichas[indice + (11 * i)][0] = 'd';
      }
    }

    //Movimiento diagonal abajo-izquierda
    for (i = 1; i < 3; i++) {
      if (enTablero(indice + (10 * i))) {
        if (fichas[indice][3] != '|i' && fichas[indice + (10 * i)][0] == 'x') {
          fichas[indice + (10 * i)][0] = 'd';
        }
        if (fichas[indice + (10 * i)][3] == '|i') {
          break;
        }
      }
    }

    //Movimiento hacia la izquierda
    for (i = 1; i < 3; i++) {
      if (enTablero(indice - (1 * i))) {
        if (fichas[indice][3] != '|i' && fichas[indice - (1 * i)][0] == 'x') {
          fichas[indice - (1 * i)][0] = 'd';
        }
        if (fichas[indice - (1 * i)][3] == '|i') {
          break;
        }
      }
    }

    //Movimiento diagonal arriba-izquierda
    for (i = 1; i < 3; i++) {
      if (enTablero(indice - (12 * i))) {
        if (fichas[indice][3] != '|i' && fichas[indice - (12 * i)][0] == 'x') {
          fichas[indice - (12 * i)][0] = 'd';
        }
        if (fichas[indice - (12 * i)][3] == '|i') {
          break;
        }
      }
    }
  }

  //Metodo que muestra los posibles movimientos para el balon
  void movimientoPatearBalon() {
    int i;
    //Para la izquierda, derecha y diagonales son validaciones un poco diferentes
    //Para arriba, abajo y las diagonales se agrego una condicion mas para poder moverse dentro de
    // los arcos y anotar el gol
    //Movimiento hacia Arriba
    for (i = 1; i < 5; i++) {
      if (enTableroBalon(posicionBalon - (11 * i)) &&
          (fichas[posicionBalon - (11 * i)][0] == 'x' ||
              fichas[posicionBalon - (11 * i)][0] == 'arco')) {
        fichas[posicionBalon - (11 * i)][0] = 'mb';
        if (esPase(posicionBalon - (11 * i)) && numPases > 3) {
          fichas[posicionBalon - (11 * i)][0] = 'x';
        }
        if (jugadaProhibida(posicionBalon - (11 * i))) {
          fichas[posicionBalon - (11 * i)][0] = 'x';
        }
      }
    }

    //Movimiento diagonal arriba-derecha
    for (i = 1; i < 5; i++) {
      if (enTableroBalon(posicionBalon - (10 * i))) {
        if (fichas[posicionBalon][3] != '|d' &&
            (fichas[posicionBalon - (10 * i)][0] == 'x' ||
                fichas[posicionBalon - (10 * i)][0] == 'arco')) {
          fichas[posicionBalon - (10 * i)][0] = 'mb';
          if (esPase(posicionBalon - (10 * i)) && numPases > 3) {
            fichas[posicionBalon - (10 * i)][0] = 'x';
          }
          if (jugadaProhibida(posicionBalon - (10 * i))) {
            fichas[posicionBalon - (10 * i)][0] = 'x';
          }
        }
        if (fichas[posicionBalon - (10 * i)][3] == '|d') {
          break;
        }
      }
    }

    //Movimiento hacia la derecha
    for (i = 1; i < 5; i++) {
      if (enTableroBalon(posicionBalon + (1 * i))) {
        if (fichas[posicionBalon][3] != '|d' &&
            fichas[posicionBalon + (1 * i)][0] == 'x') {
          fichas[posicionBalon + (1 * i)][0] = 'mb';
          if (esPase(posicionBalon + (1 * i)) && numPases > 3) {
            fichas[posicionBalon + (1 * i)][0] = 'x';
          }
          if (jugadaProhibida(posicionBalon + (1 * i))) {
            fichas[posicionBalon + (1 * i)][0] = 'x';
          }
        }
        if (fichas[posicionBalon + (1 * i)][3] == '|d') {
          break;
        }
      }
    }

    //Movimiento diagonal abajo-derecha
    for (i = 1; i < 5; i++) {
      if (enTableroBalon(posicionBalon + (12 * i))) {
        if (fichas[posicionBalon][3] != '|d' &&
            (fichas[posicionBalon + (12 * i)][0] == 'x' ||
                fichas[posicionBalon + (12 * i)][0] == 'arco')) {
          fichas[posicionBalon + (12 * i)][0] = 'mb';
          if (esPase(posicionBalon + (12 * i)) && numPases > 3) {
            fichas[posicionBalon + (12 * i)][0] = 'x';
          }
          if (jugadaProhibida(posicionBalon + (12 * i))) {
            fichas[posicionBalon + (12 * i)][0] = 'x';
          }
        }
        if (fichas[posicionBalon + (12 * i)][3] == '|d') {
          break;
        }
      }
    }

    //Movimiento hacia abajo
    for (i = 1; i < 5; i++) {
      if (enTableroBalon(posicionBalon + (11 * i)) &&
          (fichas[posicionBalon + (11 * i)][0] == 'x' ||
              fichas[posicionBalon + (11 * i)][0] == 'arco')) {
        fichas[posicionBalon + (11 * i)][0] = 'mb';
        if (esPase(posicionBalon + (11 * i)) && numPases > 3) {
          fichas[posicionBalon + (11 * i)][0] = 'x';
        }
        if (jugadaProhibida(posicionBalon + (11 * i))) {
          fichas[posicionBalon + (11 * i)][0] = 'x';
        }
      }
    }

    //Movimiento diagonal abajo-izquierda
    for (i = 1; i < 5; i++) {
      if (enTableroBalon(posicionBalon + (10 * i))) {
        if (fichas[posicionBalon][3] != '|i' &&
            (fichas[posicionBalon + (10 * i)][0] == 'x' ||
                fichas[posicionBalon + (10 * i)][0] == 'arco')) {
          fichas[posicionBalon + (10 * i)][0] = 'mb';
          if (esPase(posicionBalon + (10 * i)) && numPases > 3) {
            fichas[posicionBalon + (10 * i)][0] = 'x';
          }
          if (jugadaProhibida(posicionBalon + (10 * i))) {
            fichas[posicionBalon + (10 * i)][0] = 'x';
          }
        }
        if (fichas[posicionBalon + (10 * i)][3] == '|i') {
          break;
        }
      }
    }

    //Movimiento hacia la izquierda
    for (i = 1; i < 5; i++) {
      if (enTableroBalon(posicionBalon - (1 * i))) {
        if (fichas[posicionBalon][3] != '|i' &&
            fichas[posicionBalon - (1 * i)][0] == 'x') {
          fichas[posicionBalon - (1 * i)][0] = 'mb';
          if (esPase(posicionBalon - (1 * i)) && numPases > 3) {
            fichas[posicionBalon - (1 * i)][0] = 'x';
          }
          if (jugadaProhibida(posicionBalon - (1 * i))) {
            fichas[posicionBalon - (1 * i)][0] = 'x';
          }
        }
        if (fichas[posicionBalon - (1 * i)][3] == '|i') {
          break;
        }
      }
    }

    //Movimiento diagonal arriba-izquierda
    for (i = 1; i < 5; i++) {
      if (enTableroBalon(posicionBalon - (12 * i))) {
        if (fichas[posicionBalon][3] != '|i' &&
            (fichas[posicionBalon - (12 * i)][0] == 'x' ||
                fichas[posicionBalon - (12 * i)][0] == 'arco')) {
          fichas[posicionBalon - (12 * i)][0] = 'mb';
          if (esPase(posicionBalon - (12 * i)) && numPases > 3) {
            fichas[posicionBalon - (12 * i)][0] = 'x';
          }
          if (jugadaProhibida(posicionBalon - (12 * i))) {
            fichas[posicionBalon - (12 * i)][0] = 'x';
          }
        }
        if (fichas[posicionBalon - (12 * i)][3] == '|i') {
          break;
        }
      }
    }
  }

  //Metodo que se encarga de eliminar el area vieja del balon si se ha movido y crear un area nuevo
  //alrededor de la posicion nueva del balon
  void areaDelBalon() {
    //Quita el area del balon de la antigua posicion del balon
    for (int i = 0; i < 143; i++) {
      if (fichas[i][2] == 'ab') {
        fichas[i][2] = '';
      }
    }

    //Marcamos la nueva area del balon
    //Casilla superior
    if (enTablero(posicionBalon - 11)) {
      fichas[posicionBalon - 11][2] = 'ab';
    }

    //Casilla superior-derecha
    if (enTablero(posicionBalon - 10)) {
      fichas[posicionBalon - 10][2] = 'ab';
    }

    //Casilla derecha
    if (enTablero(posicionBalon + 1)) {
      fichas[posicionBalon + 1][2] = 'ab';
    }

    //Casilla inferior-derecha
    if (enTablero(posicionBalon + 12)) {
      fichas[posicionBalon + 12][2] = 'ab';
    }

    //Casilla inferior
    if (enTablero(posicionBalon + 11)) {
      fichas[posicionBalon + 11][2] = 'ab';
    }

    //Casilla inferior-izquierda
    if (enTablero(posicionBalon + 10)) {
      fichas[posicionBalon + 10][2] = 'ab';
    }

    //Casilla izquierda
    if (enTablero(posicionBalon - 1)) {
      fichas[posicionBalon - 1][2] = 'ab';
    }

    //Casilla superior-izquierda
    if (enTablero(posicionBalon - 12)) {
      fichas[posicionBalon - 12][2] = 'ab';
    }
  }

  //Metodo que valida si la posicion dada para los jugadores esta dentro del tablero
  bool enTablero(int indice) {
    if (indice > 10 && indice < 154) {
      return true;
    }
    return false;
  }

  //Metodo que valida si la posicion dada para el balon esta dentro del tablero
  bool enTableroBalon(int indice) {
    if (indice > 10 && indice < 154) {
      return true;
    } else if ((indice > 2 && indice < 8) || (indice > 156 && indice < 162)) {
      return true;
    }
    return false;
  }

  //Metodo que valida las jugadas de goles
  void jugadaGol(indice) {
    if ((2 < posicionBalon && posicionBalon < 8) ||
        (156 < posicionBalon && posicionBalon < 162)) {
      //Verifica si el gol fue en contra
      if ((2 < posicionBalon && posicionBalon < 8) &&
          jugadorUltimoPase == jugadorAzul) {
        golEnContra = true;
        turnoJugador = jugadorAzul;
      } else if ((156 < posicionBalon && posicionBalon < 162) &&
          jugadorUltimoPase == jugadorRojo) {
        golEnContra = true;
        turnoJugador = jugadorRojo;
      }

      //Valida que equipo convirtio el gol y si no fue gol en contra. Suma los goles
      if (jugadorUltimoPase == jugadorRojo) {
        if (golEnContra) {
          marcador2++;
          golEnContra = false;
        } else {
          marcador1++;
        }
        esGol = true;
      } else if (jugadorUltimoPase == jugadorAzul) {
        if (golEnContra) {
          marcador1++;
          golEnContra = false;
        } else {
          marcador2++;
        }
        esGol = true;
      }

      //Resetea las posiciones de las fichas cuando se convierta un gol
      for (int i = 0; i < 164; i++) {
        if (fichas[i][0] == jugadorRojo ||
            fichas[i][0] == jugadorAzul ||
            fichas[i][0] == 'balon') {
          fichas[i][0] = 'x';
        }
      }
      fichas[27][0] = jugadorAzul;
      fichas[49][0] = jugadorAzul;
      fichas[82][0] = 'balon';
      fichas[115][0] = jugadorRojo;
      fichas[137][0] = jugadorRojo;
      posicionBalon = 82;
      desmarcarTodo();
      areaDelBalon();
    }
  }

  //Valida si la siguiente jugada es un pase de un jugador a otro del mismo equipo, si es asi
  //No cambiara el turno y se podra hacer hasta 4 pases
  bool esPase(int indice) {
    //Arriba-Izquierda
    if (enTableroBalon(indice - 12) &&
        fichas[indice - 12][0] == jugadorUltimoPase) {
      return true;
    }
    //Arriba
    if (enTableroBalon(indice - 11) &&
        fichas[indice - 11][0] == jugadorUltimoPase) {
      return true;
    }
    //Arriba-Derecha
    if (enTableroBalon(indice - 10) &&
        fichas[indice - 10][0] == jugadorUltimoPase) {
      return true;
    }
    //Derecha
    if (enTableroBalon(indice + 1) &&
        fichas[indice + 1][0] == jugadorUltimoPase) {
      return true;
    }
    //Abajo-Derecha
    if (enTableroBalon(indice + 12) &&
        fichas[indice + 12][0] == jugadorUltimoPase) {
      return true;
    }
    //Abajo
    if (enTableroBalon(indice + 11) &&
        fichas[indice + 11][0] == jugadorUltimoPase) {
      return true;
    }
    //Abajo-Izquierda
    if (enTableroBalon(indice + 10) &&
        fichas[indice + 10][0] == jugadorUltimoPase) {
      return true;
    }
    //Izquierda
    if (enTableroBalon(indice - 1) &&
        fichas[indice - 1][0] == jugadorUltimoPase) {
      return true;
    }
    return false;
  }

  //Metodo que valida si una de las posibles jugadas es una jugada prohibida, si es asi, no permite
  //que el jugador la elija
  bool jugadaProhibida(int indice) {
    //No dejar el balon en el area del mismo jugador que esta pateando
    //Arriba-Izquierda
    if (enTableroBalon(indice - 12) &&
        indice - 12 == indiceFichaActualSeleccionada) {
      return true;
    }
    //Arriba
    if (enTableroBalon(indice - 11) &&
        indice - 11 == indiceFichaActualSeleccionada) {
      return true;
    }
    //Arriba-Derecha
    if (enTableroBalon(indice - 10) &&
        indice - 10 == indiceFichaActualSeleccionada) {
      return true;
    }
    //Derecha
    if (enTableroBalon(indice + 1) &&
        indice + 1 == indiceFichaActualSeleccionada) {
      return true;
    }
    //Abajo-Derecha
    if (enTableroBalon(indice + 12) &&
        indice + 12 == indiceFichaActualSeleccionada) {
      return true;
    }
    //Abajo
    if (enTableroBalon(indice + 11) &&
        indice + 11 == indiceFichaActualSeleccionada) {
      return true;
    }
    //Abajo-Izquierda
    if (enTableroBalon(indice + 10) &&
        indice + 10 == indiceFichaActualSeleccionada) {
      return true;
    }
    //Izquierda
    if (enTableroBalon(indice - 1) &&
        indice - 1 == indiceFichaActualSeleccionada) {
      return true;
    }
    return false;
  }

  //Metodo que se encarga de obtener el indice de la ficha en caso de un pase
  int obtenerIndice() {
    if (enTablero(posicionBalon - 12) &&
        fichas[posicionBalon - 12][0] == turnoJugador) {
      return posicionBalon - 12;
    }
    //Arriba
    if (enTablero(posicionBalon - 11) &&
        fichas[posicionBalon - 1][0] == turnoJugador) {
      return posicionBalon - 11;
    }
    //Arriba-Derecha
    if (enTablero(posicionBalon - 10) &&
        fichas[posicionBalon - 10][0] == turnoJugador) {
      return posicionBalon - 10;
    }
    //Derecha
    if (enTablero(posicionBalon + 1) &&
        fichas[posicionBalon + 1][0] == turnoJugador) {
      return posicionBalon + 1;
    }
    //Abajo-Derecha
    if (enTablero(posicionBalon + 12) &&
        fichas[posicionBalon + 12][0] == turnoJugador) {
      return posicionBalon + 12;
    }
    //Abajo
    if (enTablero(posicionBalon + 11) &&
        fichas[posicionBalon + 11][0] == turnoJugador) {
      return posicionBalon + 11;
    }
    //Abajo-Izquierda
    if (enTablero(posicionBalon + 10) &&
        fichas[posicionBalon + 10][0] == turnoJugador) {
      return posicionBalon + 10;
    }
    //Izquierda
    if (enTablero(posicionBalon - 1) &&
        fichas[posicionBalon - 1][0] == turnoJugador) {
      return posicionBalon - 1;
    }
    return -1;
  }

  //Metodo que devuleve un widget, dependiendo si hubo una jugada de gol o no
  Widget bannerGol() {
    if (esGol) {
      return const Text(
        "GOOOOOOOOLLLLLL",
        style: TextStyle(
            color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
      );
    } else {
      return Text(
        turnoJugador == "jugador1"
            ? "Es turno del Equipo Rojo"
            : "Es turno del Equipo Azul",
        style: const TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
      );
    }
  }

  //Metodo de devuelve un widget, dependiendo si ya termino el partido y que equipo es el ganador
  Widget bannerResumen() {
    if (ganadorPartido != "") {
      return Container(
        child: Text(
          ganadorPartido == "jugador1"
              ? "La partida se ha acabado\nEl ganador es el Equipo Rojo"
              : "La partida se ha acabado\nEl ganador es el Equipo Azul",
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ),
      );
    } else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    final nombrelogin = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    if (nombrelogin['equipSelected'] == "true" && cont == 0) {
      jugadorRojo = "jugador1";
      jugadorAzul = "jugador2";
      turnoJugador = jugadorRojo;
      fichas[27][0] = jugadorAzul;
      fichas[49][0] = jugadorAzul;
      fichas[115][0] = jugadorRojo;
      fichas[137][0] = jugadorRojo;
      cont = 1 + 1;
    } else if (nombrelogin['equipSelected'] == "false" && cont == 0) {
      jugadorRojo = "jugador2";
      jugadorAzul = "jugador1";
      turnoJugador = jugadorAzul;
      fichas[27][0] = jugadorAzul;
      fichas[49][0] = jugadorAzul;
      fichas[115][0] = jugadorRojo;
      fichas[137][0] = jugadorRojo;
      cont = 1 + 1;
    }
    if (nombrelogin["Tiempo"] != "" && cont2 == 0) {
      tiempo = nombrelogin["Tiempo"];
    }
    return Scaffold(
        backgroundColor: Colors.teal.shade900,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                  flex: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      //El timer va aca, para que se muestre al otro lado del marcador
                      Container(
                          child: nombrelogin['timerChecked'] == "true"
                              ? Container(
                                  height: 32,
                                  width: 80,
                                  color: Colors.white,
                                  child: const TimerPage())
                              : const Text("")),
                      Container(
                        alignment: Alignment.center,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              if (nombrelogin['equipSelected'] == "true")
                                Container(
                                  //Container J1
                                  width: 32,
                                  color: Colors.red,
                                  child: const Text(
                                    "J1",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 27,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              if (nombrelogin['equipSelected'] == "false")
                                Container(
                                  //Container J1
                                  width: 32,
                                  color: Colors.blue[900],
                                  child: const Text(
                                    "J1",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 27,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              Container(
                                //Container contador J1
                                width: 32,
                                color: Colors.black,
                                child: Text(
                                  "$marcador1",
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      fontSize: 27,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                              Container(
                                //Container vs
                                width: 24,
                                color: Colors.transparent,
                                child: const Text(
                                  "vs",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                              ),
                              Container(
                                //Container contador J2
                                width: 32,
                                color: Colors.black,
                                child: Text(
                                  "$marcador2",
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 27,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              if (nombrelogin['equipSelected'] == "true")
                                Container(
                                  //Container J2
                                  width: 32,
                                  color: Colors.blue[900],
                                  child: const Text(
                                    "J2",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 27,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              if (nombrelogin['equipSelected'] == "false")
                                Container(
                                  //Container J2
                                  width: 32,
                                  color: Colors.red,
                                  child: const Text(
                                    "J2",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 27,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                            ]),
                      )
                    ],
                  )),
              Expanded(
                flex: 10,
                child: GridView.builder(
                    itemCount: 165,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 11),
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int indice) {
                      if (indice > 10 && indice < 154) {
                        return Container(
                          alignment: Alignment.center,
                          color: cuadrosVerde.contains(indice)
                              ? Colors.green
                              : Colors.green.shade900,
                          child: MiFicha(
                            ficha: fichas[indice][0].toString(),
                            estaSeleccionada: fichas[indice][1].toString(),
                            indice: indice,
                            onTap: () {
                              casillaSeleccionada(indice);
                            },
                          ),
                        );
                      } else if ((indice > 2 && indice < 8) ||
                          (indice > 156 && indice < 162)) {
                        //Inserta las casillas de los arcos
                        return Container(
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("assets/arco.png"),
                                    fit: BoxFit.cover)),
                            child: MiFicha(
                              ficha: fichas[indice][0],
                              estaSeleccionada: fichas[indice][1],
                              indice: indice,
                              onTap: () {
                                casillaSeleccionada(indice);
                              },
                            ));
                      } else {
                        //Casillas en Blanco por arriba y abajo del tablero
                        return Container(
                          color: Colors.transparent,
                          child: Text(
                            "$indice",
                            textAlign: TextAlign.center,
                          ),
                        );
                      }
                    }),
              ),
              Expanded(flex: 1, child: bannerResumen()),
              Expanded(
                flex: 1,
                child: Container(
                  color: turnoJugador == "jugador1"
                      ? Colors.red
                      : Colors.blue[900],
                  alignment: Alignment.center,
                  child: bannerGol(),
                ),
              )
            ],
          ),
        ));
  }
}
