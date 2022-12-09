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
    return Scaffold(
      appBar: AppBar(
        //titulo de la pagina [mauro]
        title: const Text("Login Page"),
      ),
      body: Center(
        //se crea el primer boton del login [mauro]
        child: ElevatedButton(
            onPressed: () {
              //Navigator.pushNamed(context, "/home");

              //se le agrega la ruta a donde se va a dirigir al darle click [mauro]
              Navigator.pushReplacementNamed(context, "/home");
            },
            //se agrega el texto del boton [mauro]
            child: const Text("Ingresar")),
      ),
    );
  }
}
