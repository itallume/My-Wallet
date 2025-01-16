import 'package:flutter/material.dart';
import 'package:my_wallet/Models/topic_model.dart';

class CardModel{
    BuildContext? context;
    int? id;
    String title;
    List<TopicModel>? topics;

  CardModel({
    this.context,
    this.id,
    required this.title,
    this.topics,
  });

  Widget toWidget(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.sizeOf(context).width * 0.8,
              margin: EdgeInsetsDirectional.only(bottom: 10),
              child: Text(title,
               style: TextStyle(fontSize: 30,),
               softWrap: false,
                overflow: TextOverflow.ellipsis,
            )),
            ...topicWidgetList(context)
      ],),
      )
    );
  }

  List<Widget> topicWidgetList(context){
    return topics?.map((e) => e.toWidget(context)).toList() ?? [];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'topics': topics?.map((topic) => topic.toJson()).toList(),
    };
  }

  factory CardModel.fromJson(Map<String, dynamic> json) {
    return CardModel(
      id: json['id'],
      title: json['title'],
      topics: (json['topics'] as List)
          .map((topic) => TopicModel.fromJson(topic))
          .toList(),
    );

  }
}