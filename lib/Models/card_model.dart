import 'package:flutter/material.dart';
import 'package:my_wallet/Models/topic_model.dart';
import 'package:my_wallet/Widgets/add_topic.dart';

class CardModel{
    BuildContext? context;
    int? id;
    String title;
    List<TopicModel> topics;

  CardModel({
    this.context,
    this.id,
    required this.title,
    required this.topics,
  });

  void addTopic(TopicModel topic){
    topics.add(topic);
  }

  Widget toWidget(BuildContext context) {
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
              
              child: Text(title,
               style: TextStyle(
                fontSize: 35,
                color: Color.fromARGB(255, 17, 95, 59)
                 ),
               softWrap: false,
                overflow: TextOverflow.ellipsis,
            )),
            ...topicWidgetList(context),
            AddTopic(cardId: id!,)
      ],),
      )
    );
  }

  List<Widget> topicWidgetList(context){
    return topics.map((e) => e.toWidget(context)).toList() ?? [];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'topics': topics.map((topic) => topic.toJson()).toList(),
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