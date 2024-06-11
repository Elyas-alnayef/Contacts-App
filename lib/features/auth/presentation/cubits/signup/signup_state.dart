part of 'signup_cubit.dart';

@immutable
sealed class SignupState {}

final class SignupInitial extends SignupState {}

final class RegisterSuccess extends SignupState {
  final String message;

  RegisterSuccess({required this.message});
}

final class RegisteFaild extends SignupState {
  final String message;

  RegisteFaild({required this.message});
}

final class RegisterLoading extends SignupState {}
