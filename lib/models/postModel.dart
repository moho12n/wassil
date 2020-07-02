class PostModel {
  int id;

  String title;
  String description;
  int total_votes;
  String post_type;
  String budget;
  String duration;
  List<Choices> choices;
  List<Comments> comments;
  String townName;
  String ministryName;
  PostModel(
      {this.id,
      this.title,
      this.description,
      this.total_votes,
      this.post_type,
      this.budget,
      this.duration,
      this.choices,
      this.comments,
      this.townName,
      this.ministryName});

  factory PostModel.fromJson(Map<String, dynamic> json) {
    print("town name" + json['town']['name']);
    return json['post_type'] == "survey"
        ? PostModel(
            id: json['id'],
            description: json['description'],
            title: json['title'],
            total_votes: json['total_votes'],
            post_type: json['post_type'],
            budget: json['budget'],
            duration: json["duration"],
            choices: json['choices']
                .map<Choices>((json) => Choices.fromJson(json))
                .toList(),
            townName: json['town']['name'],
            ministryName: json['ministry']['name'],
          )
        : PostModel(
            id: json['id'],
            description: json['description'],
            title: json['title'],
            total_votes: json['total_votes'],
            post_type: json['post_type'],
            budget: json['budget'],
            duration: json["duration"],
            comments: json['comments']
                .map<Comments>((json) => Comments.fromJson(json))
                .toList(),
            townName: json['town']['name'],
            ministryName: json['ministry']['name'],
          );
  }
  @override
  String toString() {
    return '{ id : ${this.id.toString()}, description: ${description},title: ${title}, total_votes: ${total_votes.toString()}},post_type:  ${post_type} , budget: $budget, duration: $duration, choices : ${choices.toString()},comments : ${comments.toString()}, townNAme: $townName, ministyName: $ministryName,';
  }
}

class Choices {
  int id;
  String title;
  int countVotes;
  Choices({this.id, this.title, this.countVotes});

  factory Choices.fromJson(Map<String, dynamic> json) => Choices(
      id: json['id'], title: json['title'], countVotes: json['count_votes']);
  @override
  String toString() {
    // TODO: implement toString
    return '{"id": {${id.toString()}},"title": {$title},"countVotes": {${countVotes.toString()}}}';
  }
}

class Comments {
  int id;
  String content;

  Comments({this.id, this.content});

  factory Comments.fromJson(Map<String, dynamic> json) => Comments(
        id: json['id'],
        content: json['content'],
      );
  @override
  String toString() {
    // TODO: implement toString
    return '{"id": {${id.toString()}},"content": {$content}}';
  }
}
