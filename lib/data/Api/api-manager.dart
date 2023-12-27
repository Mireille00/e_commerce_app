import 'dart:convert';
import 'dart:core';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/data/Api/api-constants.dart';
import 'package:e_commerce_app/data/Api/base-error.dart';
import 'package:e_commerce_app/data/model/request/LoginRequest.dart';
import 'package:e_commerce_app/data/model/request/RegisterRequest.dart';
import 'package:e_commerce_app/data/model/response/LoginResponse.dart';
import 'package:e_commerce_app/data/model/response/RegisterResponse.dart';
import 'package:http/http.dart' as http;

class ApiManager {
  ApiManager._();

  static ApiManager? _instance;

  static ApiManager getInstance() {
    _instance ??= ApiManager._();
    return _instance!;
  }

  /*
    https://ecommerce.routemisr.com/api/v1/auth/signup
     */

  Future<Either<BaseError, RegisterResponse>> register(String name,
      String email, String password, String rePassword, String phone) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.registerApi);

      var requestBody = RegisterRequest(
          name: name,
          email: email,
          password: password,
          phone: phone,
          rePassword: rePassword);

      var response = await http.post(url, body: requestBody.toJson());
      var registerResponse =
          RegisterResponse.fromJson(jsonDecode(response.body));
      if (response.statusCode == 200 && response.statusCode < 300) {
        return Right(registerResponse);
      } else {
        return Left(BaseError(
            errorMessage: registerResponse.error != null
                ? registerResponse.error!.msg
                : registerResponse.message));
      }
    } else {
      //no internet connection
      return Left(
          BaseError(errorMessage: 'please check your internet connection'));
    }
  }

  Future<Either<BaseError, LoginResponse>> login(
      String email, String password) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.loginApi);

      var requestBody = LoginRequest(
        email: email,
        password: password,
      );

      var response = await http.post(url, body: requestBody.toJson());
      var loginResponse = LoginResponse.fromJson(jsonDecode(response.body));
      if (response.statusCode == 200 && response.statusCode < 300) {
        return Right(loginResponse);
      } else {
        return Left(BaseError(errorMessage: loginResponse.message));
      }
    } else {
      //no internet connection
      return Left(
          BaseError(errorMessage: 'please check your internet connection'));
    }
  }
}
