import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class UserAccount {
  UserAccount();

  int id;
  String userName;
  int type;
  int whitelistAuthority;
  int createTime;
  String salt;
  int tokenVersion;
  int ban;
  int baoyueVersion;
  int donateVersion;
  int vipType;
  int viptypeVersion;
  bool anonimousUser;

  factory UserAccount.fromJson(Map<String, dynamic> json) =>
      _$UserAccountFromJson(json);

  toJson() => _$UserAccountToJson(this);
}

@JsonSerializable()
class UserProfile {
  UserProfile();

  bool mutual;
  String remarkName;
  bool defaultAvatar;
  String avatarUrl;
  int gender;
  int birthday;
  int city;
  int accountStatus;
  String nickname;
  int authStatus;
  int userId;
  String expertTags;
  int avatarImgId;
  int backgroundImgId;
  int userType;
  int vipType;

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);

  toJson() => _$UserProfileToJson(this);
}
