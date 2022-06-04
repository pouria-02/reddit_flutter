import 'Post.dart';
import 'User.dart';

class Comment {
  late int id;
  late int userId;
  late String text;
  late int post_commentId;
  DateTime commentTime = DateTime.now();
  int likes_comment = 0 ;
  int dislike_comment = 0 ;
  Comment(this.id,this.text, this.userId,this.post_commentId );
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