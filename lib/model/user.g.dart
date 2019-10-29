// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserAccount _$UserAccountFromJson(Map<String, dynamic> json) {
  return UserAccount()
    ..id = json['id'] as int
    ..userName = json['userName'] as String
    ..type = json['type'] as int
    ..whitelistAuthority = json['whitelistAuthority'] as int
    ..createTime = json['createTime'] as int
    ..salt = json['salt'] as String
    ..tokenVersion = json['tokenVersion'] as int
    ..ban = json['ban'] as int
    ..baoyueVersion = json['baoyueVersion'] as int
    ..donateVersion = json['donateVersion'] as int
    ..vipType = json['vipType'] as int
    ..viptypeVersion = json['viptypeVersion'] as int
    ..anonimousUser = json['anonimousUser'] as bool;
}

Map<String, dynamic> _$UserAccountToJson(UserAccount instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userName': instance.userName,
      'type': instance.type,
      'whitelistAuthority': instance.whitelistAuthority,
      'createTime': instance.createTime,
      'salt': instance.salt,
      'tokenVersion': instance.tokenVersion,
      'ban': instance.ban,
      'baoyueVersion': instance.baoyueVersion,
      'donateVersion': instance.donateVersion,
      'vipType': instance.vipType,
      'viptypeVersion': instance.viptypeVersion,
      'anonimousUser': instance.anonimousUser,
    };

UserProfile _$UserProfileFromJson(Map<String, dynamic> json) {
  return UserProfile()
    ..mutual = json['mutual'] as bool
    ..remarkName = json['remarkName'] as String
    ..defaultAvatar = json['defaultAvatar'] as bool
    ..avatarUrl = json['avatarUrl'] as String
    ..gender = json['gender'] as int
    ..birthday = json['birthday'] as int
    ..city = json['city'] as int
    ..accountStatus = json['accountStatus'] as int
    ..nickname = json['nickname'] as String
    ..authStatus = json['authStatus'] as int
    ..userId = json['userId'] as int
    ..expertTags = json['expertTags'] as String
    ..avatarImgId = json['avatarImgId'] as int
    ..backgroundImgId = json['backgroundImgId'] as int
    ..userType = json['userType'] as int
    ..vipType = json['vipType'] as int;
}

Map<String, dynamic> _$UserProfileToJson(UserProfile instance) =>
    <String, dynamic>{
      'mutual': instance.mutual,
      'remarkName': instance.remarkName,
      'defaultAvatar': instance.defaultAvatar,
      'avatarUrl': instance.avatarUrl,
      'gender': instance.gender,
      'birthday': instance.birthday,
      'city': instance.city,
      'accountStatus': instance.accountStatus,
      'nickname': instance.nickname,
      'authStatus': instance.authStatus,
      'userId': instance.userId,
      'expertTags': instance.expertTags,
      'avatarImgId': instance.avatarImgId,
      'backgroundImgId': instance.backgroundImgId,
      'userType': instance.userType,
      'vipType': instance.vipType,
    };
