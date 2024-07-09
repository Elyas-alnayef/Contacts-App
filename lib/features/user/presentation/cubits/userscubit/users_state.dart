part of 'users_cubit.dart';

@immutable
sealed class UsersState {}

final class UsersInitialState extends UsersState {}

final class UsersLoadedState extends UsersState {
  final List<UserEntity> users;
  UsersLoadedState({required this.users});
}

final class UsersFailureState extends UsersState {
  final String message;

  UsersFailureState({required this.message});
}
