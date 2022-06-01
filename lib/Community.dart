import 'Post.dart';
import 'User.dart';

class Community {
  // community == society
  late String communityName ;
  late String communityDescription;
  late List<User> adminsOfCommunity ;
  late List<User> followers = [];
  List<Post> posts = [];
  Object profileCommunity;

  Community(this.communityName, this.communityDescription, this.adminsOfCommunity, this.profileCommunity) {
    adminsOfCommunity.forEach((admin) {
      followers.add(admin);
    });
  }
  void AddAdmin(User admin){
    adminsOfCommunity.add(admin);
    followers.add(admin);
  }
  void AddFollwers(User follower){
    followers.add(follower);
  }
  void AddPost(Post post){
    posts.add(post);
  }
  String get GetCommunityName => communityName;
  String get GetCommunityDescription => communityDescription;
  List<User> get GetAdminsOfCommunity => adminsOfCommunity;
  List<User> get Getfollowers => followers;
  List<Post> get GetPost => posts;
  set setCommunityName(String s){
    communityName = s;
  }
  set setCommunityDescription(String s){
    communityDescription = s;
  }
}