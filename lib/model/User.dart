import 'Community.dart';
import 'Post.dart';

class User {
  int id;
  String userName;
  String password;
  String profile;
  List<Post> postsOfUser;
  List<Community> communitiesOfUser = [];

  User(
    this.id,
    this.userName,
    this.password,
    this.profile,
    this.postsOfUser,
    this.communitiesOfUser,
  );

  void addPost(Post p) {
    postsOfUser.add(p);
  }

  void addCommunityOfUser(Community c) {
    communitiesOfUser.add(c);
  }
}
