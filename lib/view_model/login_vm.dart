import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_music/config/application.dart';
import 'package:flutter_music/config/router/routes.dart';
import 'package:flutter_music/util/toast.dart';
import 'package:flutter_music/view_model/user_vm.dart';
import 'package:flutter_music/view_model/view_state_vm.dart';
import 'package:netease_music_api/netease_cloud_music.dart';

class LoginVM extends ViewStateVM {
  UserVM _userVM;

  LoginVM(UserVM userVM) {
    this._userVM = userVM;
  }

  login(BuildContext context,String phone, String pwd) async {
    setLoading();
    Answer answer = await App.netRepository.loginByPhone(phone, pwd);
    if (answer.status == HttpStatus.ok) {
      _userVM.saveUser(answer.body);
      setSuccess();
      App.router.navigateTo(context, Routes.home, clearStack: true);
    } else {
      setError();
      toast(context, '登录失败，请稍后再试');
    }
  }
}
