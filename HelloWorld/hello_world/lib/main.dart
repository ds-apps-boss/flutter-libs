import 'dart:ffi';

import 'package:flutter/material.dart';

void main() {
	final String sOne = "irgendwas";
  runApp(MainApp(textOne: sOne));
}

class MainApp extends StatelessWidget {
	
	final String textOne;// = "hey Jude";

	const MainApp({super.key, required this.textOne});

	@override
	Widget build(BuildContext context) {
    return MaterialApp(
		home: Scaffold(
			appBar: AppBar (
				backgroundColor: Color.fromARGB(255, 13, 14, 102),
				title: const Text("My appBar Text", style: TextStyle(color: Colors.lightGreenAccent, fontSize: 16)),
			),
			body: Center(
				child: Row(
					children: [
						Column (							
							children: [
								Container(
									color: Colors.blueGrey, 
									padding: const EdgeInsets.all(12), 
									child: Text(textOne)
								),
								Container(
									color: Colors.deepOrangeAccent, 
									padding: const EdgeInsets.all(16), 
									child: Text("nochtext", style: TextStyle(height: 25, fontSize: 12),)
								)
								
							]
						),
						Column (
							children: [
								Container(
									color: const Color.fromARGB(255, 198, 36, 36), 
									padding: const EdgeInsets.all(18), 
									child: Text("text nr. 3")
								),
								Container(
									color: const Color.fromARGB(255, 144, 34, 154), 
									padding: const EdgeInsets.all(12), 
									child: Text("fourt text")
								),
								Container(
									color: const Color.fromARGB(255, 32, 181, 15), 
									padding: const EdgeInsets.all(33), 
									child: Text("55555")
								),
								
								
							],
						),
					],
				),
			),
		),
		);
	}
}
		
