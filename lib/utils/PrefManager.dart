import 'dart:core';

import 'package:flutter_reddit/main.dart';
import 'package:flutter_reddit/model/User.dart';

class PrefManager {
  final String _USER_NAME = 'userName';
  final String _EMAIL = 'email';
  final String _PASSWORD = 'password';
  final String _IS_USER_LOGIN = 'isUserLogin';

  void clearUser() {
    prefsInstance?.remove(_USER_NAME);
    prefsInstance?.remove(_EMAIL);
    prefsInstance?.remove(_PASSWORD);
  }

  void createUser(
    String userName,
    String email,
    String password,
  ) {
    prefsInstance?.setString(_USER_NAME, userName);
    prefsInstance?.setString(_EMAIL, email);
    prefsInstance?.setString(_PASSWORD, password);
  }

  User? getUser() {
    if (!prefsInstance!.containsKey(_USER_NAME)) {
      return null;
    }
    return User(
      900,
      prefsInstance!.getString(_USER_NAME)!,
      "developer",
      prefsInstance!.getString(_EMAIL)!,
      prefsInstance!.getString(_PASSWORD)!,
      "https://picsum.photos/536/354",
    );
  }

  bool isUserLogin() {
    return prefsInstance!.getBool(_IS_USER_LOGIN) ?? false;
  }

  void setUserLogin(bool isLogin) {
    prefsInstance!.setBool(_IS_USER_LOGIN, isLogin);
  }
}
