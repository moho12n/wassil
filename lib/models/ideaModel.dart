class IdeaModel {
  int id;
  String content;
  String type;
  String nature;

  IdeaModel({this.id, this.content, this.nature, this.type});

  factory IdeaModel.fromJson(Map<String, dynamic> json) => IdeaModel(
        id: json['id'],
        content: json['content'],
        nature: json['nature'],
        type: json['type'],
      );
  @override
  String toString() {
    // TODO: implement toString
    return '{"id": {${id.toString()}},"content": {$content},"nature": {$nature},"type": {$type}}';
  }
}
