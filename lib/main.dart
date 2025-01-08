import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            width: MediaQuery.sizeOf(context).width,
            child: Card(
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsetsDirectional.only(bottom: 10),
                      child: Text("Dados Pessoais",
                       style: TextStyle(fontSize: 30,),
                    )),
                    DefaultTextStyle(
                      style: TextStyle(fontSize: 20, color: Colors.black),
                      softWrap: true,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Text("Nome completo: "),
                        Container(
                          margin: EdgeInsets.only(bottom: 5),
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 5),
                                width: MediaQuery.sizeOf(context).width * 0.8,
                                child: Text(
                                  "Conceição Maria da Costa Oliveia",
                                  softWrap: false,
                                  overflow: TextOverflow.ellipsis, 
                                ),
                              ),
                              
                              InkWell(
                                onTap: (){
                                  Clipboard.setData(ClipboardData(text: "Conceição Maria da Costa Oliveia"));
                                  ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Texto copiado!')));
                                },
                                child: Icon(
                                  Icons.content_copy,
                                  color: Colors.black,
                                  size: 25,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
              ],),
            )
          )),
        ]),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: ,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
