import 'package:flutter_music/model/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'playlist.g.dart';

@JsonSerializable()
class PlaylistDetail {
  PlaylistDetail();

  List subscribers;
  bool subscribed; //是否订阅，为false表示创建的歌单，为true表示收藏的歌单
  UserProfile creator; //创建者
  String artists; //这个不知道啥类型
  String tracks; //追踪，好像是记录谁翻唱过，暂时不用
  String updateFrequency;
  int backgroundCoverId;
  String backgroundCoverUrl;
  int titleImage;
  String titleImageUrl;
  String englishTitle;
  bool opRecommend;
  int subscribedCount;
  int cloudTrackCount;
  int createTime;
  bool highQuality;
  int userId;
  int updateTime;
  int coverImgId;
  bool newImported;
  bool anonimous;
  int totalDuration;
  String coverImgUrl;
  int specialType;
  int privacy;
  int trackUpdateTime;
  int trackCount;
  String commentThreadId;
  int playCount;
  int trackNumberUpdateTime;
  int adType;
  List<String> tags;
  bool ordered;
  String description;
  int status;
  String name;
  String coverImgId_str;

  factory PlaylistDetail.fromJson(Map<String, dynamic> json) =>
      _$PlaylistDetailFromJson(json);

  toJson() => _$PlaylistDetailToJson(this);
}

@JsonSerializable()
class Playlists{
  Playlists();

  List<PlaylistDetail> playlist;

  factory Playlists.fromJson(Map<String, dynamic> json) =>
      _$PlaylistsFromJson(json);

  toJson() => _$PlaylistsToJson(this);
}
