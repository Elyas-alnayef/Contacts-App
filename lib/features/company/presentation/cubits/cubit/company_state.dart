part of 'company_cubit.dart';

@immutable
sealed class CompanyState {}

final class CompanyInitial extends CompanyState {}

final class CompanyLoadingState extends CompanyState {}

final class CompanyLoadedState extends CompanyState {
  final CompanyEntity company;
  CompanyLoadedState({required this.company});
}

final class CompanyEditsSavedState extends CompanyState {
  final Map<String, dynamic> company;

  CompanyEditsSavedState({required this.company});
}

final class CompanyEnableFormState extends CompanyState {
  final bool enableform;

  CompanyEnableFormState({required this.enableform});
}

final class LoadingCompanyFailerState extends CompanyState {
  final String message;

  LoadingCompanyFailerState({required this.message});
}

class TextFieldChangedCompleteState extends CompanyState {
  final String? vat;
  final String? companyName;
  final String? street1;
  final String? street2;
  final String? city;
  final String? state;
  final String? zip;
  final String? countryName;

  TextFieldChangedCompleteState({
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

final class SavedState extends CompanyState {
  SavedState();
}
