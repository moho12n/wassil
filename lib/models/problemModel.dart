class ProblemModel {
  int id;
  String content;
  String type;
  String nature;
  String solution;
  ProblemModel({this.id, this.content,this.nature,this.solution,this.type});

  factory ProblemModel.fromJson(Map<String, dynamic> json) => ProblemModel(
        id: json['id'],
        content: json['content'],
        nature: json['nature'],
        solution: json['solution'],
        type: json['type'],
      );
  @override
  String toString() {
    // TODO: implement toString
    return '{"id": {${id.toString()}},"content": {$content},"nature": {$nature},"solution": {$solution},"type": {$type}}';
  }
}
