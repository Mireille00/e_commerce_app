import 'package:e_commerce_app/domain/useCase/register_use_case.dart';
import 'package:e_commerce_app/ui/auth/register/cubit/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreenViewModel extends Cubit<RegisterStates> {
  RegisterUseCase registerUseCase;

  RegisterScreenViewModel({required this.registerUseCase})
      : super(RegisterInitialState());

//hold data- handle logic
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmationPasswordController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  bool isObscure = true;

  void register() async {
    if (formKey.currentState?.validate() == true) {
      emit(RegisterLoadingState(loadingMessage: 'Loading...'));
      var either = await registerUseCase.invoke(
          nameController.text,
          emailController.text,
          passwordController.text,
          confirmationPasswordController.text,
          phoneController.text);
      either.fold((l) {
        emit(RegisterErrorState(errorMessage: l.errorMessage));
      }, (response) {
        emit(RegisterSuccessState(response: response));
      });
    }
  }
}
