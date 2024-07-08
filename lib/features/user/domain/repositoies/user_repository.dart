import 'package:dartz/dartz.dart';

import '../../../../core/error/failur.dart';

abstract class UserRepository {
  Future<Either<Failure, Map<String, dynamic>>> getAllUsers(
      {required String token});
  Future<Either<Failure, Map<String, dynamic>>> getUserInformation(
      {required String token});
  Future<Either<Failure, Map<String, dynamic>>> getUserInformationByUserId(
      {required int userId});
  Future<Either<Failure, Map<String, dynamic>>> deleteUserByUserId(
      {required int userId});
  Future<Either<Failure, Map<String, dynamic>>> deleteAllUsers(
      {required String token});
  Future<Either<Failure, Map<String, dynamic>>> updateUserInfromation(
      {required UpdateUserInformationUseCaseParams params});
  Future<Either<Failure, Map<String, dynamic>>> createNewUser(
      {required CreateNewUserUseCaseParams params});
}

class CreateNewUserUseCaseParams {
  final String firstname;
  final String lastName;
  final String email;
  final String phoneNumber;
  final String role;
  CreateNewUserUseCaseParams(
      {required this.firstname,
      required this.lastName,
      required this.email,
      required this.phoneNumber,
      required this.role});
}

class UpdateUserInformationUseCaseParams {
  final String firstname;
  final String lastName;
  final String email;
  final String phoneNumber;
  final String role;
  final String status;
  UpdateUserInformationUseCaseParams({required this.firstname, required this.lastName, required this.email, required this.phoneNumber, required this.role, required this.status});
}
