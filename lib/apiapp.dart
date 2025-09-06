import 'package:flutter/material.dart';

class Apiapp extends StatefulWidget {
  const Apiapp({super.key});

  @override
  State<Apiapp> createState() => _ApiappState();
}

class _ApiappState extends State<Apiapp> {
  Future<int> futureCounter(number) async {
    await Future.delayed(Duration(seconds: 2));
    return number + number;
  }

  Stream<int> streamCounter(counter) async* {
    while (true) {
      await Future.delayed(Duration(seconds: 2));
      yield counter++;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder(
              future: futureCounter(10),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(
                    "Future  ${snapshot.data.toString()}",
                    style: TextStyle(fontSize: 20),
                  );
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
            StreamBuilder(
              stream: streamCounter(1),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(
                    "Stream ${snapshot.data.toString()}",
                    style: TextStyle(fontSize: 20),
                  );
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
