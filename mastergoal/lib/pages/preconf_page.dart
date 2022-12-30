import 'package:flutter/material.dart';

class PreConf extends StatefulWidget {
  const PreConf({super.key});

  @override
  State<PreConf> createState() => _PreConfState();
}

class _PreConfState extends State<PreConf> {
  bool? _checkTimer = false;
  bool? _checkGoal = true;
  bool? _checkRojo = true;
  bool? _checkAzul = false;
  String tiempo = "";

  //Widget que se muestra solo si se selecciona jugar por tiempo
  Widget establecerTiempo() {
    if (_checkTimer == true) {
      return SizedBox(
        width: 130,
        child: TextField(
          onSubmitted: (value) {
            setState(() {
              tiempo = value;
            });
          },
          keyboardType: TextInputType.number,
          style: const TextStyle(fontSize: 17),
          maxLength: 3,
          textAlign: TextAlign.center,
          decoration: const InputDecoration(
              prefixIcon: Icon(Icons.alarm),
              //hintText: "Tiempo en minutos",
              helperText: "Tiempo en Minutos"),
        ),
      );
    }
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(children: [
        //Container de Configuracion
        Container(
          color: const Color(0xff2aac4a),
          alignment: Alignment.center,
          margin: const EdgeInsets.only(
            top: 50,
          ),
          height: 100,
          child: const Text(
            "Configuracion",
            style: TextStyle(
                color: Colors.white, fontSize: 35, fontWeight: FontWeight.bold),
          ),
        ),
        //Container de Eleija un modo de Juego
        Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.only(top: 30, bottom: 10),
          child: const Text(
            "Elija un modo de Juego",
            style: TextStyle(fontSize: 20),
          ),
        ),
        //CheckBox Jugar por Tiempo
        CheckboxListTile(
          title: const Text("Jugar por Tiempo"),
          controlAffinity: ListTileControlAffinity.platform,
          value: _checkTimer,
          onChanged: (bool? value) {
            setState(() {
              _checkGoal = _checkTimer;
              _checkTimer = value;
              //establecerTiempo();
            });
          },
          activeColor: Colors.green,
          checkColor: Colors.black,
        ),
        //Se ejecuta validando si se ha seleccionado el checkbox anterior
        establecerTiempo(),
        //CheckBox Jugar por Goles
        CheckboxListTile(
          title: const Text("Jugar por Goles"),
          // secondary: Icon(Icons.beach_access),
          controlAffinity: ListTileControlAffinity.platform,
          value: _checkGoal,
          onChanged: (bool? value) {
            setState(() {
              _checkTimer = _checkGoal;
              _checkGoal = value;
            });
          },
          activeColor: Colors.green,
          checkColor: Colors.black,
        ),
        //Container de Elija un Equipo
        Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.only(top: 30, bottom: 10),
          child: const Text(
            "Elija un Equipo",
            style: TextStyle(fontSize: 20),
          ),
        ),
        //CheckBox Equipo Rojo
        CheckboxListTile(
          title: const Text("Equipo Rojo"),
          secondary: Image.asset('assets/jugador1.png'),
          controlAffinity: ListTileControlAffinity.platform,
          value: _checkRojo,
          onChanged: (bool? valued) {
            setState(() {
              _checkAzul = _checkRojo;
              _checkRojo = valued;
            });
          },
          activeColor: Colors.green,
          checkColor: Colors.black,
        ),
        //CheckBox Equipo Azul
        CheckboxListTile(
          title: const Text("Equipo Azul"),
          secondary: Image.asset('assets/jugador2.png'),
          controlAffinity: ListTileControlAffinity.platform,
          value: _checkAzul,
          onChanged: (bool? valued) {
            setState(() {
              _checkRojo = _checkAzul;
              _checkAzul = valued;
            });
          },
          activeColor: Colors.green,
          checkColor: Colors.black,
        ),
        //Container del boton Iniciar Partida
        Container(
          margin: const EdgeInsets.only(top: 40),
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                '/game',
                arguments: {
                  'timerChecked': _checkTimer.toString(),
                  'equipSelected': _checkRojo.toString(),
                  "Tiempo": tiempo
                },
              );
            },
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(300, 60),
              backgroundColor: const Color(0xff2aac4a),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
            ),
            child: const Text(
              "Iniciar Partida",
              style: TextStyle(
                fontSize: 23.0,
              ),
            ),
          ),
        ),
      ]),
    ));
  }
}
