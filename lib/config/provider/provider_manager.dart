import 'package:flutter_music/view_model/user_vm.dart';
import 'package:provider/provider.dart';

List<SingleChildCloneableWidget> providers = [
  ChangeNotifierProvider<UserVM>.value(value: UserVM()..initUser())
];
