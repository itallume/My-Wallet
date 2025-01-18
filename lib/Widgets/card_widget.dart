import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_wallet/Models/card_model.dart';
import 'package:my_wallet/Widgets/add_topic.dart';

class CardWidget extends StatefulWidget{

  final CardModel cardModel;

  const CardWidget({super.key, required this.cardModel});

  @override
  State<StatefulWidget> createState() => _CardWidget();


}

class _CardWidget extends State<CardWidget>{
  @override
  Widget build(BuildContext context) {

    return Card(
      color: Color.fromARGB(255, 185, 219, 195),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          spacing: 15,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.8,
              
              child: Text(widget.cardModel.title,
               style: TextStyle(
                fontSize: 35,
                color: Color.fromARGB(255, 17, 95, 59)
                 ),
               softWrap: false,
                overflow: TextOverflow.ellipsis,
            )),
            ...widget.cardModel.topics.map(
              (e) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.8,
                    child: Text(
                      "${e.name}: ",
                      style: TextStyle(
                        fontSize: 25,
                          color: Color.fromARGB(255, 26, 147, 111),
                          fontWeight: FontWeight.bold),
                      softWrap: true,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 5),
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 5),
                          width: MediaQuery.sizeOf(context).width * 0.8,
                          child: Text(
                            e.content,
                            style: TextStyle(fontSize: 20,),
                            softWrap: false,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Clipboard.setData(ClipboardData(text: e.content));
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Texto copiado!')));
                          },
                          child: Icon(
                            Icons.content_copy,
                            color: Colors.black,
                            size: 25,
                          ),
                        )
                    ],),
                  ),
             ],),     
            ),
            AddTopic(cardId: widget.cardModel.id!)
        ],),
      )
    );
  } 
} 