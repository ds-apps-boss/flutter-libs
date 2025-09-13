import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {

  
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {

    final bLabels = ["A", "B", "C"];

    final List<Color> bColors = [
    Color.fromARGB(255, 250, 16, 16),
    Color.fromARGB(255, 57, 148, 21),
    Color.fromARGB(255, 29, 42, 195),
    Color.fromARGB(255, 20, 117, 251),
    Color.fromARGB(255, 230, 187, 71),
    Color.fromARGB(255, 114, 62, 122),
    Color.fromARGB(255, 0, 0, 0),
  ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Aufgabe 1"),
          backgroundColor: bColors[3],
          ),
        body: Center(
         child: Column (         
          children: [

            Padding(padding: const EdgeInsets.only(top: 80.0)),

          for (var row = 0; row < 2; row++)

            SizedBox(
              width: double.infinity,
              child: 
                Text(
                  "Hallo App Akadiemie!", 
                  textAlign: TextAlign.left,
                  style: TextStyle(              
                    height: 3.0,
                    color: bColors[3],
                    fontSize: 24,              
                    fontWeight: FontWeight.w800
                  ),            
                ),
              ),
            
            Column(children: [

          for (var row = 0; row < 2; row++)

              Row(children: [

            for (var col = 0; col < 3; col++)

                Container(
                  color:bColors[col],
                  margin: const EdgeInsets.all(8.0),
                  width: 124.0,
                  height: 124.0,
                  alignment: Alignment.center,
                  child: FilledButton(
                    style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll<Color>(bColors[5]),
                    fixedSize: WidgetStatePropertyAll<Size>(Size(30.0,10.0))
                    ),
                  onPressed: null, 
                  child: Text(
                    bLabels[col], 
                    style: TextStyle(
                      color: bColors[4],
                      fontWeight: FontWeight.w800
                      )
                    ),
                  )
                ),

              ],)
            ],),

 for (var rows=0; rows<2; rows++)
 
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: Row(
              children: [
                for (var cols=0; cols<2; cols++)
                Expanded(
                child: 
                  Container(
                    height: 100,
                    //color: bColors[cols],
                    child: 
                      
                      Icon(
                        Icons.face, 
                        size: 40.0, 
                        color: bColors[6],
                      ),
                  )   
              ),
                
              ],
            ),
          ),


/*
Padding(
  padding: const EdgeInsets.symmetric(horizontal: 50.0),
  child: Row(
    children: [
      for (var cols = 0; cols < 2; cols++)
        Expanded(
          child: SizedBox(
            height: 100,
            child: Center(
              child: Icon(
                Icons.face,
                size: 40.0,
                color: bColors[6],
              ),
            ),
          ),
        ), 
    ],
  ),
)
*/



         ],)
        ),
      ),
    );
  }
}
