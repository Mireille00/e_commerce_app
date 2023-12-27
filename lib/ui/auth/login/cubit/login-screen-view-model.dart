import 'package:e_commerce_app/domain/useCase/login-use-case.dart';
import 'package:e_commerce_app/ui/auth/login/cubit/login-states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreenViewModel extends Cubit<LoginStates> {
  LoginUseCase loginUsecase;

  LoginScreenViewModel({required this.loginUsecase})
      : super(LoginInitialState());
  var passwordController = TextEditingController();
  var emailController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool isObscure = true;

  void login() async {
    if (formKey.currentState!.validate() == true) {
      emit(LoginLoadingState(loadingMessage: 'Loading...'));
      var either = await loginUsecase.invoke(
          emailController.text, passwordController.text);
      either.fold((l) {
        emit(LoginErrorState(errorMessage: l.errorMessage));
      }, (response) {
        emit(LoginSuccessState(response: response));
      });
    }
  }
}
