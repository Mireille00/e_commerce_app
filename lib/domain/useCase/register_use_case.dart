import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/data/Api/base-error.dart';
import 'package:e_commerce_app/data/repository/auth-repository/repository/auth-repositery-imp.dart';
import 'package:e_commerce_app/domain/entities/AuthResultEntity.dart';
import 'package:e_commerce_app/domain/repository/auth-repository/repository/auth-repository-contract.dart';

class RegisterUseCase {
  AuthRepositoryContract repositoryContract;

  RegisterUseCase({required this.repositoryContract});

  Future<Either<BaseError, AuthResultEntity>> invoke(String name, String email,
      String password, String rePassword, String phone) async {
    var either = await repositoryContract.register(
        name, email, password, rePassword, phone);
    return either.fold((l) {
      return Left(BaseError(errorMessage: l.errorMessage));
    }, (response) {
      return Right(response);
    });
  }
}

RegisterUseCase injectRegisterUseCase() {
  return RegisterUseCase(repositoryContract: injectAuthRepository());
}
