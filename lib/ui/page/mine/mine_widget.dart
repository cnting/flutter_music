import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music/model/playlist.dart';
import 'package:flutter_music/ui/widget/provider_widget.dart';
import 'package:flutter_music/view_model/user_playlist_vm.dart';
import 'package:flutter_music/view_model/user_vm.dart';
import 'package:provider/provider.dart';

///歌单展开
class PlaylistExpandWidget extends StatefulWidget {
  final String headName;
  final List<PlaylistDetail> list;
  final List<Widget> headActions;

  const PlaylistExpandWidget(this.headName, this.list, this.headActions);

  @override
  _PlaylistExpandWidgetState createState() => _PlaylistExpandWidgetState();
}

class _PlaylistExpandWidgetState extends State<PlaylistExpandWidget> {
  bool isExpand = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[_head(), if (isExpand) ..._myPlayList()],
    );
  }

  Widget _head() {
    return Row(
      children: <Widget>[
        IconButton(
          icon: Icon(isExpand ? Icons.expand_more : Icons.chevron_right),
          onPressed: () {
            setState(() {
              this.isExpand = !this.isExpand;
            });
          },
        ),
        Text(
          widget.headName,
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
        ),
        Text(
          ' (${widget.list?.length ?? 0})',
          style: TextStyle(fontSize: 13, color: Colors.grey),
        ),
        Spacer(),
        ...widget.headActions
      ],
    );
  }

  List<Widget> _myPlayList() {
    return widget.list
            ?.map((PlaylistDetail playlistDetail) =>
                _playlistItem(playlistDetail))
            ?.toList() ??
        [];
  }

  Widget _playlistItem(PlaylistDetail playlistDetail) {
    Widget image = ClipRRect(
      child: CachedNetworkImage(
        imageUrl: playlistDetail.coverImgUrl,
        width: 50,
        height: 50,
      ),
      borderRadius: BorderRadius.circular(8),
    );

    return GestureDetector(
      child: Container(
        margin: EdgeInsets.only(left: 15, bottom: 10),
        child: Row(
          children: <Widget>[
            image,
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(playlistDetail.name),
                  Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: Text(
                      '${playlistDetail.trackCount}首 ${(playlistDetail.subscribed ?? false) ? 'by ${playlistDetail.creator.nickname}' : ''}',
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            IconButton(
              icon: Icon(Icons.more_vert, color: Colors.grey[350]),
              onPressed: () {},
            )
          ],
        ),
      ),
      onTap: () {},
    );
  }
}

///添加歌单
class CreatePlaylistWidget extends StatefulWidget {
  CreatePlaylistWidget();

  @override
  _CreatePlaylistWidgetState createState() => _CreatePlaylistWidgetState();
}

class _CreatePlaylistWidgetState extends State<CreatePlaylistWidget> {
  TextEditingController _controller;
  bool _isPrivite = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '新建歌单',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: TextFormField(
              controller: _controller,
              autofocus: true,
              decoration: InputDecoration(hintText: '请输入歌单标题'),
              maxLength: 40,
              validator: (String value) {
                if (value.isEmpty) {
                  return '请输入歌单标题';
                }
                return null;
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(0),
                child: Checkbox(
                  value: _isPrivite,
                  onChanged: (value) {
                    setState(() {
                      _isPrivite = !_isPrivite;
                    });
                  },
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
              ),
              Text('设置为隐私歌单')
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                child: Text(
                  '取消',
                  style: TextStyle(
                      fontSize: 16, color: Theme.of(context).primaryColor),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              ProviderWidget2(
                model1: UserPlaylistVM(Provider.of<GlobalUserVM>(context)),
                model2: Provider.of<GlobalPlaylistVM>(context),
                builder: (BuildContext context, UserPlaylistVM userPlaylistVM,
                    GlobalPlaylistVM globalPlaylistVM, Widget child) {
                  return FlatButton(
                    child: child,
                    onPressed: () {
                      if (Form.of(context).validate()) {
                        userPlaylistVM.createNewPlaylist(globalPlaylistVM,
                            _controller.value.text, _isPrivite);
                        Navigator.pop(context);
                      }
                    },
                  );
                },
                child: Text(
                  '提交',
                  style: TextStyle(
                      fontSize: 16, color: Theme.of(context).primaryColor),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
