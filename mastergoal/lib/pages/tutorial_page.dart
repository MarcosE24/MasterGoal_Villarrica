import 'package:flutter/material.dart';

class TutorialPage extends StatefulWidget {
  const TutorialPage({super.key});

  @override
  State<TutorialPage> createState() => _TutorialPageState();
}

class _TutorialPageState extends State<TutorialPage> {
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
                top: 50,
              ),
              padding: const EdgeInsets.only(left: 10, right: 10),
              height: 200,
              child: ListView(
                children: const [
                  Card(
                    color: Color(0xff2aac4a),
                    child: ListTile(
                      title: Text(
                        "Jugadores",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                          //fontFamily: "Gilroy",
                          //fontWeight: FontWeight.normal,
                        ),
                      ),
                      subtitle: Text(
                        "El juego está conformado por 2 equipos representados por las fichas rojas y blancas",
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
                      child: Image.asset('assets/T1.png'),
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
                          '/tutorial2',
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
