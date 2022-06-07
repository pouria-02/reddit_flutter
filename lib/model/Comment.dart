class Comment {
  late int id;
  late int userId;
  late String text;
  late int postId;
  DateTime commentTime = DateTime.now();
  int commentLikesCount = 0;
  int commentDislikeCount = 0;

  Comment(this.id, this.text, this.userId, this.postId);

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
