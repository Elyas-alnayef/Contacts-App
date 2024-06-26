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
class TextFieldChangedCompleteState extends SignupState {
  final String? email;
  final String? password;
  final String? firstName;
  final String? lastName;
  final String? vat;
  final String? companyName;
  final String? street1;
  final String? street2;
  final String? city;
  final String? state;
  final String? zip;
  final String? countryName;

  TextFieldChangedCompleteState({
    this.email,
    this.password,
    this.firstName,
    this.lastName,
    this.vat,
    this.companyName,
    this.street1,
    this.street2,
    this.city,
    this.state,
    this.zip,
    this.countryName,
  });

  TextFieldChangedCompleteState copyWith({
    String? email,
    String? password,
    String? firstName,
    String? lastName,
    String? vat,
    String? companyName,
    String? street1,
    String? street2,
    String? city,
    String? state,
    String? zip,
    String? countryName,
  }) {
    return TextFieldChangedCompleteState(
      email: email ?? this.email,
      password: password ?? this.password,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      vat: vat ?? this.vat,
      companyName: companyName ?? this.companyName,
      street1: street1 ?? this.street1,
      street2: street2 ?? this.street2,
      city: city ?? this.city,
      state: state ?? this.state,
      zip: zip ?? this.zip,
      countryName: countryName ?? this.countryName,
    );
  }
}
final class RegisterLoading extends SignupState {}

final class passwordVisiblityState extends SignupState {
  final bool visible ;
  passwordVisiblityState({ this.visible=true});
}
final class ChangePasswordSuffixIconSate extends SignupState {}
