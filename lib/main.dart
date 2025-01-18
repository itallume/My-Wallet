import 'package:flutter/material.dart';
import 'package:my_wallet/Controller/controller.dart';
import 'package:my_wallet/Widgets/create_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 26, 147, 111)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Minha carteira'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

@override
class _MyHomePageState extends State<MyHomePage> {
  late Future<List<Widget>> _cardsFuture;
  final controller = Controller();
  
  void _loadCards() {
    setState(() {
      _cardsFuture = controller.getAllCards();
    });
  }

  @override
  void initState() {
    super.initState();
    _cardsFuture = controller.getAllCards();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () => _loadCards(),
          ),
        ],
      ),
      body: FutureBuilder<List<Widget>>(
        future: _cardsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                "Erro ao carregar cards: ${snapshot.error}",
                style: TextStyle(color: Colors.red),
              ),
            );
          } else if (snapshot.hasData) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  ...snapshot.data!,
                  CreateCard(),
                ]
              ),
            );
          } else {
            return Center(
              child: Text("Nenhum card disponível."),
            );
          }
        },
      ),
    );
  }
}
    // return Scaffold(
    //   appBar: AppBar(
    //     backgroundColor: Theme.of(context).colorScheme.inversePrimary,
    //     title: Text(widget.title),
    //   ),
    //   body: Column(
    //     children: controller.getAllCards(context)),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: ,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    //);

