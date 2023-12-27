import 'package:e_commerce_app/data/model/response/ErrorD.dart';
import 'package:e_commerce_app/domain/entities/AuthResultEntity.dart';

import 'UseDto.dart';

/// message : "success"
/// user : {"name":"Ahmed Abd Al-Muti","email":"test200000010@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1OGEwOTI5MTAzMzdmYTQ0ZTRiODAwOSIsIm5hbWUiOiJBaG1lZCBBYmQgQWwtTXV0aSIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzAzNTQ1MTMwLCJleHAiOjE3MTEzMjExMzB9.2vAd-LeVH00fluEXA742x9JiplfxI74SiDF2KwoLbs4"

class RegisterResponse {
  RegisterResponse({
    this.message,
    this.user,
    this.error,
    this.statusMsg,
    this.token,
  });

  RegisterResponse.fromJson(dynamic json) {
    message = json['message'];
    statusMsg = json['statusMsg'];
    error = json['errors'] != null ? ErrorD.fromJson(json['errors']) : null;
    user = json['user'] != null ? UserDto.fromJson(json['user']) : null;
    token = json['token'];
  }

  String? message;
  UserDto? user;
  String? token;
  ErrorD? error;
  String? statusMsg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['statusMsg'] = statusMsg;
    map['errors'] = error;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['token'] = token;
    return map;
  }

  AuthResultEntity toAuthResultEntity() {
    return AuthResultEntity(
      token: token,
      userEntity: user?.toUserEntity(),
    );
  }
}
