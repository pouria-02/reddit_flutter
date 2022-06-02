import 'Post.dart';
import 'User.dart';

class Comment {
  late User userOfThisComment;
  late String text;
  late Post post_comment;
  DateTime commentTime = DateTime.now();
  int likes_comment = 0 ;
  int dislike_comment = 0 ;
  Comment(this.text, this.userOfThisComment, this.post_comment);
  void setlikes (){
    likes_comment ++;
  }
  void setDislikes (){
    dislike_comment ++;
  }
  set setText_comment(String s){
    text = s;
  }
  String get getText_comment => text;
  int get getLikes_comment => likes_comment;
  int get getDislikes_comment => dislike_comment;


}