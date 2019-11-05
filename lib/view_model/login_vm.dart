import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music/config/application.dart';
import 'package:flutter_music/config/router/routes.dart';
import 'package:flutter_music/util/toast.dart';
import 'package:flutter_music/view_model/user_vm.dart';
import 'package:flutter_music/view_model/view_state_vm.dart';

class LoginVM extends ViewStateVM {
  UserVM _userVM;

  LoginVM(UserVM userVM) {
    this._userVM = userVM;
  }

  login(BuildContext context, String phone, String pwd) async {
    setLoading();
    Result<Map<String, dynamic>> result =
        await App.netRepository.loginByPhone(phone, pwd);
    if (!result.isError) {
      _userVM.saveUserAfterLogin(result.asValue.value);
      setSuccess();
      App.router.navigateTo(context, Routes.home, clearStack: true);
    } else {
      setError();
      toast(context, '登录失败，请稍后再试');
    }
  }
}
