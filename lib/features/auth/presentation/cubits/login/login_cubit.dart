import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/usecases/user_login.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final UserLogIn logInUseCase;
  LoginCubit(this.logInUseCase) : super(LoginInitial());
  Future<void> LogIn(String email, String password) async {
    emit(LoginLoading());
    Duration(milliseconds: 1500);
    var result =
        await logInUseCase.call({'email': email, 'password': password});
    result.fold((error) {
      emit(LoginFaild(message: error.message));
    }, (response) {
      emit(LoginSuccess(response: response));
    });
  }
}
