
import 'package:flutter_reddit/model/Comment.dart';

class Post {
  late int id;
  late String communityName;
  late String  description;
  late String title;
  DateTime dateTime = DateTime.now();
  int likeCount = 0 ;
  int disLikeCount = 0;
  List<Comment> commentOfPost = [];
  Post({required this.id,required this.communityName,required this.description,required this.title});

  void increaseLikeCount() {
    likeCount++;
  }

  void increaseDisLikeCount() {
    disLikeCount++;
  }

  void decreaseLikeCount() {
    likeCount--;
  }

  void decreaseDisLikeCount() {
    disLikeCount--;
  }

}
