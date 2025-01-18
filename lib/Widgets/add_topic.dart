import 'package:flutter/material.dart';
import 'package:my_wallet/Controller/controller.dart';

class AddTopic extends StatefulWidget{
  final int cardId;
  const AddTopic({super.key, required this.cardId});

  @override
  State<StatefulWidget> createState() => _AddTopic();
}

class _AddTopic extends State<AddTopic>{
  Controller controller = Controller();
  bool activeForm = false;
  TextEditingController topicNameController = TextEditingController();
  TextEditingController topicContentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (activeForm){
      return Container(
        margin: EdgeInsets.only(top: 25),
        child: Column( 
          spacing: 10,
          children: [
        TextField( 
          controller: topicNameController,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: "Digite o nome do tópico"
            ),),
        
        TextField(
          maxLines: null,
          controller: topicContentController,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: "Digite o dado"
        ),),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 15,
          children: [
          TextButton(
            onPressed: ()=>{
            setState(() {
              activeForm = !activeForm;
            })
          },
           child: Text(
            "Cancelar",
            style: TextStyle(fontSize: 20),
            )),
        
          TextButton(
            onPressed: ()=>{
              controller.addTopicToCard(topicNameController.text, topicContentController.text, widget.cardId),
              setState(() {
                activeForm = !activeForm;
              })
          }, child: Text("Criar",
          style: TextStyle(fontSize: 20,)
          ,))
        ],)
            ],
            ),
      );
    }
    return InkWell(
        onTap: () => {
          setState(() {
            activeForm = !activeForm;
        }),
        },
        child: Center(child: Icon(
          Icons.add,
          color: Colors.black,
          size: 40,
        )),
      );
  }

  

}