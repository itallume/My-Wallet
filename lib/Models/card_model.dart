import 'package:flutter/material.dart';
import 'package:my_wallet/Models/topic_model.dart';

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