import 'package:wassil/models/post.dart';

class Project extends Post {
  String image;
  Project(String title, String institution, String description, this.image) : super(title, institution, description);
}