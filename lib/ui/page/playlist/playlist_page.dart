import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music/model/playlist.dart';

class PlaylistDetailPage extends StatefulWidget {

  final PlaylistDetail _playlistDetail;

  const PlaylistDetailPage(this._playlistDetail);

  @override
  _PlaylistDetailPageState createState() => _PlaylistDetailPageState();
}

class _PlaylistDetailPageState extends State<PlaylistDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              title: Text('歌单'),
              pinned: true,
              actions: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(
                    Icons.more_vert,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
            SliverPersistentHeader(delegate: null)
          ];
        },
        body: Container(),
      ),
    );
  }
}

class _PlaylistHeader extends SliverPersistentHeaderDelegate {

  final PlaylistDetail _playlistDetail;

  const _PlaylistHeader(this._playlistDetail);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            CachedNetworkImage(imageUrl: _playlistDetail.titleImageUrl,width: 60,height: 60,),
            Column(children: <Widget>[
              Text(_playlistDetail.name),
              Row(children: <Widget>[
                CachedNetworkImage(imageUrl: _playlistDetail.creator.avatarUrl,width: 20,height: 20,),
//                Text(
//                  _playlistDetail.
//                )
              ],)
            ],
            )
          ],
        )
      ],
    );
  }

  @override
  double get maxExtent => 200;

  @override
  double get minExtent => 0;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
