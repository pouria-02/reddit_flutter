
class PostDetails  {
    late String societyNameD;
    late String userName;
    DateTime dateTimeD = DateTime.now();
    late String descriptionD;
    late int LikeCountD ;
    late int DisLikeCountD;
    late int commentCounter;
    late int commentLikeCounter;
    late int commentDisLikeCounter;

    //comment list
    // adding comment
    String get getSocietyNameD => societyNameD;
    String get getuserName => userName;
    String get getDiscriptionDetail => descriptionD;
    int get getLikesCountD => LikeCountD ;
    int get getDislikesCountD => DisLikeCountD ;
    int get getCommentCounter => commentCounter ;
    int get getCommentLikeCounter => commentLikeCounter ;
    int get getCommentDisLikeCounter => commentDisLikeCounter ;
    void setlikesCountD (){
        LikeCountD ++;
    }
    void setDislikesCountD (){
        DisLikeCountD ++;
    }
    void setCommentCounter (){
        commentCounter++;
    }
    void setCommentLikeCounter (){
        commentLikeCounter++;
    }
    void setCommentDisLikeCounter (){
        commentDisLikeCounter++;
    }
}
