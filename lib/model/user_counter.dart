import 'package:json_annotation/json_annotation.dart';

part 'user_counter.g.dart';


@JsonSerializable()
class UserCounter{
  UserCounter();

  int programCount;
  int djRadioCount;  //我的电台
  int mvCount;
  int artistCount;  //我的收藏
  int newProgramCount;
  int createDjRadioCount;
  int createdPlaylistCount;  //创建歌单
  int subPlaylistCount;


  factory UserCounter.fromJson(Map<String, dynamic> json) =>
      _$UserCounterFromJson(json);

  toJson() => _$UserCounterToJson(this);
}