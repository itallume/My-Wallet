import 'package:flutter/material.dart';
import 'package:my_wallet/Controller/controller.dart';

class CreateCard extends StatefulWidget{
  const CreateCard({super.key});

  @override
  State<StatefulWidget> createState() => _CreateCard();
}

class _CreateCard extends State<CreateCard>{
  Controller controller = Controller();
  bool activeForm = false;
  TextEditingController titleTextController = TextEditingController();
  

  @override
  Widget build(BuildContext context) {
    if (activeForm){
      return Container(

      margin: EdgeInsets.only(bottom: 25),
      height: 200,
      child: Card(
        color: Color.fromARGB(255, 185, 219, 195),
        child: Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.only(top: 25),
          child: Column( 
            spacing: 10,
            children: [
              TextField( 
                controller: titleTextController,
                decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Dê um nome para o cartão"
            ),
          ),
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
              controller.createCard(titleTextController.text),
              setState(() {
                activeForm = !activeForm;
              })
          }, child: Text("Criar",
          style: TextStyle(fontSize: 20,)
          ,))
        ],)
            ],
            ),
      )));
    }
    return Container(
      margin: EdgeInsets.only(bottom: 25),
      height: 200,
      child: Card(
        color: Color.fromARGB(255, 185, 219, 195),
          child: Center(
          child: InkWell(
            onTap: () => {
              setState(() {
                activeForm = !activeForm;
            }),
            },
            child: Center(child: Row(
              spacing: 15,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Criar novo cartão",
               style: TextStyle(
                fontSize: 35,
                color: Color.fromARGB(255, 17, 95, 59)
                 ),),
                Icon(
                  Icons.add,
                  color: Colors.black,
                  size: 40,
                ),
              ],
            )),
          ),
        )
      ),
    );
  }

  

}