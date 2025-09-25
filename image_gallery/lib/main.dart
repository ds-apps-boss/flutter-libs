import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GaleryTabs(),
    );
  }
}

class GalleryItem {
  final String file;
  final String title;
  final String description;
  final DateTime date;

  const GalleryItem({
    required this.file,
    required this.title,
    required this.description,
    required this.date,
  });
}

class GaleryTabs extends StatefulWidget {
  const GaleryTabs({super.key});

  @override
  State<GaleryTabs> createState() => _GaleryTabsState();
}

class _GaleryTabsState extends State<GaleryTabs> {
  int _currentIndex = 0;

  // выбранный элемент (null = показываем сетку)
  GalleryItem? _selected;

  final List<GalleryItem> galleryItems = [
    GalleryItem(
      file: "assets/images/basketball_1.jpeg",
      title: "Bunter Basketball",
      description: "Aufgenommen am See",
      date: DateTime(2024, 7, 15),
    ),
    GalleryItem(
      file: "assets/images/soccer.jpeg",
      title: "Bergpanorama",
      description: "Wanderung in den Alpen",
      date: DateTime(2023, 8, 3),
    ),
    GalleryItem(
      file: "assets/images/basketball_2.jpeg",
      title: "Swish",
      description: "Aufgenommen am See",
      date: DateTime(2023, 7, 5),
    ),
    GalleryItem(
      file: "assets/images/running.jpeg",
      title: "Runners High",
      description: "Früher Morgen",
      date: DateTime(2022, 3, 3),
    ),
    GalleryItem(
      file: "assets/images/tennis_1.jpeg",
      title: "Ball Game",
      description: "Center Court",
      date: DateTime(2024, 9, 25),
    ),
    GalleryItem(
      file: "assets/images/bike.jpeg",
      title: "Trail",
      description: "Achtung Kurve",
      date: DateTime(2025, 2, 21),
    ),
    GalleryItem(
      file: "assets/images/ski.jpeg",
      title: "Adrenalin Pur!",
      description: '''Dies ist ein Blindtext. Er dient nur als Platzhalter und zeigt, wie ein längerer Textblock im Layout wirkt. An ihm kann man sehen, ob alle Buchstaben dargestellt werden und wie Absätze aussehen.

Designer und Entwickler nutzen Blindtexte, um Schriftarten, Abstände und Zeilenumbrüche zu testen. Dabei geht es nicht um Sinn oder Verständlichkeit, sondern um das Erscheinungsbild.

Ein Vorteil von deutschem Blindtext ist, dass er typische Wortlängen und Silbentrennungen abbildet.

Dies ist ein Blindtext. Er dient nur als Platzhalter und zeigt, wie ein längerer Textblock im Layout wirkt. An ihm kann man sehen, ob alle Buchstaben dargestellt werden und wie Absätze aussehen.

Designer und Entwickler nutzen Blindtexte, um Schriftarten, Abstände und Zeilenumbrüche zu testen. Dabei geht es nicht um Sinn oder Verständlichkeit, sondern um das Erscheinungsbild.

Ein Vorteil von deutschem Blindtext ist, dass er typische Wortlängen und Silbentrennungen abbildet.''',
      date: DateTime(2021, 11, 1),
    ),
    GalleryItem(
      file: "assets/images/tennis_2.jpeg",
      title: "Ball Game",
      description: "Abendsonne",
      date: DateTime(2020, 5, 11),
    ),
  ];

  String get _title => switch (_currentIndex) {
        0 => (_selected == null) ? "Galerie" : _selected!.title,
        1 => "About",
        _ => "App",
      };

  void _openDetail(GalleryItem item) {
    setState(() => _selected = item);
  }

  void _closeDetail() {
    setState(() => _selected = null);
  }

