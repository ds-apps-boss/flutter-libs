import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        
        body: SafeArea(
          child: Center(
           child: Column(
              children: [
                Expanded(
                  flex: 20,                  
                  child: Center(                  
                    child: Text(
                      "Wilkommen zur App",
                      style: TextStyle (
                        fontSize: 32.0,
                        fontWeight: FontWeight.w800
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Expanded(
                  flex: 60,
                  child: Image.network(
                    'https://picsum.photos/800/600', 
                    fit: BoxFit.contain,             // füllt Fläche, behält Seitenverhältnis
                    width: double.infinity,          // nimmt gesamte Breite
                    height: double.infinity,         // nimmt gesamte Höhe
                  ),
                ),
                Expanded(
                  flex: 20,
                  child: Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Text(
                      style: TextStyle (
                        fontSize: 18.0
                      ),
                      "Diese App macht nicht viel – aber sie läuft!  Verspreche's!",                    
                    ),
                  ),
                ),           

              ],
            )
          ),
        ),
      ),
    );
  }
}
