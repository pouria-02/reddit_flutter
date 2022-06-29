import 'package:flutter_reddit/model/Comment.dart';
import 'package:flutter_reddit/model/User.dart';

class Post {
  int _id;
  String _communityName;
  String _description;
  String _title;
  int _commentCount;
  String _contentURL;
  User _user;
  bool _isLiked;
  bool _isDisliked;
  DateTime _publishedDate;
  int _likeCount = 0;

  int _disLikeCount = 0;
  List<Comment> _comments;


  Post(this._id,
      this._communityName,
      this._description,
      this._title,
      this._commentCount,
      this._contentURL,
      this._user,
      this._isLiked,
      this._isDisliked,
      this._publishedDate,
      this._comments);


  String get communityName => _communityName;

  set communityName(String value) {
    _communityName = value;
  }

  void increaseLikeCount() {
    _likeCount++;
  }

  void increaseDisLikeCount() {
    _disLikeCount++;
  }

  void decreaseLikeCount() {
    _likeCount--;
  }

  void decreaseDisLikeCount() {
    _disLikeCount--;
  }

  String getPastPublishTime() {
    int nowTimeStamp =
        DateTime
            .now()
            .millisecondsSinceEpoch;
    int diff = nowTimeStamp - publishedDate.millisecondsSinceEpoch;

    if (diff > 86700000) {
      //day
      return '${(diff ~/ 86700000)}d';
    } else if (diff < 86700000 && diff > 3600000) {
      //hour
      return '${(diff ~/ 3600000)}h';
    } else if (diff < 3600000 && diff > 60000) {
      //min
      return '${(diff ~/ 60000)}m';
    } else {
      if (diff == 0) {
        return 'now';
      } else {
        return '${diff ~/ 1000}s';
      }
    }
  }

  String get description => _description;

  set description(String value) {
    _description = value;
  }

  String get title => _title;

  set title(String value) {
    _title = value;
  }

  int get commentCount => _commentCount;

  set commentCount(int value) {
    _commentCount = value;
  }

  String get contentURL => _contentURL;

  set contentURL(String value) {
    _contentURL = value;
  }

  User get user => _user;

  set user(User value) {
    _user = value;
  }

  bool get isLiked => _isLiked;

  set isLiked(bool value) {
    _isLiked = value;
  }

  bool get isDisliked => _isDisliked;

  set isDisliked(bool value) {
    _isDisliked = value;
  }

  DateTime get publishedDate => _publishedDate;

  set publishedDate(DateTime value) {
    _publishedDate = value;
  }

  int get likeCount => _likeCount;

  set likeCount(int value) {
    _likeCount = value;
  }

  int get disLikeCount => _disLikeCount;

  set disLikeCount(int value) {
    _disLikeCount = value;
  }

  List<Comment> get comments => _comments;


  int get id => _id;

  set comments(List<Comment> value) {
    _comments = value;
  }
}
