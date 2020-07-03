import 'package:wassil/models/post.dart';

class News extends Post {
  List<String> images;

  List<String> get getImages => images;

  News(int id,String title, String institution, String description, this.images) : super(id,title, institution, description);
}