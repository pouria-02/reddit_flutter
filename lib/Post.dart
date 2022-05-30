class Post {
  late String societyName;
  late String  description;
  late String title;
  DateTime dateTime = DateTime.now();
  late int LikeCount ;
  late int DisLikeCount;
  int get likes => LikeCount ;
  int get dislikes => DisLikeCount ;
  void setlikes (){
    LikeCount ++;
  }
  void setDislikes (){
    DisLikeCount ++;
  }
  set setDescription (String s ){
    description = s ;
  }
  String get Description => description;

}
