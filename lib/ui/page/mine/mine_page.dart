import 'package:flutter/material.dart';
import 'package:flutter_music/ui/widget/common.dart';
import 'package:flutter_music/ui/widget/dialog.dart';
import 'package:flutter_music/ui/widget/king_kong_area.dart';
import 'package:flutter_music/ui/widget/list.dart';
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
          child: BigDivider(),
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
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Wrap(
          alignment: WrapAlignment.center,
          spacing: 35,
          children: <Widget>[
            KingKongIcon('私人FM', Icons.radio, () {}),
            KingKongIcon('最嗨电音', Icons.apps, () {}),
            KingKongIcon('ACG专区', Icons.art_track, () {}),
            KingKongIcon('Sati空间', Icons.ac_unit, () {}),
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
            CustomListTile(
                icon: Icon(
                  Icons.music_video,
                  size: 28,
                ),
                title: '本地音乐',
                subTitle: '0',
                onPressed: () {},
                dividePaddingLeft: 70),
            CustomListTile(
                icon: Icon(
                  Icons.playlist_play,
                  size: 28,
                ),
                title: '最近播放',
                subTitle: '0',
                onPressed: () {},
                dividePaddingLeft: 70),
            CustomListTile(
                icon: Icon(
                  Icons.library_music,
                  size: 28,
                ),
                title: '我的电台',
                subTitle: value.isSuccess()
                    ? '${value.userCounter.djRadioCount}'
                    : '0',
                onPressed: () {},
                dividePaddingLeft: 70),
            CustomListTile(
                icon: Icon(
                  Icons.stars,
                  size: 28,
                ),
                title: '我的收藏',
                subTitle: value.isSuccess()
                    ? '${value.userCounter.artistCount}'
                    : '专辑/歌手/视频/专栏/Mlog',
                onPressed: () {},
                dividePaddingLeft: 70),
          ]),
          itemExtent: 55,
        );
      },
      onModelReady: (UserCounterVM value) {
        value.getUserSubCount();
      },
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
      model1: UserPlaylistVM(Provider.of<GlobalUserVM>(context)),
      model2: Provider.of<GlobalPlaylistVM>(context),
      builder: (context, UserPlaylistVM userPlaylistVM,
          GlobalPlaylistVM globalPlaylistVM, Widget child) {
        return Column(
          children: <Widget>[
            if (globalPlaylistVM.createPlaylist.isNotEmpty)
              PlaylistExpandWidget('创建的歌单', globalPlaylistVM.createPlaylist, [
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    showCommonDialog(context, CreatePlaylistWidget());
                  },
                ),
                IconButton(
                  icon: Icon(Icons.more_vert),
                  onPressed: () {
                    showPlaylistsHeaderMenu(context, '创建的歌单', true);
                  },
                ),
              ]),
            if (globalPlaylistVM.collectionPlaylist.isNotEmpty)
              PlaylistExpandWidget(
                  '收藏的歌单', globalPlaylistVM.collectionPlaylist, [
                IconButton(
                  icon: Icon(Icons.more_vert),
                  onPressed: () {
                    showPlaylistsHeaderMenu(context, '收藏的歌单', false);
                  },
                ),
              ]),
          ],
        );
      },
      onModelReady:
          (UserPlaylistVM userPlaylistVM, GlobalPlaylistVM globalPlaylistVM) {
        userPlaylistVM.getMyPlaylist(globalPlaylistVM);
      },
    );
  }
}
