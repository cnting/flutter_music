import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';

///GridView形式的歌单
Widget playlistGrid(List list, int row) {
  return SliverGrid(
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        return _singlePlaylist();
      }, childCount: min(list.length, row * 3)),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 15,
          childAspectRatio: 0.7,
          crossAxisSpacing: 10));
}

Widget _singlePlaylist() {
  return Column(
    children: <Widget>[
      CachedNetworkImage(
        imageUrl:
            'http://b-ssl.duitang.com/uploads/item/201508/26/20150826221548_x3SAJ.jpeg',
        fit: BoxFit.contain,
      ),
      Padding(
        padding: EdgeInsets.only(top: 5),
        child: Text(
          '我是歌单我是歌单我是歌单我是歌单我是歌单我是歌单我是歌单我',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      )
    ],
  );
}
