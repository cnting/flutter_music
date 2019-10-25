import 'package:flutter/material.dart';

import 'config/router/application.dart';
import 'config/util/theme.dart';

void main() {
  init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Music',
      theme: appTheme,
      onGenerateRoute: App.router.generator,
    );
  }
}
