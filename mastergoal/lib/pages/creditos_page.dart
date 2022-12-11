import 'package:flutter/material.dart';

class CreditosPage extends StatefulWidget {
  const CreditosPage({super.key});

  @override
  State<CreditosPage> createState() => _CreditosPageState();
}

class _CreditosPageState extends State<CreditosPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        //se agrega un texto a la pagina [mauro]
        child: Text('Hola Creditos'),
      ),
    );
  }
}
