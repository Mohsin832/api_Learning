import 'package:flutter/material.dart';

class Apiapp extends StatefulWidget {
  const Apiapp({super.key});

  @override
  State<Apiapp> createState() => _ApiappState();
}

class _ApiappState extends State<Apiapp> {
  int counter = 0;
  @override
  void initState() {
    super.initState();
    loopcounter();
  }

  loopcounter() async {
    for (var i = 0; i < 7; i++) {
      await Future.delayed(Duration(seconds: 3));

      setState(() {
        counter = i;
      });
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [Text(counter.toString(), style: TextStyle(fontSize: 20))],
        ),
      ),
    );
  }
}
