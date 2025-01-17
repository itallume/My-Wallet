import 'package:flutter/material.dart';
import 'package:my_wallet/Controller/controller.dart';
import 'package:my_wallet/Models/card_model.dart';
import 'package:my_wallet/Models/topic_model.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
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

class _MyHomePageState extends State<MyHomePage> {
  Controller controller = Controller();
   


  @override
  Widget build(BuildContext context) {
    FutureBuilder<List<Widget>> cardsList = FutureBuilder<List<Widget>>(
        future: controller.getAllCards(context),
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
                  children: snapshot.data!
                ),
              );

          } else {
              return Center(
                child: Text("Nenhum card disponível."),
              );
          }
        },
      );

    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: cardsList
    );
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
  }
}
