import 'package:flutter/material.dart';
import 'package:flutter_music/ui/widget/common.dart';
import 'package:flutter_music/ui/widget/dialog.dart';
import 'package:flutter_music/ui/widget/king_kong_area.dart';
import 'package:flutter_music/ui/widget/provider_widget.dart';
import 'package:flutter_music/view_model/user_counter_vm.dart';
import 'package:flutter_music/view_model/user_playlist_vm.dart';
import 'package:flutter_music/view_model/user_vm.dart';
import 'package:provider/provider.dart';

import 'mine_widget.dart';

class MinePage extends StatefulWidget {
  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: _kingKongArea(),
        ),
        SliverToBoxAdapter(
          child: Divider(),
        ),
        _list(),
        SliverToBoxAdapter(
          child: bigDivider(),
        ),
        SliverToBoxAdapter(
          child: _PlayListWidget(),
        ),
//        SliverPadding(
//          padding: EdgeInsets.symmetric(horizontal: 15),
//          sliver: playlistGrid([
//            '1',
//            '1',
//            '1',
//            '1',
//            '1',
//            '1',
//            '1',
//            '1',
//            '1',
//          ], 2),
//        )
      ],
    );
  }

  Widget _kingKongArea() {
    return Padding(
      padding: EdgeInsets.all(20),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Wrap(
          alignment: WrapAlignment.center,
          spacing: 35,
          children: <Widget>[
            kingKongIcon(context, '私人FM', Icons.radio, () {}),
            kingKongIcon(context, '最嗨电音', Icons.apps, () {}),
            kingKongIcon(context, 'ACG专区', Icons.art_track, () {}),
            kingKongIcon(context, 'Sati空间', Icons.ac_unit, () {}),
          ],
        ),
      ),
    );
  }

  Widget _list() {
    return ProviderWidget(
      model: UserCounterVM(),
      builder: (BuildContext context, UserCounterVM value, Widget child) {
        return SliverFixedExtentList(
          delegate: SliverChildListDelegate.fixed([
            _listItem(Icons.music_video, '本地音乐', '0', () {}),
            _listItem(Icons.playlist_play, '最近播放', '0', () {}),
            _listItem(Icons.cloud_download, '下载管理', '0', () {}),
            _listItem(
                Icons.library_music,
                '我的电台',
                value.isSuccess() ? '${value.userCounter.djRadioCount}' : '0',
                () {}),
            _listItem(
                Icons.stars,
                '我的收藏',
                value.isSuccess()
                    ? '${value.userCounter.artistCount}'
                    : '专辑/歌手/视频/专栏/Mlog',
                () {}),
          ]),
          itemExtent: 55,
        );
      },
      onModelReady: (UserCounterVM value) {
        value.getUserSubCount();
      },
    );
  }

  Widget _listItem(
      IconData iconData, String title, String subTitle, Function onPressed,
      {bool hasDivider = true}) {
    return Column(
      children: <Widget>[
        Expanded(
            child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 80,
              alignment: Alignment.center,
              child: Icon(
                iconData,
                size: 28,
              ),
            ),
            Text(
              title,
            ),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                '($subTitle)',
              ),
            )
          ],
        )),
        Padding(
          padding: EdgeInsets.only(left: 80, bottom: 0),
          child: Divider(),
        ),
      ],
    );
  }
}

class _PlayListWidget extends StatefulWidget {
  @override
  _PlayListState createState() => _PlayListState();
}

class _PlayListState extends State<_PlayListWidget> {
  bool isExpand = true;

  @override
  Widget build(BuildContext context) {
    return ProviderWidget2(
      model1: UserPlaylistVM(),
      model2: Provider.of<UserVM>(context),
      builder: (context, UserPlaylistVM userPlaylistVM, UserVM userVM,
          Widget child) {
        return Column(
          children: <Widget>[
            if (userPlaylistVM.createPlaylist.isNotEmpty)
              PlaylistExpandWidget('创建的歌单', userPlaylistVM.createPlaylist, [
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    showCommonDialog(context, CreatePlaylistWidget(userPlaylistVM));
                  },
                ),
                IconButton(
                  icon: Icon(Icons.more_vert),
                  onPressed: () {},
                ),
              ]),
            if (userPlaylistVM.collectionPlaylist.isNotEmpty)
              PlaylistExpandWidget('收藏的歌单', userPlaylistVM.collectionPlaylist, [
                IconButton(
                  icon: Icon(Icons.more_vert),
                  onPressed: () {},
                ),
              ]),
          ],
        );
      },
      onModelReady: (UserPlaylistVM userPlaylistVM, UserVM userVM) {
        if (userVM.isLogin) {
          userPlaylistVM.getUserPlaylist(userVM.userAccount.id);
        }
      },
    );
  }
}
