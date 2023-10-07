import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Namer App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();

  // ↓ Add this.
  void getNext() {
    current = WordPair.random();
    notifyListeners();
  }

  // ↓ Add the code below.
  var favorites = <WordPair>[];
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var pair = appState.current;
    final theme = Theme.of(context); // ← Add this.
    final style = theme.textTheme.displayMedium!.copyWith();

    IconData icon;
    if (appState.favorites.contains(pair)) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Rm. Sedap Rasa",
                style: style,
              ),
              BigCard(paire: pair),
              SizedBox(height: 20),
              Row(
                mainAxisSize: MainAxisSize.min, // ← Add this.
                children: [
                  Icon(
                    Icons.email,
                    color: Colors.pink,
                    size: 24.0,
                    semanticLabel: 'Text to announce in accessibility modes',
                  ),
                  Icon(
                    Icons.map,
                    color: Colors.green,
                    size: 30.0,
                  ),
                  Icon(
                    Icons.account_circle,
                    color: Colors.blue,
                    size: 36.0,
                  ),
                ],
              ),
              SizedBox(height: 20),
              ListTile(
                title: Text('Deskripsi :'),
              ),
              Text(
                "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?",
              ),
              SizedBox(height: 20),
              ListTile(
                title: Text('List menu :'),
              ),
              ListTile(
                leading: Icon(Icons.label),
                title: Text('Bakso kuah sapi'),
              ),
              ListTile(
                leading: Icon(Icons.label),
                title: Text('Rendang sapi'),
              ),
              ListTile(
                leading: Icon(Icons.label),
                title: Text('Sapi guling'),
              ),
              SizedBox(height: 20),
              ListTile(
                title: Text('Alamat :'),
              ),
              ListTile(
                title: Text("Kebumen, jawa tengah"),
              ),
              SizedBox(height: 20),
              ListTile(
                title: Text('Jam buka :'),
              ),
              ListTile(
                title: Text('- Sabtu = 07:00-18:00'),
              ),
              ListTile(
                title: Text('- Minggu = 07:00-18:00'),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

class BigCard extends StatelessWidget {
  const BigCard({
    super.key,
    required this.paire,
  });

  final WordPair paire;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(0),
        // ↓ Make the following change.
        child: Image.network(
            'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
      ),
    );
  }
}
