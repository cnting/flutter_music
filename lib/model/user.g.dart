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
    ..defaultAvatar = json['defaultAvatar'] as bool
    ..province = json['province'] as int
    ..authStatus = json['authStatus'] as int
    ..followed = json['followed'] as bool
    ..avatarUrl = json['avatarUrl'] as String
    ..accountStatus = json['accountStatus'] as int
    ..gender = json['gender'] as int
    ..city = json['city'] as int
    ..birthday = json['birthday'] as int
    ..userId = json['userId'] as int
    ..userType = json['userType'] as int
    ..nickname = json['nickname'] as String
    ..signature = json['signature'] as String
    ..description = json['description'] as String
    ..avatarImgId = json['avatarImgId'] as int
    ..backgroundImgId = json['backgroundImgId'] as int
    ..backgroundUrl = json['backgroundUrl'] as String
    ..authority = json['authority'] as int
    ..mutual = json['mutual'] as bool
    ..expertTags =
        (json['expertTags'] as List)?.map((e) => e as String)?.toList()
    ..experts = json['experts'] as Map<String, dynamic>
    ..djStatus = json['djStatus'] as int
    ..vipType = json['vipType'] as int
    ..remarkName = json['remarkName'] as String
    ..avatarImgIdStr = json['avatarImgIdStr'] as String
    ..backgroundImgIdStr = json['backgroundImgIdStr'] as String
    ..avatarImgId_str = json['avatarImgId_str'] as String;
}

Map<String, dynamic> _$UserProfileToJson(UserProfile instance) =>
    <String, dynamic>{
      'defaultAvatar': instance.defaultAvatar,
      'province': instance.province,
      'authStatus': instance.authStatus,
      'followed': instance.followed,
      'avatarUrl': instance.avatarUrl,
      'accountStatus': instance.accountStatus,
      'gender': instance.gender,
      'city': instance.city,
      'birthday': instance.birthday,
      'userId': instance.userId,
      'userType': instance.userType,
      'nickname': instance.nickname,
      'signature': instance.signature,
      'description': instance.description,
      'avatarImgId': instance.avatarImgId,
      'backgroundImgId': instance.backgroundImgId,
      'backgroundUrl': instance.backgroundUrl,
      'authority': instance.authority,
      'mutual': instance.mutual,
      'expertTags': instance.expertTags,
      'experts': instance.experts,
      'djStatus': instance.djStatus,
      'vipType': instance.vipType,
      'remarkName': instance.remarkName,
      'avatarImgIdStr': instance.avatarImgIdStr,
      'backgroundImgIdStr': instance.backgroundImgIdStr,
      'avatarImgId_str': instance.avatarImgId_str,
    };
