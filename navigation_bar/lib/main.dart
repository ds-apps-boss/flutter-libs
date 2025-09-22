import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

/// App-Root
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NavigationBar – Aufgabe',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const NavigationBarExample(),
    );
  }
}

/// Haupt-Screen mit NavigationBar + IndexedStack
class NavigationBarExample extends StatefulWidget {
  const NavigationBarExample({super.key});

  @override
  State<NavigationBarExample> createState() => _NavigationBarExampleState();
}

class _NavigationBarExampleState extends State<NavigationBarExample> {
  int _index = 0;

  /// Zähler für 3 Container
  final List<int> _counts = [0, 0, 0];

  /// Inkrementiert den i-ten Container
  void _increment(int i) {
    setState(() {
      _counts[i]++;
    });
  }

  String get _title => switch (_index) {
        0 => 'Liste',
        1 => 'Info',
        _ => 'App',
      };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),

      /// Wichtig: IndexedStack hält den State der Seiten
      body: IndexedStack(
        index: _index,
        children: [
          ListPage(counts: _counts, onTap: _increment),
          InfoPage(counts: _counts),
        ],
      ),

      bottomNavigationBar: NavigationBar(
        selectedIndex: _index,
        onDestinationSelected: (i) => setState(() => _index = i),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.list), label: 'Liste'),
          NavigationDestination(icon: Icon(Icons.info), label: 'Info'),
        ],
      ),
    );
  }
}

/// Seite 0 (Liste): Drei klickbare Container, jeder zählt für sich.
/// Ab 5 Klicks wird der Container grün.
class ListPage extends StatelessWidget {
  const ListPage({
    super.key,
    required this.counts,
    required this.onTap,
  });

  final List<int> counts;
  final void Function(int index) onTap;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(12),
      itemCount: counts.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (_, i) {
        final value = counts[i];
        final bool reached = value >= 5;

        return InkWell(
          onTap: () => onTap(i),
          borderRadius: BorderRadius.circular(12),
          child: Container(
            height: 84,
            decoration: BoxDecoration(
              color: reached ? Colors.green.shade400 : Colors.grey.shade300,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                'Container #${i + 1} — Klicks: $value',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: reached ? Colors.white : Colors.black87,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

/// Seite 1 (Info): Summe aller Klicks anzeigen
class InfoPage extends StatelessWidget {
  const InfoPage({super.key, required this.counts});

  final List<int> counts;

  @override
  Widget build(BuildContext context) {
    final sum = counts.fold<int>(0, (a, b) => a + b);
    return Center(
      child: Text(
        'Gesamte Klicks: $sum',
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}