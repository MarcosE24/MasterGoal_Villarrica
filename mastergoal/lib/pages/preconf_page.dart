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
  bool? _checkBlanca = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //appBar: AppBar(),
        body: Column(children: [
      Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(
          left: 20,
          right: 20,
          top: 250,
        ),
        padding: const EdgeInsets.only(left: 10, right: 10),
        height: 200,
        child: ListView(
          children: const [
            Card(
              color: Color(0xff2aac4a),
              child: ListTile(
                title: Text(
                  "Configuracion",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    //fontFamily: "Gilroy",
                    //fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      CheckboxListTile(
        title: Text("Jugar por Minutos"),
        controlAffinity: ListTileControlAffinity.platform,
        value: _checkTimer,
        //child: Image.asset('assets/jugador1.png'),
        onChanged: (bool? value) {
          setState(() {
            _checkGoal = _checkTimer;
            _checkTimer = value;
          });
        },
        activeColor: Colors.green,
        checkColor: Colors.black,
      ),
      CheckboxListTile(
        title: Text("Jugar por Goles"),
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
      CheckboxListTile(
        title: Text("Camiseta Roja"),
        secondary: Image.asset('assets/jugador1.png'),
        controlAffinity: ListTileControlAffinity.platform,
        value: _checkRojo,
        //child: Image.asset('assets/jugador1.png'),
        onChanged: (bool? valued) {
          setState(() {
            _checkBlanca = _checkRojo;
            _checkRojo = valued;
          });
        },
        activeColor: Colors.green,
        checkColor: Colors.black,
      ),
      CheckboxListTile(
        title: Text("Camiseta Azul"),
        secondary: Image.asset('assets/jugador2.png'),
        controlAffinity: ListTileControlAffinity.platform,
        value: _checkBlanca,
        //child: Image.asset('assets/jugador1.png'),
        onChanged: (bool? valued) {
          setState(() {
            _checkRojo = _checkBlanca;
            _checkBlanca = valued;
          });
        },
        activeColor: Colors.green,
        checkColor: Colors.black,
      ),
      Container(
        margin: const EdgeInsets.all(15),
        child: ElevatedButton(
          onPressed: () {
            //var argument = textoController;
            Navigator.pushNamed(
              context,
              '/game',
              arguments: {
                'NombreLogin': _checkTimer.toString(),
                'NombreUser': _checkRojo.toString()
              },
              //arguments: {'NombreLogin': _checkTimer.toString()},
            );
          },
          style: ElevatedButton.styleFrom(
            //elevation: 10.0,
            minimumSize: const Size(300, 60),
            primary: const Color(0xff2aac4a),
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
    ]));
  }
}
