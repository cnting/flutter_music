import 'package:async/async.dart';
import 'package:flutter_music/config/application.dart';
import 'package:flutter_music/model/user_counter.dart';
import 'package:flutter_music/view_model/view_state_vm.dart';

class UserCounterVM extends ViewStateVM {
  UserCounter userCounter;

  ///获取用户信息，歌单，收藏，mv,dj数量
  Future<void> getUserSubCount() async {
    setLoading();
    Result<Map<String, dynamic>> result = await App.netRepository.getUserSubCount();
    if (result.isError) {
      setError();
    } else {
      userCounter = UserCounter.fromJson(result.asValue.value);
      setSuccess();
    }
  }
}
