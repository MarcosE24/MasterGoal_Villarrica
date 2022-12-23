import 'package:flutter/material.dart';

class TutorialPage5 extends StatefulWidget {
  const TutorialPage5({super.key});

  @override
  State<TutorialPage5> createState() => _TutorialPage5State();
}

class _TutorialPage5State extends State<TutorialPage5> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 40,
              ),
              padding: const EdgeInsets.only(left: 10, right: 10),
              height: 200,
              child: ListView(
                children: const [
                  Card(
                    color: Color(0xff2aac4a),
                    child: ListTile(
                      title: Text(
                        "Goles",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                          //fontFamily: "Gilroy",
                          //fontWeight: FontWeight.normal,
                        ),
                      ),
                      subtitle: Text(
                        "Los arcos son los espacios en blanco y los goles se pueden meter desde todas las direcciones, el partido termina al marcar 2 goles",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          //fontFamily: "Gilroy",
                          //fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 450,
              decoration: const BoxDecoration(
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(100)),
                color: Color(0xff2aac4a),
                gradient: LinearGradient(
                  colors: [(Color(0xff2aac4a)), Color(0xff2aac4a)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 400,
                      width: 400,
                      child: Image.asset('assets/T5.png'),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      //var argument = textoController;
                      Navigator.pushReplacementNamed(
                        context,
                        '/home',
                      );
                      //print(textoController.text);
                      //Navigator.pushNamed(context, "/home");
                      //se le agrega la ruta a donde se va a dirigir al darle click [mauro]
                      //Navigator.pushReplacementNamed(context, "/home");
                    },
                    style: ElevatedButton.styleFrom(
                      //elevation: 10.0,
                      minimumSize: const Size(100, 50),
                      primary: const Color(0xff2aac4a),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    child: const Text(
                      "Menu",
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: ElevatedButton(
                      onPressed: () {
                        //var argument = textoController;
                        Navigator.pushNamed(
                          context,
                          '/tutorial4',
                        );
                        //print(textoController.text);
                        //Navigator.pushNamed(context, "/home");
                        //se le agrega la ruta a donde se va a dirigir al darle click [mauro]
                        //Navigator.pushReplacementNamed(context, "/home");
                      },
                      style: ElevatedButton.styleFrom(
                        //elevation: 10.0,
                        minimumSize: const Size(100, 50),
                        primary: const Color(0xff2aac4a),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      child: const Text(
                        "Atras",
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: ElevatedButton(
                      onPressed: () {
                        //var argument = textoController;
                        Navigator.pushNamed(
                          context,
                          '/tutorial6',
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        //elevation: 10.0,
                        minimumSize: const Size(100, 50),
                        primary: const Color(0xff2aac4a),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      child: const Text(
                        "Despues",
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
