import 'package:flutter_reddit/model/User.dart';

class Comment {
  int id;
  User user;
  String text;
  int postId;
  DateTime commentTime = DateTime.now();
  int commentLikesCount = 0;
  int commentDislikeCount = 0;


  Comment(this.id, this.user, this.text, this.postId);

  void increaseLikeCount() {
    commentLikesCount++;
  }

  void increaseDisLikeCount() {
    commentDislikeCount++;
  }

  void decreaseLikeCount() {
    commentLikesCount--;
  }

  void decreaseDisLikeCount() {
    commentDislikeCount--;
  }

}
