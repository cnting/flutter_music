// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playlist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaylistDetail _$PlaylistDetailFromJson(Map<String, dynamic> json) {
  return PlaylistDetail()
    ..subscribers = json['subscribers'] as List
    ..subscribed = json['subscribed'] as bool
    ..creator = json['creator'] == null
        ? null
        : UserProfile.fromJson(json['creator'] as Map<String, dynamic>)
    ..artists = json['artists'] as String
    ..tracks = json['tracks'] as String
    ..updateFrequency = json['updateFrequency'] as String
    ..backgroundCoverId = json['backgroundCoverId'] as int
    ..backgroundCoverUrl = json['backgroundCoverUrl'] as String
    ..titleImage = json['titleImage'] as int
    ..titleImageUrl = json['titleImageUrl'] as String
    ..englishTitle = json['englishTitle'] as String
    ..opRecommend = json['opRecommend'] as bool
    ..subscribedCount = json['subscribedCount'] as int
    ..cloudTrackCount = json['cloudTrackCount'] as int
    ..createTime = json['createTime'] as int
    ..highQuality = json['highQuality'] as bool
    ..userId = json['userId'] as int
    ..updateTime = json['updateTime'] as int
    ..coverImgId = json['coverImgId'] as int
    ..newImported = json['newImported'] as bool
    ..anonimous = json['anonimous'] as bool
    ..totalDuration = json['totalDuration'] as int
    ..coverImgUrl = json['coverImgUrl'] as String
    ..specialType = json['specialType'] as int
    ..privacy = json['privacy'] as int
    ..trackUpdateTime = json['trackUpdateTime'] as int
    ..trackCount = json['trackCount'] as int
    ..commentThreadId = json['commentThreadId'] as String
    ..playCount = json['playCount'] as int
    ..trackNumberUpdateTime = json['trackNumberUpdateTime'] as int
    ..adType = json['adType'] as int
    ..tags = (json['tags'] as List)?.map((e) => e as String)?.toList()
    ..ordered = json['ordered'] as bool
    ..description = json['description'] as String
    ..status = json['status'] as int
    ..name = json['name'] as String
    ..id = json['id'] as int
    ..coverImgId_str = json['coverImgId_str'] as String;
}

Map<String, dynamic> _$PlaylistDetailToJson(PlaylistDetail instance) =>
    <String, dynamic>{
      'subscribers': instance.subscribers,
      'subscribed': instance.subscribed,
      'creator': instance.creator,
      'artists': instance.artists,
      'tracks': instance.tracks,
      'updateFrequency': instance.updateFrequency,
      'backgroundCoverId': instance.backgroundCoverId,
      'backgroundCoverUrl': instance.backgroundCoverUrl,
      'titleImage': instance.titleImage,
      'titleImageUrl': instance.titleImageUrl,
      'englishTitle': instance.englishTitle,
      'opRecommend': instance.opRecommend,
      'subscribedCount': instance.subscribedCount,
      'cloudTrackCount': instance.cloudTrackCount,
      'createTime': instance.createTime,
      'highQuality': instance.highQuality,
      'userId': instance.userId,
      'updateTime': instance.updateTime,
      'coverImgId': instance.coverImgId,
      'newImported': instance.newImported,
      'anonimous': instance.anonimous,
      'totalDuration': instance.totalDuration,
      'coverImgUrl': instance.coverImgUrl,
      'specialType': instance.specialType,
      'privacy': instance.privacy,
      'trackUpdateTime': instance.trackUpdateTime,
      'trackCount': instance.trackCount,
      'commentThreadId': instance.commentThreadId,
      'playCount': instance.playCount,
      'trackNumberUpdateTime': instance.trackNumberUpdateTime,
      'adType': instance.adType,
      'tags': instance.tags,
      'ordered': instance.ordered,
      'description': instance.description,
      'status': instance.status,
      'name': instance.name,
      'id': instance.id,
      'coverImgId_str': instance.coverImgId_str,
    };

Playlists _$PlaylistsFromJson(Map<String, dynamic> json) {
  return Playlists()
    ..playlist = (json['playlist'] as List)
        ?.map((e) => e == null
            ? null
            : PlaylistDetail.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$PlaylistsToJson(Playlists instance) => <String, dynamic>{
      'playlist': instance.playlist,
    };
