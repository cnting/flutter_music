import 'package:async/async.dart';
import 'package:flutter_music/config/application.dart';
import 'package:flutter_music/model/playlist.dart';
import 'package:flutter_music/view_model/view_state_vm.dart';

class UserPlaylistVM extends ViewStateVM {
  List<PlaylistDetail> createPlaylist = []; //创建的歌单
  List<PlaylistDetail> collectionPlaylist = []; //收藏的歌单

  getUserPlaylist(int uid) async {
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
            collectionPlaylist.add(detail);
          } else {
            createPlaylist.add(detail);
          }
        });
        setSuccess();
      } catch (e, stacktrace) {
        print('===>$stacktrace');
        setError();
      }
    }
  }

  createNewPlaylist(String name, bool isPrivite) async {
    setLoading();
    Result<Map<String, dynamic>> result =
        await App.netRepository.createPlaylist(name, isPrivite);
    if (result.isError) {
      setError();
    } else {
      try {
        PlaylistDetail playlistDetail =
            PlaylistDetail.fromJson(result.asValue.value['playlist']);
        createPlaylist.add(playlistDetail);
        setSuccess();
      } catch (e, stacktrace) {
        print('===>$stacktrace');
        setError();
      }
    }
  }
}
