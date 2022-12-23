import 'package:flutter/material.dart';
import 'package:mastergoal/clases/ficha.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
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
    //[Posicion,Ficha,Seleccionado]
    //Posiciones en blanco
    [11, "x", "noseleccionado"],
    [12, "x", "noseleccionado"],
    [13, "x", "noseleccionado"],
    [14, "x", "noseleccionado"],
    [15, "x", "noseleccionado"],
    [16, "x", "noseleccionado"],
    [17, "x", "noseleccionado"],
    [18, "x", "noseleccionado"],
    [19, "x", "noseleccionado"],
    [20, "x", "noseleccionado"],
    [21, "x", "noseleccionado"],
    [22, "x", "noseleccionado"],
    [23, "x", "noseleccionado"],
    [24, "x", "noseleccionado"],
    [25, "x", "noseleccionado"],
    [26, "x", "noseleccionado"],

    //Jugador 2
    [27, "jugador2", "noseleccionado"],

    [28, "x", "noseleccionado"],
    [29, "x", "noseleccionado"],
    [30, "x", "noseleccionado"],
    [31, "x", "noseleccionado"],
    [32, "x", "noseleccionado"],
    [33, "x", "noseleccionado"],
    [34, "x", "noseleccionado"],
    [35, "x", "noseleccionado"],
    [36, "x", "noseleccionado"],
    [37, "x", "noseleccionado"],
    [38, "x", "noseleccionado"],
    [39, "x", "noseleccionado"],
    [40, "x", "noseleccionado"],
    [41, "x", "noseleccionado"],
    [42, "x", "noseleccionado"],
    [43, "x", "noseleccionado"],
    [44, "x", "noseleccionado"],
    [45, "x", "noseleccionado"],
    [46, "x", "noseleccionado"],
    [47, "x", "noseleccionado"],
    [48, "x", "noseleccionado"],

    //Jugador 2
    [49, "jugador2", "noseleccionado"],

    [50, "x", "noseleccionado"],
    [51, "x", "noseleccionado"],
    [52, "x", "noseleccionado"],
    [53, "x", "noseleccionado"],
    [54, "x", "noseleccionado"],
    [55, "x", "noseleccionado"],
    [56, "x", "noseleccionado"],
    [57, "x", "noseleccionado"],
    [58, "x", "noseleccionado"],
    [59, "x", "noseleccionado"],
    [60, "x", "noseleccionado"],
    [61, "x", "noseleccionado"],
    [62, "x", "noseleccionado"],
    [63, "x", "noseleccionado"],
    [64, "x", "noseleccionado"],
    [65, "x", "noseleccionado"],
    [66, "x", "noseleccionado"],
    [67, "x", "noseleccionado"],
    [68, "x", "noseleccionado"],
    [69, "x", "noseleccionado"],
    [70, "x", "noseleccionado"],
    [71, "x", "noseleccionado"],
    [72, "x", "noseleccionado"],
    [73, "x", "noseleccionado"],
    [74, "x", "noseleccionado"],
    [75, "x", "noseleccionado"],
    [76, "x", "noseleccionado"],
    [77, "x", "noseleccionado"],
    [78, "x", "noseleccionado"],
    [79, "x", "noseleccionado"],
    [80, "x", "noseleccionado"],
    [81, "x", "noseleccionado"],

    //El balon
    [82, "balon", "noseleccionado"],

    [83, "x", "noseleccionado"],
    [84, "x", "noseleccionado"],
    [85, "x", "noseleccionado"],
    [86, "x", "noseleccionado"],
    [87, "x", "noseleccionado"],
    [88, "x", "noseleccionado"],
    [89, "x", "noseleccionado"],
    [90, "x", "noseleccionado"],
    [91, "x", "noseleccionado"],
    [92, "x", "noseleccionado"],
    [93, "x", "noseleccionado"],
    [94, "x", "noseleccionado"],
    [95, "x", "noseleccionado"],
    [96, "x", "noseleccionado"],
    [97, "x", "noseleccionado"],
    [98, "x", "noseleccionado"],
    [99, "x", "noseleccionado"],
    [100, "x", "noseleccionado"],
    [101, "x", "noseleccionado"],
    [102, "x", "noseleccionado"],
    [103, "x", "noseleccionado"],
    [104, "x", "noseleccionado"],
    [105, "x", "noseleccionado"],
    [106, "x", "noseleccionado"],
    [107, "x", "noseleccionado"],
    [108, "x", "noseleccionado"],
    [109, "x", "noseleccionado"],
    [110, "x", "noseleccionado"],
    [111, "x", "noseleccionado"],
    [112, "x", "noseleccionado"],
    [113, "x", "noseleccionado"],
    [114, "x", "noseleccionado"],

    //Jugador 1
    [115, "jugador1", "noseleccionado"],

    [116, "x", "noseleccionado"],
    [117, "x", "noseleccionado"],
    [118, "x", "noseleccionado"],
    [119, "x", "noseleccionado"],
    [120, "x", "noseleccionado"],
    [121, "x", "noseleccionado"],
    [122, "x", "noseleccionado"],
    [123, "x", "noseleccionado"],
    [124, "x", "noseleccionado"],
    [125, "x", "noseleccionado"],
    [126, "x", "noseleccionado"],
    [127, "x", "noseleccionado"],
    [128, "x", "noseleccionado"],
    [129, "x", "noseleccionado"],
    [130, "x", "noseleccionado"],
    [131, "x", "noseleccionado"],
    [132, "x", "noseleccionado"],
    [133, "x", "noseleccionado"],
    [134, "x", "noseleccionado"],
    [135, "x", "noseleccionado"],
    [136, "x", "noseleccionado"],

    //Jugador 1
    [137, "jugador1", "noseleccionado"],

    [138, "x", "noseleccionado"],
    [139, "x", "noseleccionado"],
    [140, "x", "noseleccionado"],
    [141, "x", "noseleccionado"],
    [142, "x", "noseleccionado"],
    [143, "x", "noseleccionado"],
    [144, "x", "noseleccionado"],
    [145, "x", "noseleccionado"],
    [146, "x", "noseleccionado"],
    [147, "x", "noseleccionado"],
    [148, "x", "noseleccionado"],
    [149, "x", "noseleccionado"],
    [150, "x", "noseleccionado"],
    [151, "x", "noseleccionado"],
    [152, "x", "noseleccionado"],
    [153, "x", "noseleccionado"]
  ];

  //Metodo que reconoce que estamos queriendo hacer cuando tocamos una casilla
  void casillaSeleccionada(int indice) {
    //print("Se selecciono al ${fichas[index - 11][1].toString()}");
    //Si la casilla seleccionada es una casilla disponible para moverse
    if (fichas[indice][1].toString() == "d") {
      fichas[indice][1] = fichaActualSeleccionada;
      fichas[indiceFichaActualSeleccionada][1] = 'x';
      desmarcarTodo();
    }

    //Si la casilla seleccionada contiene cualquiera de las fichas
    else if (fichas[indice][1].toString() != "x" &&
        fichas[indice][2].toString() == 'noseleccionado') {
      desmarcarTodo();
      setState(() {
        indiceFichaActualSeleccionada = indice;
        fichaActualSeleccionada = fichas[indice][1].toString();
        fichas[indice][2] = 'seleccionado';
      });
      if (fichas[indice][1].toString() == 'balon') {
      } else {
        jugadorMarcado(indice);
      }
    }
  }

  void desmarcarTodo() {
    setState(() {
      for (int i = 0; i < fichas.length; i++) {
        fichas[i][2] = 'noseleccionado';
        if (fichas[i][1] == 'd') {
          fichas[i][1] = 'x';
        }
      }
    });
  }

  void jugadorMarcado(int indice) {
    //Mostrar posibles movimientos para Jugador 1
    //setState(() {
    //Movimiento hacia arriba
    if (indice - 11 >= 0 &&
        indice - 11 < 143 &&
        fichas[indice - 11][1] == 'x') {
      fichas[indice - 11][1] = 'd';
    }
    if (indice - (11 * 2) >= 0 &&
        indice - (11 * 2) < 143 &&
        fichas[indice - (11 * 2)][1] == 'x') {
      fichas[indice - (11 * 2)][1] = 'd';
    }

    //Movimiento diagonal arriba-derecha
    if (indice - 10 >= 0 &&
        indice - 10 < 143 &&
        fichas[indice - 10][1] == 'x') {
      fichas[indice - 10][1] = 'd';
    }
    if (indice - (10 * 2) >= 0 &&
        indice - (10 * 2) < 143 &&
        fichas[indice - (10 * 2)][1] == 'x') {
      fichas[indice - (10 * 2)][1] = 'd';
    }

    //Movimiento hacia la derecha
    if (indice + 1 >= 0 && indice + 1 < 143 && fichas[indice + 1][1] == 'x') {
      fichas[indice + 1][1] = 'd';
    }
    if (indice + (1 * 2) >= 0 &&
        indice + (1 * 2) < 143 &&
        fichas[indice + (1 * 2)][1] == 'x') {
      fichas[indice + (1 * 2)][1] = 'd';
    }

    //Movimiento diagonal abajo-derecha
    if (indice + 12 >= 0 &&
        indice + 12 < 143 &&
        fichas[indice + 12][1] == 'x') {
      fichas[indice + 12][1] = 'd';
    }
    if (indice + (12 * 2) >= 0 &&
        indice + (12 * 2) < 143 &&
        fichas[indice + (12 * 2)][1] == 'x') {
      fichas[indice + (12 * 2)][1] = 'd';
    }

    //Movimiento hacia abajo
    if (indice + 11 >= 0 &&
        indice + 11 < 143 &&
        fichas[indice + 11][1] == 'x') {
      fichas[indice + 11][1] = 'd';
    }
    if (indice + (11 * 2) >= 0 &&
        indice + (11 * 2) < 143 &&
        fichas[indice + (11 * 2)][1] == 'x') {
      fichas[indice + (11 * 2)][1] = 'd';
    }

    //Movimiento diagonal abajo-izquierda
    if (indice + 10 >= 0 &&
        indice + 10 < 143 &&
        fichas[indice + 10][1] == 'x') {
      fichas[indice + 10][1] = 'd';
    }
    if (indice + (10 * 2) >= 0 &&
        indice + (10 * 2) < 143 &&
        fichas[indice + (10 * 2)][1] == 'x') {
      fichas[indice + (10 * 2)][1] = 'd';
    }

    //Movimiento hacia la izquierda
    if (indice - 1 >= 0 && indice - 1 < 143 && fichas[indice - 1][1] == 'x') {
      fichas[indice - 1][1] = 'd';
    }
    if (indice - (1 * 2) >= 0 &&
        indice - (1 * 2) < 143 &&
        fichas[indice - (1 * 2)][1] == 'x') {
      fichas[indice - (1 * 2)][1] = 'd';
    }

    //Movimiento diagonal arriba-izquierda
    if (indice - 12 >= 0 &&
        indice - 12 < 143 &&
        fichas[indice - 12][1] == 'x') {
      fichas[indice - 12][1] = 'd';
    }
    if (indice - (12 * 2) >= 0 &&
        indice - (12 * 2) < 143 &&
        fichas[indice - (12 * 2)][1] == 'x') {
      fichas[indice - (12 * 2)][1] = 'd';
    }
    //});
    //Mostrar posibles movimientos para Jugador 2
    //else if (fichas[indice - 11][1].toString() == 'jugador2') {}
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
                          ficha: fichas[indice - 11][1].toString(),
                          estaSeleccionada: fichas[indice - 11][2].toString(),
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
