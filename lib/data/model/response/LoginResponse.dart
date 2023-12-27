import 'package:e_commerce_app/data/model/response/UseDto.dart';
import 'package:e_commerce_app/domain/entities/AuthResultEntity.dart';

/// message : "success"
/// user : {"name":"Ahmed Abd Al-Muti","email":"ahmedmutti12@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYzZGQ2OTZjMTExYzAyYTY3ODE3NTIyOCIsIm5hbWUiOiJBaG1lZCBBYmQgQWwtTXV0aSIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzAzNjU5NDU4LCJleHAiOjE3MTE0MzU0NTh9.TMaI9SMqT76wBooimnbHIhgKgT5zeno_wT06G2Wf2Jc"

class LoginResponse {
  LoginResponse({
    this.message,
    this.user,
    this.statusMsg,
    this.token,
  });

  LoginResponse.fromJson(dynamic json) {
    message = json['message'];
    statusMsg = json['statusMsg'];
    user = json['user'] != null ? UserDto.fromJson(json['user']) : null;
    token = json['token'];
  }

  String? message;
  UserDto? user;
  String? token;
  String? statusMsg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['statusMsg'] = statusMsg;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['token'] = token;
    return map;
  }

  AuthResultEntity toAuthResultEntity() {
    return AuthResultEntity(
      userEntity: user?.toUserEntity(),
      token: token,
    );
  }
}
