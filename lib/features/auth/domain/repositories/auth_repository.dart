import 'package:contacts_app/features/auth/domain/entities/user_entity.dart';

import '../../../../core/error/failur.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<Failure, Map<String, dynamic>>> logIn(LogInUseCaseParameters params );
  Future<Either<Failure, String>> signUp(SignUpUseCaseParameters params );
  Future<Either<Failure, String>> resetPassword();
  Future<Either<Failure, UserEntity>> fetchCurrentAuthenticatedUser();
}
class LogInUseCaseParameters {
  final String email;
  final String password;
  LogInUseCaseParameters({required this.email, required this.password});
}
class SignUpUseCaseParameters {
  final String email;
  final String password;
  final String firstname;
  final String lastname;
  final String companyName;
  final String vat;
  final String street1;
  final String? street2;
  final String cityName;
  final String satte;
  final String zip;
  final String countryName;
  SignUpUseCaseParameters({required this.firstname,required this.lastname,required this.companyName,required this.vat,required this.street1, this.street2,required this.cityName,required this.satte,required this.zip,required this.countryName,required this.email, required this.password});
}

