import 'package:flutter/material.dart';
import 'home_page.dart';

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
      appBar: AppBar(
        //titulo de la pagina [mauro]
        title: const Text("Login Page"),
      ),
      body: Column(
        children: [
          Container(
              padding: const EdgeInsets.all(20),
              child: TextField(
                controller: NombreTextField,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    fillColor: Color.fromARGB(255, 236, 235, 235),
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
}
