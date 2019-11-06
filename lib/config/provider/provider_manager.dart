import 'package:flutter_music/view_model/user_playlist_vm.dart';
import 'package:flutter_music/view_model/user_vm.dart';
import 'package:provider/provider.dart';

///配置全局Provider
List<SingleChildCloneableWidget> providers = [
  ChangeNotifierProvider<GlobalUserVM>.value(value: GlobalUserVM()..initUser()),
  ChangeNotifierProvider<GlobalPlaylistVM>.value(value: GlobalPlaylistVM())
];
