import 'package:flutter/material.dart';

class CreditosPage extends StatefulWidget {
  const CreditosPage({super.key});

  @override
  State<CreditosPage> createState() => _CreditosPageState();
}

class _CreditosPageState extends State<CreditosPage> {
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
                        "Creditos",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          //fontFamily: "Gilroy",
                          //fontWeight: FontWeight.normal,
                        ),
                      ),
                      subtitle: Text(
                        "- Mauro Giménez"
                        "\n- Nelson Bogado"
                        "\n- Julia Recalde"
                        "\n- Marcos Escobar"
                        "\n",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
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
              margin: const EdgeInsets.all(10),
              child: ElevatedButton(
                onPressed: () {
                  //var argument = textoController;
                  Navigator.pushNamed(
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
                  minimumSize: const Size(180, 60),
                  primary: const Color(0xff2aac4a),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                child: const Text(
                  "Menú",
                  style: TextStyle(
                    fontSize: 26.0,
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
