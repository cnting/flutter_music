import 'package:flutter/material.dart';
import 'package:flutter_music/config/router/application.dart';
import 'package:flutter_music/config/router/routes.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    ///两秒后跳转首页
    Future.delayed(Duration(seconds: 2), () {
      App.router.navigateTo(context, Routes.home, replace: true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.red,
        child: Center(
          child: Text('我是Splash'),
        ),
      ),
    );
  }
}
