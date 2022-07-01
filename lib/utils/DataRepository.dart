import 'package:flutter_reddit/model/Comment.dart';
import 'package:flutter_reddit/model/Community.dart';
import 'package:flutter_reddit/model/Post.dart';
import 'package:flutter_reddit/model/User.dart';
import 'package:flutter_reddit/utils/PrefManager.dart';

class DataRepository {
  static List<Comment> commentList = [
    Comment(
      201,
      PrefManager().getUser()!,
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s ",
      302,
    ),
    Comment(
      202,
      PrefManager().getUser()!,
      "nice ",
      302,
    ),
    Comment(
      203,
      PrefManager().getUser()!,
      "wow ",
      303,
    ),
    Comment(
      204,
      PrefManager().getUser()!,
      "shit ",
      303,
    ),
    Comment(
      204,
      PrefManager().getUser()!,
      "God! ",
      303,
    ),
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
      [PrefManager().getUser()!],
      "https://picsum.photos/536/354",
      81,
    ),
    Community(
      "Nasa",
      "Nasa official channel in this platform",
      [PrefManager().getUser()!, userList[0]],
      "https://picsum.photos/536/300",
      729,
    ),
  ];

  static List<User> userList = [
    User(
      901,
      "ash",
      "programmer",
      "ash@hotmail.com",
      "1234",
      "https://sp-ao.shortpixel.ai/client/to_auto,q_lossless,ret_img,w_1536/https://www.soldevelo.com/blog/wp-content/uploads/What-makes-a-great-programmer-banner-1536x1024-1.jpeg",
    ),
  ];

  static List<Post> postList = [
    Post(
      101,
      communityList[0],
      "I'm here for fun",
      "test",
      "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerMeltdowns.mp4",
      'https://numpaints.com/wp-content/uploads/2022/03/Big-Buck-Bunny-paint-by-number.jpg',
      userList[0],
      false,
      false,
      DateTime.utc(2022, 6, 4),
      commentList,
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
