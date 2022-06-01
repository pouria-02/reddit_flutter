import 'Community.dart';
import 'Post.dart';

class User{
  late String userName;
  late String password;
  late Object profile;
  //String? bio;
  late List<Post> postsOfUser;
  List<Community> communitiesOfUser = [];
  User({  required this.userName,  required this.password,
    required this.profile,  required List<Post> PostsOfUser});
  void AddPost(Post p){
    postsOfUser.add(p);
  }
  void AddCommunityOfUser(Community c){
    communitiesOfUser.add(c);
  }
  String get GetUserName => userName;
  String get GetPassword => password;
  set SetProfile(Object o){
    profile = o ;
  }
}