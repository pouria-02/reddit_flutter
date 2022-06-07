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
    for (var admin in adminsOfCommunity) {
      followers.add(admin);
    }
  }
  void addAdmin(User admin){
    adminsOfCommunity.add(admin);
    followers.add(admin);
  }
  void addFollowers(User follower){
    followers.add(follower);
  }
  void addPost(Post post){
    posts.add(post);
  }

}