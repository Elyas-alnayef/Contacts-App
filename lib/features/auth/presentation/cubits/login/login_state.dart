part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {
}

final class LoginSuccessState extends LoginState {
  final Map<String, dynamic> response;

  LoginSuccessState({required this.response});
}

final class LoginFaildState extends LoginState {
  final String message;

  LoginFaildState({required this.message});
}

final class LoginLoadingState extends LoginState {}
final class TextFieldChangedCompleteState extends LoginState {
  final String? email;
  final String? password;

  TextFieldChangedCompleteState({this.email, this.password});

  TextFieldChangedCompleteState copyWith({String? password, String? email}) {
    return TextFieldChangedCompleteState(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
final class passwordVisiblityState extends LoginState {
  final bool visible ;
  passwordVisiblityState({ this.visible=true});
}
final class ChangePasswordSuffixIconSate extends LoginState {}

