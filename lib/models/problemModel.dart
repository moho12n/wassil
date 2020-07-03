class ProblemModel {
  int id;
  String title;
  String content;
  String type;
  String nature;
  String solution;
  ProblemModel(
      {this.id,
      this.title,
      this.content,
      this.nature,
      this.solution,
      this.type});

  factory ProblemModel.fromJson(Map<String, dynamic> json) => ProblemModel(
        id: json['id'],
        title: json['title'],
        content: json['content'],
        nature: json['nature'],
        solution: json['solution'],
        type: json['type'],
      );
  @override
  String toString() {
    // TODO: implement toString
    return '{"id": {${id.toString()}},"title": {$title},"content": {$content},"nature": {$nature},"solution": {$solution},"type": {$type}}';
  }
}
