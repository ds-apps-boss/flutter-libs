import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int _counter = 0;

  void _increm() {
    setState((){
      _counter++;
    });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          
          child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("$_counter", style: TextStyle(fontSize: 40, backgroundColor: Color.fromARGB(255, 216, 219, 159)),),
              ElevatedButton(onPressed: _increm, child: Text("+"))
              //TextButton(onPressed: null, child: Text("Press")),
            ],
          ),
        ),
      ),
    );
  }
}
