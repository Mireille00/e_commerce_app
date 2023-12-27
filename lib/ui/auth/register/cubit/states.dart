import 'package:e_commerce_app/domain/entities/AuthResultEntity.dart';

abstract class RegisterStates {}

class RegisterLoadingState extends RegisterStates {
  String? loadingMessage;

  RegisterLoadingState({required this.loadingMessage});
}

class RegisterInitialState extends RegisterStates {}

class RegisterErrorState extends RegisterStates {
  String? errorMessage;

  RegisterErrorState({required this.errorMessage});
}

class RegisterSuccessState extends RegisterStates {
  AuthResultEntity response;

  RegisterSuccessState({required this.response});
}
