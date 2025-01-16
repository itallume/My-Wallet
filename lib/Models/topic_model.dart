import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TopicModel {
  String name;
  String content;

  TopicModel({
    required this.name,
    required this.content,
  });

  Widget toWidget(BuildContext context){
    return DefaultTextStyle(
      style: TextStyle(fontSize: 20, color: Colors.black),
      softWrap: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.8,
          child: Text("$name: ",
          softWrap: false,
          overflow: TextOverflow.ellipsis,),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 5),
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(right: 5),
                width: MediaQuery.sizeOf(context).width * 0.8,
                child: Text(
                  content,
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
  );}

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'content': content,
    };
  }

  factory TopicModel.fromJson(Map<String, dynamic> json) {
    return TopicModel(
      name: json['name'],
      content: json['content'],
    );
  }
}