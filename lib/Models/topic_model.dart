class TopicModel {
  String name;
  String content;

  TopicModel({
    required this.name,
    required this.content,
  });

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