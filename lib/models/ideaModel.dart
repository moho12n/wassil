class IdeaModel {
  int id;
  String title;
  String content;
  String type;
  String nature;

  IdeaModel({this.id, this.title, this.content, this.nature, this.type});

  factory IdeaModel.fromJson(Map<String, dynamic> json) => IdeaModel(
        id: json['id'],
        title: json['title'],
        content: json['content'],
        nature: json['nature'],
        type: json['type'],
      );
  @override
  String toString() {
    // TODO: implement toString
    return '{"id": {${id.toString()}},"title": {$title},"content": {$content},"nature": {$nature},"type": {$type}}';
  }
}
