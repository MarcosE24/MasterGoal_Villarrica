import 'package:flutter/material.dart';
import 'home_page.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController NombreTextField = TextEditingController(text: "");

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              decoration: BoxDecoration(
                borderRadius:
                    const BorderRadius.only(bottomLeft: Radius.circular(90)),
                color: Colors.green.shade800,
                gradient: const LinearGradient(
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
                      height: 300,
                      width: 300,
                      child: Image.asset('assets/logo.png'),
                    )
                  ],
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(
                  left: 20, right: 20, top: 70, bottom: 30),
              padding: const EdgeInsets.only(left: 20, right: 20),
              height: 54,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.grey[200],
                boxShadow: const [
                  BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 50,
                      color: Color(0xffEEEEEE)),
                ],
              ),
              child: TextField(
                controller: NombreTextField,
                cursorColor: const Color(0xff2aac4a),
                decoration: const InputDecoration(
                  icon: Icon(
                    Icons.supervised_user_circle,
                    color: Color(0xff2aac4a),
                  ),
                  hintText: "Ingresar Nombre",
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                //var argument = textoController;
                Navigator.pushNamed(
                  context,
                  '/home',
                  arguments: {'NombreLogin': NombreTextField.text},
                );
                //print(textoController.text);
                //Navigator.pushNamed(context, "/home");
                //se le agrega la ruta a donde se va a dirigir al darle click [mauro]
                //Navigator.pushReplacementNamed(context, "/home");
              },
              style: ElevatedButton.styleFrom(
                //elevation: 10.0,
                minimumSize: const Size(100, 40),
                primary: const Color(0xff2aac4a),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              child: const Text("Ingresar"),
            )
          ],
        ),
      ),
    );
  }
}

/*
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    //Objeto para guardar el nombre del jugador [mauro]
    TextEditingController NombreTextField = TextEditingController(text: "");
    //var textoController = '';


    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            width: Get.width,
            height: Get.height,
            child: Column(
              children: [BackgroundIcon()],
            ),
          ),
          Container(
              padding: const EdgeInsets.all(20),
              child: TextField(
                controller: NombreTextField,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    fillColor: Color.fromARGB(255, 223, 223, 223),
                    filled: true,
                    hintText: "Ingrese su nombre"),
              )),
          ElevatedButton(
            onPressed: () {
              //var argument = textoController;
              Navigator.pushNamed(
                context,
                '/home',
                arguments: {'NombreLogin': NombreTextField.text},
              );
              //print(textoController.text);
              //Navigator.pushNamed(context, "/home");
              //se le agrega la ruta a donde se va a dirigir al darle click [mauro]
              //Navigator.pushReplacementNamed(context, "/home");
            },
            child: const Text("Ingresar"),
          )
        ],
      ),
    );
  }
}*/
