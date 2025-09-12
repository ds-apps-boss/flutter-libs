import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}


class AufgabeOne extends StatelessWidget {
  const AufgabeOne({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              Text("text 1", style: Color(Color.fromARGB(255, 255, 0, 0)),),
              Text("text 2", style: Color(Color.fromARGB(255, 255, 0, 0)),),
              Text("text 3", style: Color(Color.fromARGB(255, 255, 0, 0)),),
              Text("text 4", style: Color(Color.fromARGB(255, 255, 0, 0)),)
            ],),
        ),
      ),
    );
  }
}


class AufgabeTwo extends StatelessWidget {
  const AufgabeTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              Text("text 1"),
              Text("text 2"),
              TextButton(onPressed: null, child: Text("Button", style:(TextStyle(fontSize: 20, Color (Color.fromARGB(255,0,255, 0))))))
              
            ],),
        ),
      ),
    );
  }
}
