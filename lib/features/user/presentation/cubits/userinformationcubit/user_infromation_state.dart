part of 'user_infromation_cubit.dart';

@immutable
sealed class UserInfromationState {}

final class UserInfromationInitialState extends UserInfromationState {}

final class UserInfromationSuccessSatet extends UserInfromationState {
  final String message;

  UserInfromationSuccessSatet({required this.message});
}

final class UserInfromationFailureState extends UserInfromationState {
  final String message;

  UserInfromationFailureState({required this.message});
}

final class UserInfromationLoadedState extends UserInfromationState {
  final UserEntity? user;
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? phoneNumber;
  final String? userType;
  final bool? isUnlooked;
  final bool? isReadOnly;

  UserInfromationLoadedState({
    this.user,
    this.email,
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.userType,
    this.isUnlooked,
    this.isReadOnly = true,
  });

  UserInfromationLoadedState copyWith({
    UserEntity? user,
    String? email,
    String? firstName,
    String? lastName,
    String? phoneNumber,
    String? userType,
    bool? isUnlooked,
    bool? isReadOnly,
  }) {
    return UserInfromationLoadedState(
      user: user ?? this.user,
      email: email ?? this.email,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      userType: userType ?? this.userType,
      isReadOnly: isReadOnly ?? this.isReadOnly,
      isUnlooked: isUnlooked ?? this.isUnlooked,
    );
  }
}
