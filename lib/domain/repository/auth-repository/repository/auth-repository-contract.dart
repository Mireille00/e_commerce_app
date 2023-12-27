import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/data/Api/base-error.dart';
import 'package:e_commerce_app/domain/entities/AuthResultEntity.dart';

abstract class AuthRepositoryContract {
  Future<Either<BaseError, AuthResultEntity>> register(String name,
      String email, String password, String rePassword, String phone);

  Future<Either<BaseError, AuthResultEntity>> login(
      String email, String password);
}
