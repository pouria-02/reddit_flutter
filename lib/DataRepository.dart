import 'package:flutter_reddit/model/Comment.dart';
import 'package:flutter_reddit/model/Community.dart';
import 'package:flutter_reddit/model/Post.dart';
import 'package:flutter_reddit/model/User.dart';

class DataRepository {
  static User myUserData = User(
    900,
    "Negin",
    "developer",
    "Ab123",
    "https://picsum.photos/536/354",
  );
  static List<Comment> commentList = [
    // Comment(202,"nice ", 302, 102),
    // Comment(203," cool ", 303, 103),
    // Comment(204," wow ", 304, 104),
    // Comment(205," shit ", 305, 105),
    // Comment(206, "God!",306, 106),
    // Comment(207,":))",307, 107),
  ];

  static List<Community> communityList = [
    Community(
      "developers",
      "This is a test  community for peoples who love development",
      [userList[0]],
      "https://picsum.photos/200/300",
      24,
    ),
    Community(
      "designers",
      "This is a test  community for peoples who love design and art",
      [myUserData],
      "https://picsum.photos/536/354",
      81,
    ),
    Community(
      "Nasa",
      "Nasa official channel in this platform",
      [myUserData, userList[0]],
      "https://picsum.photos/536/300",
      729,
    ),

  ];

  static List<User> userList = [
    User(
      901,
      "ash",
      "programmer",
      "1234",
      "https://sp-ao.shortpixel.ai/client/to_auto,q_lossless,ret_img,w_1536/https://www.soldevelo.com/blog/wp-content/uploads/What-makes-a-great-programmer-banner-1536x1024-1.jpeg",
    ),
  ];

  static List<Post> postList = [
    Post(
      101,
      "ash",
      "I'm here for fun",
      "test",
      2,
      "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerMeltdowns.mp4",
      userList[0],
      true,
      false,
      DateTime.utc(2022, 6, 4),
      [],
    )
  ];

  static void createComment(
      int id, String text, int userId, int postCommentId) {
    // Comment comment = Comment(id, text, userId, postCommentId);
    // commentList.add(comment);
  }

  static void increaseLikeCount(int commentId) {
    Comment currentComment = commentList.firstWhere(
      (element) => element.id == commentId,
    );
    currentComment.increaseLikeCount();
  }
}
