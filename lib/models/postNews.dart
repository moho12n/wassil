import 'package:wassil/models/post.dart';

class News extends Post {
  List<String> images;

  List<String> get getImages => images;

  News(String title, String institution, String description, this.images) : super(title, institution, description);
}