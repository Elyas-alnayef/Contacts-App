part of 'create_new_contact_cubit.dart';

@immutable
sealed class CreateNewContactState {}

final class CreateNewContactInitialState extends CreateNewContactState {
  final XFile? image;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phoneNumber;
  final String? emailTwo;
  final String? mobileNumber;
  final String? address;
  final String? addressTwo;
  CreateNewContactInitialState(
      {this.image,
      this.firstName,
      this.lastName,
      this.email,
      this.phoneNumber,
      this.emailTwo,
      this.mobileNumber,
      this.address,
      this.addressTwo});
  CreateNewContactInitialState copyWith({
    XFile? image,
    String? firstName,
    String? lastName,
    String? email,
    String? phoneNumber,
    String? emailTwo,
    String? mobileNumber,
    String? address,
    String? addressTwo,
  }) {
    return CreateNewContactInitialState(
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        image: image ?? this.image,
        email: email ?? this.email,
        emailTwo: emailTwo ?? this.emailTwo,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        mobileNumber: mobileNumber ?? this.mobileNumber,
        address: address ?? this.address,
        addressTwo: addressTwo ?? this.addressTwo);
  }
}

final class CreateNewContactFailureState extends CreateNewContactState {
  final String message;

  CreateNewContactFailureState({required this.message});
}

final class CreateNewContactSuccesState extends CreateNewContactState {
  final String message;
  CreateNewContactSuccesState(this.message);
}
