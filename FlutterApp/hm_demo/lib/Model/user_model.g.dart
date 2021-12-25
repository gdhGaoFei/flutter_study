// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return UserModel(
    data: json['data'] == null
        ? null
        : UserModelData.fromJson(json['data'] as Map<String, dynamic>),
    code: json['code'] as int,
    message: json['message'] as int,
  );
}

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'data': instance.data?.toJson(),
      'code': instance.code,
      'message': instance.message,
    };

UserModelData _$UserModelDataFromJson(Map<String, dynamic> json) {
  return UserModelData(
    user: json['user'] == null
        ? null
        : UserData.fromJson(json['user'] as Map<String, dynamic>),
    token: json['token'] as String,
  );
}

Map<String, dynamic> _$UserModelDataToJson(UserModelData instance) =>
    <String, dynamic>{
      'user': instance.user?.toJson(),
      'token': instance.token,
    };

UserData _$UserDataFromJson(Map<String, dynamic> json) {
  return UserData(
    id: json['id'],
    username: json['username'] as String,
    password: json['password'] as String,
    phone: json['phone'] as String,
    money: json['money'],
    name: json['name'] as String,
    gender: json['gender'],
    birthday: json['birthday'] as String,
    solar: json['solar'],
    love_date: json['love_date'],
    vip_date: json['vip_date'],
    love_uid: json['love_uid'],
    date: json['date'] as String,
  );
}

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'password': instance.password,
      'phone': instance.phone,
      'money': instance.money,
      'name': instance.name,
      'gender': instance.gender,
      'birthday': instance.birthday,
      'solar': instance.solar,
      'love_date': instance.love_date,
      'vip_date': instance.vip_date,
      'love_uid': instance.love_uid,
      'date': instance.date,
    };
