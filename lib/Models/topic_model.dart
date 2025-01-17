import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TopicModel {
  String name;
  String content;

  TopicModel({
    required this.name,
    required this.content,
  });

  Widget toWidget(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: MediaQuery.sizeOf(context).width * 0.8,
            child: Text(
              "$name: ",
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
                    content,
                    style: TextStyle(fontSize: 20,),
                    softWrap: false,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Clipboard.setData(ClipboardData(text: content));
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
      );
  }

  Map<String, String> toJson() {
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
