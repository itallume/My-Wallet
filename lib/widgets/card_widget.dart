import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CardWidget {
  const CardWidget(String cardTitle);

  Widget build(BuildContext context) {
    return Card(
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
    );
  }
}