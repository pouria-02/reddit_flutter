import 'dart:core';

import 'package:flutter_reddit/main.dart';

class PrefManager {
  final String _IS_USER_LOGIN = 'isUserLogin';

  bool isUserLogin() {
    return prefsInstance!.getBool(_IS_USER_LOGIN) ?? false;
  }

  void setUserLogin(bool isLogin) {
    prefsInstance!.setBool(_IS_USER_LOGIN, isLogin);
  }
}
