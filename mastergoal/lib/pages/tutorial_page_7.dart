import 'package:flutter/material.dart';

class TutorialPage7 extends StatefulWidget {
  const TutorialPage7({super.key});

  @override
  State<TutorialPage7> createState() => _TutorialPage7State();
}

class _TutorialPage7State extends State<TutorialPage7> {
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
                        "Casilla Neutra",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                          //fontFamily: "Gilroy",
                          //fontWeight: FontWeight.normal,
                        ),
                      ),
                      subtitle: Text(
                        "La neutralidad se rompe cuando se obtiene una mayoria por parte de un equipo",
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
                      child: Image.asset('assets/T7.png'),
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
                          '/tutorial6',
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
                          '/tutorial8',
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
