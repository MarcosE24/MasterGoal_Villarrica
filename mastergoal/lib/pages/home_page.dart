import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    //Para obtener el texto del nombre ingresado en el login
    final nombrelogin = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    //var aa = arguments['exampleArgument'];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: Center(
        //se agrega un texto a la pagina [mauro]
        child: Text(nombrelogin['NombreLogin']),
      ),
    );
  }
}
