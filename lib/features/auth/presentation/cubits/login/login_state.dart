part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginSuccess extends LoginState {
  final Map<String, dynamic> response;

  LoginSuccess({required this.response});
}

final class LoginFaild extends LoginState {
  final String message;

  LoginFaild({required this.message});
}

final class LoginLoading extends LoginState {}
