import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flex-Demo mit Slider',
      home: const FlexScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class FlexScreen extends StatefulWidget {
  const FlexScreen({super.key});

  @override
  State<FlexScreen> createState() => _FlexScreenState();
}

class _FlexBox extends StatelessWidget {
  const _FlexBox({required this.color, required this.label});

  final Color color;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      alignment: Alignment.center,
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
      ),
    );
  }
}

class _FlexScreenState extends State<FlexScreen> {
  int _flexTwo = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Slider
            Padding(
              padding: const EdgeInsets.all(24),
              child: Row(
                children: [
                  const Text("1"),
                  Expanded(
                    child: Slider(
                      value: _flexTwo.toDouble(),
                      min: 1,
                      max: 5,
                      divisions: 4,
                      label: "$_flexTwo",
                      onChanged: (v) {
                        setState(() {
                          _flexTwo = v.round();
                        });
                      },
                    ),
                  ),
                  const Text("5"),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                'Mittlerer flex: $_flexTwo',
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
            ),

            Expanded(
              child: Column(
                children: [

                  // flex 1
                  Expanded(
                    flex: 1,
                    child: _FlexBox(
                      color: Colors.blue.shade300,
                      label: 'flex = 1 (oben)',
                    ),
                  ),

                  // flex 2
                  Expanded(
                    flex: _flexTwo,            //!!!
                    child: _FlexBox(
                      color: Colors.orange.shade400,
                      label: 'flex = $_flexTwo (mitte)',
                    ),
                  ),

                  // flex 3
                  Expanded(
                    flex: 1,
                    child: _FlexBox(
                      color: Colors.green.shade400,
                      label: 'flex = 1 (unten)',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}