import 'package:json_annotation/json_annotation.dart';
part 'user_model.g.dart';

@JsonSerializable(explicitToJson: true)
class UserModel {
  UserModelData data;
  int code;
  int message;
  UserModel({this.data, this.code, this.message});

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UserModelData {
  UserData user;
  String token;

  UserModelData({
    this.user,
    this.token,
  });

  factory UserModelData.fromJson(Map<String, dynamic> json) =>
      _$UserModelDataFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelDataToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UserData {
  int id;
  String username;
  String password;
  String phone;
  var money;
  String name;
  var gender;
  String birthday;
  var solar;
  var love_date;
  var vip_date;
  var love_uid;
  String date;

  UserData({
    this.id,
    this.username,
    this.password,
    this.phone,
    this.money,
    this.name,
    this.gender,
    this.birthday,
    this.solar,
    this.love_date,
    this.vip_date,
    this.love_uid,
    this.date,
  });

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}
