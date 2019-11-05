// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_counter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserCounter _$UserCounterFromJson(Map<String, dynamic> json) {
  return UserCounter()
    ..programCount = json['programCount'] as int
    ..djRadioCount = json['djRadioCount'] as int
    ..mvCount = json['mvCount'] as int
    ..artistCount = json['artistCount'] as int
    ..newProgramCount = json['newProgramCount'] as int
    ..createDjRadioCount = json['createDjRadioCount'] as int
    ..createdPlaylistCount = json['createdPlaylistCount'] as int
    ..subPlaylistCount = json['subPlaylistCount'] as int;
}

Map<String, dynamic> _$UserCounterToJson(UserCounter instance) =>
    <String, dynamic>{
      'programCount': instance.programCount,
      'djRadioCount': instance.djRadioCount,
      'mvCount': instance.mvCount,
      'artistCount': instance.artistCount,
      'newProgramCount': instance.newProgramCount,
      'createDjRadioCount': instance.createDjRadioCount,
      'createdPlaylistCount': instance.createdPlaylistCount,
      'subPlaylistCount': instance.subPlaylistCount,
    };
