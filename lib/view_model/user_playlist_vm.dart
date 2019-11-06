import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music/config/application.dart';
import 'package:flutter_music/model/playlist.dart';
import 'package:flutter_music/view_model/base/view_state_vm.dart';
import 'package:flutter_music/view_model/user_vm.dart';

class GlobalPlaylistVM extends ChangeNotifier {
  List<PlaylistDetail> _createPlaylist = []; //创建的歌单
  List<PlaylistDetail> _collectionPlaylist = []; //收藏的歌单

  List<PlaylistDetail> get createPlaylist => _createPlaylist;

  List<PlaylistDetail> get collectionPlaylist => _collectionPlaylist;

  addCreatePlaylist(PlaylistDetail playlistDetail, {int index}) {
    if (index == null || index >= _createPlaylist.length) {
      _createPlaylist.add(playlistDetail);
    } else {
      _createPlaylist.insert(index, playlistDetail);
    }
    notifyListeners();
  }

  addCollectionPlaylist(PlaylistDetail playlistDetail) {
    _collectionPlaylist.add(playlistDetail);
    notifyListeners();
  }
}

///歌单管理
class UserPlaylistVM extends ViewStateVM {
  GlobalUserVM _globalUserVM;

  UserPlaylistVM(this._globalUserVM);

  getMyPlaylist(GlobalPlaylistVM globalPlaylistVM) {
    if (_globalUserVM.isLogin)
      _getUserPlaylist(globalPlaylistVM, _globalUserVM.userProfile.userId);
  }

  ///获取用户歌单
  _getUserPlaylist(GlobalPlaylistVM globalPlaylistVM, int uid) async {
    setLoading();
    Result<Map<String, dynamic>> result =
        await App.netRepository.getUserPlaylist(uid);
    if (result.isError) {
      setError();
    } else {
      try {
        Playlists playlists = Playlists.fromJson(result.asValue.value);
        playlists.playlist.forEach((detail) {
          if (detail.subscribed) {
            globalPlaylistVM.addCollectionPlaylist(detail);
          } else {
            globalPlaylistVM.addCreatePlaylist(detail);
          }
        });
        setSuccess();
      } catch (e, stacktrace) {
        print('===>$stacktrace');
        setError();
      }
    }
  }

  ///创建歌单
  createNewPlaylist(
      GlobalPlaylistVM globalPlaylistVM, String name, bool isPrivate) async {
    setLoading();
    Result<Map<String, dynamic>> result =
        await App.netRepository.createPlaylist(name, isPrivate);
    if (result.isError) {
      setError();
    } else {
      try {
        PlaylistDetail playlistDetail =
            PlaylistDetail.fromJson(result.asValue.value['playlist']);
        globalPlaylistVM.addCreatePlaylist(playlistDetail, index: 1);
        setSuccess();
      } catch (e, stacktrace) {
        print('===>$stacktrace');
        setError();
      }
    }
  }
}
