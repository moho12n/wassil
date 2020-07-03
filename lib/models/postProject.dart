import 'package:wassil/models/post.dart';

class Project extends Post {
  List<String> images;

  List<String> get getImages => images;

  Project(
      int id, String title, String institution, String description, this.images)
      : super(id, title, institution, description);
}
