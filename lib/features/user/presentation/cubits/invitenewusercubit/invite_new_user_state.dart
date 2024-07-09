part of 'invite_new_user_cubit.dart';

@immutable
sealed class InviteNewUserState {}

final class InviteNewUserInitialState extends InviteNewUserState {}

final class InviteNewUserFailureState extends InviteNewUserState {
  final String message;

  InviteNewUserFailureState({required this.message});
}

final class InviteNewUserSuccessState extends InviteNewUserState {}

final class InviteNewUserLoadedState extends InviteNewUserState {
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? phoneNumber;
  final String? userType;
  final bool? isUnlooked;
  InviteNewUserLoadedState({
    this.email,
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.userType,
    this.isUnlooked,
  });
  InviteNewUserLoadedState copyWith({
    String? email,
    String? firstName,
    String? lastName,
    String? phoneNumber,
    String? userType,
    bool? isUnlooked,
  }) {
    return InviteNewUserLoadedState(
      email: email ?? this.email,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      userType: userType ?? this.userType,
      isUnlooked: isUnlooked ?? this.isUnlooked,
    );
  }
}
