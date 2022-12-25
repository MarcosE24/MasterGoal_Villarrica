import 'dart:async';

import 'package:flutter/material.dart';

class TimerPage extends StatefulWidget {
  const TimerPage({super.key});

  @override
  State<TimerPage> createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  late Timer _timer;
  int _start = 5;

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
    return Text(
      '$_start',
      style: Theme.of(context).textTheme.headline4,
    );
  }
}