  Widget _buildGalleryGrid() {
    return SafeArea(
      child: GridView.builder(
        padding: const EdgeInsets.all(12),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        itemCount: galleryItems.length,
        itemBuilder: (_, i) {
          final item = galleryItems[i];
          return InkWell(
            onTap: () => _openDetail(item),
            child: ClipRRect(
              
              borderRadius: BorderRadius.circular(12),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color.fromARGB(16, 0, 0, 0),
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: AssetImage(item.file),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(200, 251, 249, 249),
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                      ),
                    ),
                    
                    padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                    child: Text(
                      item.title,
                      style: const TextStyle(
                        color: Colors.black87,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildDetail(GalleryItem item) {

  String formatDate(DateTime d) {
    final day = d.day.toString().padLeft(2, '0');
    final month = d.month.toString().padLeft(2, '0');
    final year = d.year.toString();
    return "$day.$month.$year";
  }

  return SafeArea(
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          
          Image.asset(
            item.file,
            fit: BoxFit.fitWidth,
            width: double.infinity,
          ),

          const SizedBox(height: 16),
          
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              item.title,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(height: 8),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              formatDate(item.date),
              //'${item.date.day}.${item.date.month}.${item.date.year}',
              style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
          ),

          const SizedBox(height: 16),

          
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              item.description,
              textAlign: TextAlign.justify,
              style: const TextStyle(fontSize: 16, height: 1.4),
            ),
          ),
        ],
      ),
    ),
  );
}

  Widget _buildGallery() {
    if (_selected == null) return _buildGalleryGrid();
    return _buildDetail(_selected!);
  }

  Widget _buildAbout() {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                CircleAvatar(
                  radius: 100,
                  backgroundImage: AssetImage("assets/images/kaya.jpeg"),
                ),
                SizedBox(height: 16),
                Text(
                  "Kaya Müller",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 30),
                ),
                Text(
                  "Fotograf",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                ),
                SizedBox(height: 22),
                Text(
                  '''Mein Name ist Kaya Müller, ein Fotograf im Alter von 32 Jahren, der die Welt durch die Linse entdeckt. Mit einem Hintergrund in der visuellen Kunst und jahrelanger Erfahrung in der Fotografie habe ich einen Blick für die Schönheit im Alltäglichen entwickelt. Meine Spezialität liegt in der Sport- und Naturfotografie, wo ich das Spiel von Licht und Schatten einfange, um emotionale und aussagekräftige Bilder zu schaffen.

Ich glaube daran, dass jeder Moment einzigartig ist und seine eigene Geschichte erzählt. In meinen Arbeiten strebe ich danach, diese Geschichten visuell zu interpretieren und sie durch kreative Kompositionen und Nuancen zum Leben zu erwecken. Meine fotografische Reise hat mich durch verschiedene Länder geführt, wo ich die Vielfalt der Kulturen und Landschaften festhalte, immer auf der Suche nach neuen Perspektiven und Herausforderungen.

Mein Anspruch ist es, mit meinen Bildern nicht nur zu dokumentieren, sondern auch zu inspirieren und zu berühren. Jeder Auftrag und jedes Projekt ist für mich eine Möglichkeit, meine Leidenschaft und mein Können zu zeigen und eine Verbindung zwischen dem Betrachter und dem Bild herzustellen.''',
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screens = [
      _buildGallery(),
      _buildAbout(),
    ];

    return WillPopScope(
      onWillPop: () async {
        if (_currentIndex == 0 && _selected != null) {
          _closeDetail();
          return false;
        }
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF66001F),
          title: Text(
            _title,
            style: const TextStyle(color: Colors.white),
          ),
          leading: (_currentIndex == 0 && _selected != null)
              ? IconButton(
                  onPressed: _closeDetail,
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                )
              : null,
        ),
        body: IndexedStack(
          index: _currentIndex,
          children: screens,
        ),
        bottomNavigationBar: NavigationBar(
          selectedIndex: _currentIndex,
          onDestinationSelected: (index) {
            setState(() {
              if (index == 0 && _selected != null) {
                _selected = null; // zurück zur Grid-Ansicht
              }
              _currentIndex = index;
            });
          },
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.photo_library),
              label: 'Bilder',
            ),
            NavigationDestination(
              icon: Icon(Icons.info_outline),
              label: 'Über mich',
            ),
          ],
        ),
      ),
    );
  }
}