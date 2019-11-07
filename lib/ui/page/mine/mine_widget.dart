import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music/model/playlist.dart';
import 'package:flutter_music/ui/widget/common.dart';
import 'package:flutter_music/ui/widget/dialog.dart';
import 'package:flutter_music/ui/widget/list.dart';
import 'package:flutter_music/ui/widget/provider_widget.dart';
import 'package:flutter_music/util/theme.dart';
import 'package:flutter_music/view_model/user_playlist_vm.dart';
import 'package:oktoast/oktoast.dart';
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
          style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
        ),
        Text(
          ' (${widget.list?.length ?? 0})',
          style: const TextStyle(fontSize: 13, color: Colors.grey),
        ),
        Spacer(),
        ...widget.headActions
      ],
    );
  }

  List<Widget> _myPlayList() {
    return widget.list
            ?.map((PlaylistDetail playlistDetail) =>
                _PlaylistItem(playlistDetail))
            ?.toList() ??
        [];
  }
}

class _PlaylistItem extends StatefulWidget {
  final PlaylistDetail playlistDetail;

  const _PlaylistItem(this.playlistDetail);

  @override
  _PlaylistItemState createState() => _PlaylistItemState();
}

class _PlaylistItemState extends State<_PlaylistItem> {
  @override
  Widget build(BuildContext context) {
    Widget image = ClipRRect(
      child: CachedNetworkImage(
        imageUrl: widget.playlistDetail.coverImgUrl,
        width: 50,
        height: 50,
      ),
      borderRadius: BorderRadius.circular(8),
    );

    return GestureDetector(
      child: Container(
        margin: const EdgeInsets.only(left: 15, bottom: 10),
        child: Row(
          children: <Widget>[
            image,
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(widget.playlistDetail.specialType == 5
                      ? '我喜欢的音乐'
                      : widget.playlistDetail.name),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Text(
                      '${widget.playlistDetail.trackCount}首 ${(widget.playlistDetail.subscribed ?? false) ? 'by ${widget.playlistDetail.creator.nickname}' : ''}',
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            if (widget.playlistDetail.specialType == 5)
              Container(
                margin: const EdgeInsets.only(right: 15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.grey[300], width: 1)),
                padding: EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(
                      Icons.favorite_border,
                      size: 14,
                    ),
                    Text(
                      '心动模式',
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              )
            else
              IconButton(
                icon: Icon(Icons.more_vert, color: Colors.grey[350]),
                onPressed: () {
                  showPlaylistMenu(context, widget.playlistDetail);
                },
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
            padding: const EdgeInsets.only(top: 10),
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
              Checkbox(
                value: _isPrivite,
                onChanged: (value) {
                  setState(() {
                    _isPrivite = !_isPrivite;
                  });
                },
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
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
                  style: STheme.dialogBtnTextStyle(context),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              ProviderWidget2(
                model1: CreatePlaylistVM(),
                model2: Provider.of<GlobalPlaylistVM>(context),
                builder: (BuildContext context, CreatePlaylistVM vm,
                    GlobalPlaylistVM globalPlaylistVM, Widget child) {
                  return FlatButton(
                    child: child,
                    onPressed: () {
                      if (Form.of(context).validate()) {
                        vm.createNewPlaylist(globalPlaylistVM,
                            _controller.value.text, _isPrivite);
                        Navigator.pop(context);
                      }
                    },
                  );
                },
                child: Text(
                  '提交',
                  style: STheme.dialogBtnTextStyle(context),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

///点击歌单的【更多】按钮
void showPlaylistMenu(BuildContext context, PlaylistDetail playlistDetail) {
  showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.only(top: 15),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(12),
                  topRight: const Radius.circular(12))),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 15, bottom: 10),
                child: Text(
                  '歌单：${playlistDetail.name}',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Divider(),
              CustomListTile(
                  icon: const Icon(
                    Icons.file_download,
                    size: 20,
                  ),
                  title: '下载',
                  dividePaddingLeft: 50),
              CustomListTile(
                  icon: const Icon(
                    Icons.share,
                    size: 20,
                  ),
                  title: '分享',
                  dividePaddingLeft: 50),
              if (!(playlistDetail.subscribed ?? false))
                CustomListTile(
                    icon: const Icon(
                      Icons.edit,
                      size: 20,
                    ),
                    title: '编辑歌单信息',
                    dividePaddingLeft: 50),
              ProviderWidget2(
                model1: DeletePlaylistVM(),
                model2: Provider.of<GlobalPlaylistVM>(context),
                builder: (BuildContext context,
                    DeletePlaylistVM deletePlaylistVM,
                    GlobalPlaylistVM globalPlaylistVM,
                    Widget child) {
                  return CustomListTile(
                      icon: const Icon(
                        Icons.delete,
                        size: 20,
                      ),
                      title: '删除',
                      dividePaddingLeft: 50,
                      onPressed: () {
                        showAskDialog(context, '确定删除此歌单吗?', sureText: '删除',
                            btnCallback: (bool isSure) async {
                          if (isSure) {
                            showLoaderOverlay(
                                    context,
                                    deletePlaylistVM.deletePlaylist(
                                        globalPlaylistVM, playlistDetail.id))
                                .then((_) {
                              showToast('接口有问题');
//                              print(
//                                  '===>deletePlaylistVM.state:${deletePlaylistVM.state}');
//                              if (deletePlaylistVM.isSuccess()) {
//                                Navigator.pop(context);
//                              } else if (deletePlaylistVM.isError()) {
//                              }
                            });
                          }
                        });
                      });
                },
                child: Text(
                  '提交',
                  style: STheme.dialogBtnTextStyle(context),
                ),
              )
            ],
          ),
        );
      },
      shape: RoundedRectangleBorder(
          side: const BorderSide(color: Colors.transparent),
          borderRadius: const BorderRadius.only(
              topLeft: const Radius.circular(12),
              topRight: const Radius.circular(12))));
}

///点击【创建的歌单】的【更多】按钮
void showPlaylistsHeaderMenu(BuildContext context, String name, bool isOwner) {
  showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.only(top: 15),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                  topLeft: const Radius.circular(12),
                  topRight: const Radius.circular(12))),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 15, bottom: 10),
                child: Text(
                  name,
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Divider(),
              if (isOwner)
                CustomListTile(
                    icon: const Icon(
                      Icons.add_box,
                      size: 20,
                    ),
                    title: '创建新歌单',
                    dividePaddingLeft: 50,
                    onPressed: () {}),
              CustomListTile(
                  icon: const Icon(
                    Icons.list,
                    size: 20,
                  ),
                  title: '歌单管理',
                  dividePaddingLeft: 50),
              if (isOwner)
                CustomListTile(
                    icon: const Icon(
                      Icons.input,
                      size: 20,
                    ),
                    title: '截图导入歌单',
                    dividePaddingLeft: 50),
              if (isOwner)
                CustomListTile(
                    icon: const Icon(
                      Icons.av_timer,
                      size: 20,
                    ),
                    title: '恢复歌单',
                    dividePaddingLeft: 50),
            ],
          ),
        );
      },
      shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.transparent),
          borderRadius: const BorderRadius.only(
              topLeft: const Radius.circular(12),
              topRight: const Radius.circular(12))));
}
