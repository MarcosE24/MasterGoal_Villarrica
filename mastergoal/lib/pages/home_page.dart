import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    //Para obtener el texto del nombre ingresado en el login [mauro]
    final nombrelogin = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    //var aa = arguments['exampleArgument'];

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 240,
              decoration: const BoxDecoration(
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(90)),
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
                      height: 140,
                      width: 140,
                      child: Image.asset('assets/logo2.png'),
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 5),
                      alignment: Alignment.bottomRight,
                      //child: Text(nombrelogin['NombreLogin'],
                      child: Text(
                        'Bienvenido, ${nombrelogin['NombreLogin']}',
                        style:
                            const TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(15),
              child: ElevatedButton(
                onPressed: () {
                  //var argument = textoController;
                  Navigator.pushNamed(
                    context,
                    '/game',
                  );
                  //print(textoController.text);
                  //Navigator.pushNamed(context, "/home");
                  //se le agrega la ruta a donde se va a dirigir al darle click [mauro]
                  //Navigator.pushReplacementNamed(context, "/home");
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
                  "Vamos a jugar",
                  style: TextStyle(
                    fontSize: 23.0,
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(15),
              child: ElevatedButton(
                onPressed: () {
                  //var argument = textoController;
                  Navigator.pushNamed(
                    context,
                    '/tutorial',
                  );
                  //print(textoController.text);
                  //Navigator.pushNamed(context, "/home");
                  //se le agrega la ruta a donde se va a dirigir al darle click [mauro]
                  //Navigator.pushReplacementNamed(context, "/home");
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
                  "Tutorial",
                  style: TextStyle(
                    fontSize: 23.0,
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(15),
              child: ElevatedButton(
                onPressed: () {
                  //var argument = textoController;
                  Navigator.pushNamed(
                    context,
                    '/creditos',
                  );
                  //print(textoController.text);
                  //Navigator.pushNamed(context, "/home");
                  //se le agrega la ruta a donde se va a dirigir al darle click [mauro]
                  //Navigator.pushReplacementNamed(context, "/home");
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
                  "Creditos",
                  style: TextStyle(
                    fontSize: 23.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
