import 'package:flutter/material.dart';
import 'package:flutter_music/config/provider/provider_manager.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';

import 'config/application.dart';
import 'util/theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: OKToast(
        child: MaterialApp(
          title: 'Flutter Music',
          theme: appTheme,
          onGenerateRoute: App.router.generator,
        ),
      ),
    );
  }
}
