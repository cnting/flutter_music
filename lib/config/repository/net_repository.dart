import 'dart:async';
import 'dart:io';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:netease_music_api/netease_cloud_music.dart';
import 'package:path_provider/path_provider.dart';

class NetRepository {
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

  ///手机号登录
  Future<Answer> loginByPhone(String phone, String pwd) async {
    List<Cookie> cookies = await _loadCookies();
    return cloudMusicApi('/login/cellphone',
        parameter: {'phone': phone, 'password': pwd}, cookie: cookies);
  }
}
