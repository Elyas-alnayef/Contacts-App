import 'package:bloc/bloc.dart';
import 'package:contacts_app/core/constant/api_end_points.dart';
import 'package:contacts_app/core/constant/app_routes.dart';
import 'package:contacts_app/core/utils/shared_perferances_service.dart';
import 'package:contacts_app/features/user/data/datasources/remote_data_source.dart';
import 'package:contacts_app/features/user/domain/entities/user_entity.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../../../../core/functions/token_decoder.dart';
import '../../../../user/data/repositories/user_repository_imp.dart';
import '../../../domain/repositories/auth_repository.dart';
import '../../../domain/usecases/user_login.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isPasswordshown = false;
  IconData suffixPasswordIcon = Icons.visibility_off;
  final UserLogInUseCase logInUseCase;

  LoginCubit(this.logInUseCase) : super(LoginInitial());
  Future<void> LogIn(String email, String password) async {
    emit(LoginLoadingState());
    Duration(milliseconds: 1500);
    var result = await logInUseCase
        .call(LogInUseCaseParameters(email: email, password: password));
    result.fold((error) {
      emit(LoginFaildState(message: error.message));
    }, (response) async {
      Map<String, dynamic> decodedtoken =
          tokenDecoder(SharedPrefs.getData("token"));

      UserRemoteDtatSourceImpl userdate = UserRemoteDtatSourceImpl(dio: Dio());
      var data = await userdate.getUserById(
          endPoint: ApiEndPoints.usersEndPoint,
          userId: decodedtoken["Id"].toString());
      SharedPrefs.saveUserInfo({
        "id": data["id"],
        "firstName": data["firstName"],
        "lastName": data["lastName"],
        "email": data["email"]
      });
      emit(LoginSuccessState(response: response));
    });
  }

  void navigateToSignUpPage(context) {
    Navigator.of(context).pushNamed(RoutesNames.signUp);
  }

  void navigateToResetPasswordPage(context) {
    Navigator.of(context).pushNamed(RoutesNames.resetpassword);
  }

  void navigateToHomePage(context) {
    Navigator.of(context).pushNamed(RoutesNames.home);
  }

  void chagePasswordVisibility() {
    isPasswordshown = !isPasswordshown;
    suffixPasswordIcon =
        isPasswordshown ? Icons.visibility : Icons.visibility_off;
    emit(ChangePasswordSuffixIconSate());
  }

  void passwordTextFieldChanged() {
    if (state is TextFieldChangedCompleteState) {
      emit((state as TextFieldChangedCompleteState)
          .copyWith(password: passwordController.text));
    } else {
      emit(TextFieldChangedCompleteState(password: passwordController.text));
    }
  }

  void emailTextFieldChanged() {
    if (state is TextFieldChangedCompleteState) {
      emit((state as TextFieldChangedCompleteState)
          .copyWith(email: emailController.text));
    } else {
      emit(TextFieldChangedCompleteState(email: emailController.text));
    }
  }

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
  }
}
