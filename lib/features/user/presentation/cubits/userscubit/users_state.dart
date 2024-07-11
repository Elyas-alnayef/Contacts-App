part of 'users_cubit.dart';

@immutable
sealed class UsersState {}

final class UsersInitialState extends UsersState {}

final class UsersLoadedState extends UsersState {
  final List<String>? deleteList;
  final List<UserEntity>? users;
  UsersLoadedState({this.deleteList, this.users});
  UsersLoadedState copyWith(
      {List<UserEntity>? users, List<String>? deleteList}) {
    return UsersLoadedState(
        users: users ?? this.users, deleteList: deleteList ?? this.deleteList);
  }
}

final class UsersFailureState extends UsersState {
  final String message;

  UsersFailureState({required this.message});
}

final class UsersSuccesState extends UsersState {
  final String  message;
  UsersSuccesState(this.message);
}
