import 'package:flutter_reddit/Post.dart';

import 'Comment.dart';
import 'User.dart';

class DataRepository {
  static List<Comment> commentList = [
    Comment(202,"nice ", 302, 102),
    Comment(203," cool ", 303, 103),
    Comment(204," wow ", 304, 104),
    Comment(205," shit ", 305, 105),
    Comment(206, "God!",306, 106),
    Comment(207,":))",307, 107),
  ];

  static List<Post> postList = [
    Post(id: 102, communityName: "communityName1", description: "description1", title: "title1"),
    Post(id: 103, communityName: "communityName2", description: "description2", title: "title2"),
    Post(id: 104, communityName: "communityName3", description: "description3", title: "title3"),
    Post(id: 105, communityName: "communityName4", description: "description4", title: "title4"),
    Post(id: 106, communityName: "communityName5", description: "description5", title: "title5"),
  ];

  static void createComment(int id,String text, int userId, int  post_commentId) {
    Comment comment = Comment(id, text, userId, post_commentId);
    commentList.add(comment);
  }
  static void increaseLikeCount(int commentId) {
    Comment currentComment = commentList.firstWhere(
      (element) => element.id == commentId,
    );
    currentComment.setlikes();
  }
}
