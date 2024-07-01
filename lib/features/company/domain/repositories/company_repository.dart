import '../../../../core/error/failur.dart';
import 'package:dartz/dartz.dart';

abstract class CompanyRepository {
  Future<Either<Failure, Map<String, dynamic>>> editCompany(
      EditCompanyUseCaseParameters params);
  Future<Either<Failure, Map<String, dynamic>>> getCompany();
}

class EditCompanyUseCaseParameters {
  final String companyName;
  final String vatNumber;
  final String streetOne;
  final String streetTwo;
  final String city;
  final String state;
  final String zip;
  final String country;
  EditCompanyUseCaseParameters(
      {required this.companyName,
      required this.vatNumber,
      required this.streetOne,
      required this.streetTwo,
      required this.city,
      required this.state,
      required this.zip,
      required this.country});
}

class GetCompanyInformationUseCaseParameters {
  final String usertoken;

  GetCompanyInformationUseCaseParameters({required this.usertoken});
}
