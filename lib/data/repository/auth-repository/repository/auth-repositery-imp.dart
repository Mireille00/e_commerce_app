import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/data/Api/base-error.dart';
import 'package:e_commerce_app/data/repository/auth-repository/dataSource/auth-remote-data-source-imp.dart';
import 'package:e_commerce_app/domain/entities/AuthResultEntity.dart';
import 'package:e_commerce_app/domain/repository/auth-repository/dataSource/auth-remote-data-source.dart';
import 'package:e_commerce_app/domain/repository/auth-repository/repository/auth-repository-contract.dart';

class AuthRepositoryImpl implements AuthRepositoryContract {
  AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<BaseError, AuthResultEntity>> register(String name,
      String email, String password, String rePassword, String phone) {
    return remoteDataSource.register(name, email, password, rePassword, phone);
  }

  @override
  Future<Either<BaseError, AuthResultEntity>> login(
      String email, String password) {
    return remoteDataSource.login(email, password);
  }

//@override
// Future<Either<Failures, AuthResultEntity>> login(String email, String password) {
//   return remoteDataSource.login(email, password);
// }
}

AuthRepositoryContract injectAuthRepository() {
  return AuthRepositoryImpl(remoteDataSource: injectAuthRemoteDataSource());
}
