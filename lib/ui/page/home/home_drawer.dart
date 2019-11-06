import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music/config/application.dart';
import 'package:flutter_music/config/router/routes.dart';
import 'package:flutter_music/ui/widget/button.dart';
import 'package:flutter_music/ui/widget/provider_widget.dart';
import 'package:flutter_music/util/colors.dart';
import 'package:flutter_music/view_model/user_vm.dart';
import 'package:provider/provider.dart';

Widget homeDrawer(BuildContext context) {
  return Drawer(
    child: Column(
      children: <Widget>[
        _drawerHeader(context),
      ],
    ),
  );
}

///系统DrawerHeader高度写死了，使用自定义的Container
Widget _drawerHeader(BuildContext context) {
  return Container(
    constraints: BoxConstraints(minHeight: 180),
    decoration: BoxDecoration(color: CommonColors.drawerHeaderBgColor),
    padding: EdgeInsets.symmetric(vertical: 20),
    child: ProviderWidget(
      model: Provider.of<GlobalUserVM>(context),
      builder: (
        context,
        GlobalUserVM value,
        Widget child,
      ) {
        if (value.isLogin) {
          return loginHeader(context, value);
        } else {
          return _notLoginHeader(context);
        }
      },
    ),
  );
}

Widget _notLoginHeader(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      Center(
        child: Text(
          '登录网易云音乐\n手机电脑多端同步,尽享海量高品质音乐',
          textAlign: TextAlign.center,
        ),
      ),
      Padding(
        padding: EdgeInsets.only(top: 10),
        child: OutlineButton(
          color: CommonColors.drawerTextColor,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              '立即登录',
              style: TextStyle(color: CommonColors.drawerTextColor),
            ),
          ),
          onPressed: () {
            App.router.navigateTo(context, Routes.login);
          },
        ),
      )
    ],
  );
}

Widget loginHeader(BuildContext context, GlobalUserVM userVM) {
  Widget avatar;
  if (userVM.userProfile.defaultAvatar) {
    avatar = Container(
      decoration: BoxDecoration(
          shape: BoxShape.circle, color: CommonColors.drawerTextColor),
      width: 90,
      height: 90,
      child: Text(
        '上 传\n头 像',
        style: TextStyle(color: Colors.white),
      ),
      alignment: Alignment.center,
    );
  } else {
    avatar = CachedNetworkImage(
      imageUrl: userVM.userProfile.avatarUrl,
      width: 90,
      height: 90,
    );
  }

  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 20),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        avatar,
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(userVM.userProfile.nickname,style: TextStyle(fontSize: 18),),
            Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20),color: Color(0xffdcdbdb)),
              padding: EdgeInsets.symmetric(vertical: 3,horizontal: 5),
              margin: EdgeInsets.only(left: 5),
              child: Text('Lv.0',style: TextStyle(fontStyle: FontStyle.italic),),
            ),
            Spacer(),
            PrimaryButton(
              padding: EdgeInsets.symmetric(vertical: 4),
              child: Text('签到'),
              onPressed: () {},
            )
          ],
        )
      ],
    ),
  );
}
