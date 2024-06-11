import 'package:bloc/bloc.dart';
import 'package:contacts_app/features/auth/domain/usecases/user_signup.dart';
import 'package:meta/meta.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final UserSignUp signUpUseCase;

  SignupCubit(this.signUpUseCase) : super(SignupInitial());
  Future<void> signUp(Map<String, dynamic> params) async {
    emit(RegisterLoading());
    Duration(milliseconds: 1500);
    var result = await signUpUseCase.call(params);
    result.fold((error) {
      emit(RegisteFaild(message: error.message));
    }, (response) {
      emit(RegisterSuccess(message: response));
    });
  }
}
