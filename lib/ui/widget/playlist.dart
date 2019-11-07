import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';

///GridView形式的歌单
class PlaylistGrid extends StatelessWidget {
  final List list;
  final int row;

  const PlaylistGrid(this.list, this.row);

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
        delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
          return _PlaylistGridItem();
        }, childCount: min(list.length, row * 3)),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 15,
            childAspectRatio: 0.7,
            crossAxisSpacing: 10));
  }
}

class _PlaylistGridItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CachedNetworkImage(
          imageUrl:
              'http://b-ssl.duitang.com/uploads/item/201508/26/20150826221548_x3SAJ.jpeg',
          fit: BoxFit.contain,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Text(
            '我是歌单我是歌单我是歌单我是歌单我是歌单我是歌单我是歌单我',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        )
      ],
    );
  }
}
