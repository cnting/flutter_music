import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music/ui/widget/common.dart';
import 'package:flutter_music/ui/widget/king_kong_area.dart';
import 'package:flutter_music/ui/widget/playlist.dart';

class MinePage extends StatefulWidget {
  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          _kingKongArea(),
          Divider(),
          ..._list(),
          bigDivider(),
          _PlayListWidget(),
          bigDivider(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: playlistGrid([
              '1',
              '1',
              '1',
              '1',
              '1',
              '1',
              '1',
              '1',
              '1',
            ], 2),
          )
        ],
      ),
    );
  }

  Widget _kingKongArea() {
    return Padding(
      padding: EdgeInsets.only(top: 20, bottom: 20),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Wrap(
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

  List<Widget> _list() {
    return [
      _listItem(Icons.music_video, '本地音乐', '(0)', () {}),
      Padding(
        padding: EdgeInsets.only(left: 80),
        child: Divider(),
      ),
      _listItem(Icons.playlist_play, '最近播放', '(0)', () {}),
      Padding(
        padding: EdgeInsets.only(left: 80),
        child: Divider(),
      ),
      _listItem(Icons.cloud_download, '下载管理', '(0)', () {}),
      Padding(
        padding: EdgeInsets.only(left: 80),
        child: Divider(),
      ),
      _listItem(Icons.library_music, '我的电台', '(0)', () {}),
      Padding(
        padding: EdgeInsets.only(left: 80),
        child: Divider(),
      ),
      _listItem(Icons.stars, '我的收藏', '(专辑/歌手/视频/专栏/Mlog)', () {}),
    ];
  }

  Widget _listItem(
      IconData iconData, String title, String subTitle, Function onPressed) {
    return Row(
      children: <Widget>[
        Container(
          width: 80,
          height: 45,
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
            subTitle,
          ),
        )
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
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            ExpandIcon(
              isExpanded: isExpand,
              onPressed: (isExpand) {
                setState(() {
                  this.isExpand = !this.isExpand;
                });
              },
            ),
            Text('创建的歌单'),
            Text('(1)'),
            Spacer(),
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {},
            ),
          ],
        ),
        if (isExpand) ..._myPlayList()
      ],
    );
  }

  List<Widget> _myPlayList() {
    return [
      _playlistItem(title: '我喜欢的音乐', count: 0, isDefault: true),
      _playlistItem(
        title: 'TODO：调接口',
        count: 0,
      ),
    ];
  }

  Widget _playlistItem(
      {String title,
      int count,
      String imgUrl,
      Widget rightWidget,
      bool isDefault = false,
      Function onPressed}) {
    Widget image;
    if (image == null && imgUrl == null) {
      image = Container(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
            color: Colors.black, borderRadius: BorderRadius.circular(5)),
        width: 50,
        height: 50,
        child: Image.asset(isDefault
            ? 'assets/img/heart.png'
            : 'assets/img/default_playlist_cover.png'),
      );
    } else if (image == null && imgUrl == null) {
      image = CachedNetworkImage(
        imageUrl: imgUrl,
        width: 50,
        height: 50,
      );
    }

    return GestureDetector(
      child: Container(
        child: Row(
          children: <Widget>[
            image,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(title),
                Padding(
                  padding: EdgeInsets.only(top: 5),
                  child: Text('$count首'),
                )
              ],
            ),
            Spacer(),
            if (rightWidget != null) rightWidget
          ],
        ),
      ),
      onTap: onPressed,
    );
  }
}
