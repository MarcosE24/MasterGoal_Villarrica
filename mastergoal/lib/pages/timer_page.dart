import 'dart:async';

import 'package:flutter/material.dart';

class TimerPage extends StatefulWidget {
  const TimerPage({super.key});

  @override
  State<TimerPage> createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  late Timer _timer;
  int _start = 120;

  @override
  void initState() {
    super.initState();
    //initState();
    const oneSeg = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSeg,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            Navigator.pushNamed(
              context,
              '/home',
            );
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // initState();
    return Center(
        child: Text(
      '$_start seg',
      textAlign: TextAlign.center,
      style: const TextStyle(
          color: Color.fromARGB(255, 0, 0, 0),
          fontSize: 20,
          fontWeight: FontWeight.bold),
    ));

    /*Text(
      '$_start',
      style: Theme.of(context).textTheme.headline4,
    );*/
  }
}
