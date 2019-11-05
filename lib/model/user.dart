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

  bool defaultAvatar;
  int province;
  int authStatus;
  bool followed;
  String avatarUrl;
  int accountStatus;
  int gender;
  int city;
  int birthday;
  int userId;
  int userType;
  String nickname;
  String signature;
  String description;
  int avatarImgId;
  int backgroundImgId;
  String backgroundUrl;
  int authority;
  bool mutual;
  List<String> expertTags;  //标签，比如【华语】
  Map<String,dynamic> experts;     //人的标签，比如【音乐视频达人】
  int djStatus;
  int vipType;
  String remarkName;
  String avatarImgIdStr;
  String backgroundImgIdStr;
  String avatarImgId_str;


  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);

  toJson() => _$UserProfileToJson(this);
}
