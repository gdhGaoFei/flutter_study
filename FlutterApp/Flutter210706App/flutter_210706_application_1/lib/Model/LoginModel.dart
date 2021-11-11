// 请求数据
import 'package:flutter_210706_application_1/Untils/rsa/rsa_utils.dart';
import 'package:flutter_210706_application_1/global/Global.dart';
import 'package:json_annotation/json_annotation.dart';

// part 'LoginUserModel.g.dart';

class LoginModel {
  dynamic login_user(String name, String pwd) async {
    var pwd1 = await encodeString(pwd);
    var result = Global().dio.post(
      "zxw/user",
      queryParameters: {"password": pwd1, "username": name},
    );
    return result;
  }
}

@JsonSerializable()
class LoginUserModel {
  //success
  bool success;
  //msg
  String msg;
  //data
  LoginDataModel data;

  LoginUserModel(this.success, this.msg, this.data);

  // factory LoginUserModel.fromJson(Map<String, dynamic> json) =>
  //     _$LoginUserModelFromJson(json);
  // Map<String, dynamic> toJson() => _$LoginUserModelToJson(this);

  // @override
  // String toString() {
  //   // TODO: implement toString
  //   return super.toString();
  // }
}

@JsonSerializable()
class LoginDataModel {}
