import 'package:wassil/models/post.dart';

class News extends Post {
  String image;

  News(String title, String institution, String description, this.image) : super(title, institution, description);
}