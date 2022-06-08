import 'Community.dart';
import 'Post.dart';

class User {
  int _id;
  String _userName;
  String _subtitle;
  String _password;
  String _profileImageURL;

  User(this._id, this._userName, this._subtitle,this._password, this._profileImageURL);

  String get profileImageURL => _profileImageURL;

  set profileImageURL(String value) {
    _profileImageURL = value;
  }

  String get password => _password;

  set password(String value) {
    _password = value;
  }

  String get userName => _userName;

  set userName(String value) {
    _userName = value;
  }

  int get id => _id;

  String get subtitle => _subtitle;

  set subtitle(String value) {
    _subtitle = value;
  }
}
