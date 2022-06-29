import 'Post.dart';
import 'User.dart';

class Community {
  // community == society
  final String communityName;

  final String communityDescription;
  final List<User> adminsOfCommunity;

  final int followers;
  final List<Post> posts = [];
  final String profileCommunityURL;

  Community(
    this.communityName,
    this.communityDescription,
    this.adminsOfCommunity,
    this.profileCommunityURL,
    this.followers,
  );

  void addAdmin(User admin) {
    adminsOfCommunity.add(admin);
  }

  void addPost(Post post) {
    posts.add(post);
  }
}
