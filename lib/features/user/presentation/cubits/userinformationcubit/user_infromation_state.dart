part of 'user_infromation_cubit.dart';

@immutable
sealed class UserInfromationState {}

final class UserInfromationInitial extends UserInfromationState {}

final class LoadedUserInfromationState extends UserInfromationState {
  final Map<String, dynamic> user;
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? phoneNumber;
  final String? userType;
  final bool? isUnlooked;
  final bool? isReadOnly;
  LoadedUserInfromationState(
      {required this.user,
      this.email,
      this.firstName,
      this.lastName,
      this.phoneNumber,
      this.userType,
      this.isUnlooked,
      this.isReadOnly});
  LoadedUserInfromationState copyWith(
    Map<String, dynamic>? user,
    String? email,
    String? firstName,
    String? lastName,
    String? phoneNumber,
    String? userType,
    bool? isUnlooked,
    bool? isReadOnly,
  ) {
    return LoadedUserInfromationState(
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

final class ErrorState extends UserInfromationState {}
