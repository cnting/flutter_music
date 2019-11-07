import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music/config/application.dart';
import 'package:flutter_music/config/router/routes.dart';
import 'package:flutter_music/view_model/base/view_state_vm.dart';
import 'package:flutter_music/view_model/user_vm.dart';
import 'package:oktoast/oktoast.dart';

class LoginVM extends ViewStateVM {
  GlobalUserVM _userVM;

  LoginVM(GlobalUserVM userVM) {
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
      showToast('登录失败，请稍后再试');
    }
  }
}
