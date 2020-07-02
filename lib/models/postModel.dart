class PostModel {
   int id;
  String institution;
  String title;
  String description;
  String longitude;
  String rating;
  String isAdmin;
  String userId;
  String image;
  PostModel(
      {this.id,
      this.institution,
      this.title,
      this.description,      
      this.longitude,
      this.isAdmin,
      this.userId,
      this.rating,
      this.image});

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
      id: json['id'],
      institution: json['name'],
      description: json['description'],
      title: json['latitude'],
      longitude: json['longitude'],
      isAdmin: json['is_admin'],
      userId: json["utilisateur_id"],
      rating: json["rating"],
      image: json["image"]);

  @override
  String toString() {
    return '{ id : ${this.id}, name: ${institution},latitue: ${title}, longitude: ${longitude},rating:  ${rating} , isAdmin: $isAdmin, userID: $userId, rating : $rating, image: $image}';
  }
}
