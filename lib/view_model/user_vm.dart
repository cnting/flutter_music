import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_music/config/application.dart';
import 'package:flutter_music/config/repository/shared_preference.dart';
import 'package:flutter_music/model/user.dart';

class UserVM with ChangeNotifier {
  bool isLogin = false;

  UserAccount userAccount;
  UserProfile userProfile;

  void saveUser(Map<dynamic, dynamic> map) {
    Map<dynamic, dynamic> account = map['account'];
    Map<dynamic, dynamic> profile = map['profile'];

    userAccount = UserAccount.fromJson(account);
    userProfile = UserProfile.fromJson(profile);

    App.sp.setString(SpKey.USER_ACCOUNT, jsonEncode(account));
    App.sp.setString(SpKey.USER_PROFILE, jsonEncode(profile));

    isLogin = true;
  }

  Future<void> initUser() async {
    String sAccount =
        await App.sp.getString(SpKey.USER_ACCOUNT, defaultValue: null);
    if (sAccount != null) {
      debugPrint('===>sAccount:$sAccount');
      Map<dynamic, dynamic> account = jsonDecode(sAccount);
      userAccount = UserAccount.fromJson(account);
    }

    String sProfile =
        await App.sp.getString(SpKey.USER_PROFILE, defaultValue: null);
    if (sProfile != null) {
      Map<dynamic, dynamic> profile = jsonDecode(sProfile);
      userProfile = UserProfile.fromJson(profile);
    }

    isLogin = userAccount != null && userProfile != null;
  }
}
