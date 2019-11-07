import 'dart:async';
import 'dart:io';

import 'package:async/async.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:netease_music_api/netease_cloud_music.dart';
import 'package:path_provider/path_provider.dart';

class NetRepository {
  static const int _NEED_LOGIN = 301;
  static const int _SUCCESS = 200;
  Completer<PersistCookieJar> _cookieJar = Completer();

  NetRepository() {
    scheduleMicrotask(() async {
      var path = await getApplicationSupportDirectory();
      PersistCookieJar cookieJar =
          PersistCookieJar(dir: path.path + "/.cookies/");
      _cookieJar.complete(cookieJar);
    });
  }

  Future<List<Cookie>> _loadCookies() async {
    var jar = await _cookieJar.future;
    if (jar == null) {
      return [];
    }
    final uri = Uri.parse('http://music.163.com');
    return jar.loadForRequest(uri);
  }

  _saveCookies(List<Cookie> cookies) async {
    var jar = await _cookieJar.future;
    if (jar == null) {
      return;
    }
    final uri = Uri.parse('http://music.163.com');
    jar.saveFromResponse(uri, cookies);
  }

  Future<Result<Map<String, dynamic>>> _doRequest(String path,
      {Map<String, dynamic> params}) async {
    List<Cookie> cookies = await _loadCookies();
    Answer answer;
    try {
      answer = await cloudMusicApi(path, parameter: params, cookie: cookies);
    } catch (e, stacktrace) {
      Result.error('request error:$e', stacktrace);
    }

    if (answer.status == HttpStatus.ok) {
      _saveCookies(answer.cookie);
    }

    final map = answer.body;
    if (map == null) {
      return Result.error('请求失败了');
    } else if (map['code'] == _NEED_LOGIN) {
      return Result.error('需要登陆才能访问哦~');
    } else if (map['code'] != _SUCCESS) {
      return Result.error(map['msg'] ?? '请求失败了~');
    }
    return Result.value(map);
  }

  ///手机号登录
  Future<Result<Map<String, dynamic>>> loginByPhone(
      String phone, String pwd) async {
    return _doRequest('/login/cellphone',
        params: {'phone': phone, 'password': pwd});
  }

  ///获取用户信息 , 歌单，收藏，mv, dj 数量
  Future<Result<Map<String, dynamic>>> getUserSubCount() {
    return _doRequest('/user/subcount');
  }

  ///获取用户歌单
  Future<Result<Map<String, dynamic>>> getUserPlaylist(int uid) {
    return _doRequest('/user/playlist', params: {'uid': uid});
  }

  ///创建歌单
  Future<Result<Map<String, dynamic>>> createPlaylist(
      String name, bool isPrivate) {
    return _doRequest('/playlist/create',
        params: {'name': name, if (isPrivate) 'privacy': 10});
  }

  ///删除歌单
  Future<Result<Map<String, dynamic>>> deletePlaylist(int id) {
    return _doRequest('/playlist/delete', params: {'id': id});
  }
}
