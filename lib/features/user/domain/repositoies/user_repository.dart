import 'package:contacts_app/features/user/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failur.dart';

abstract class UserRepository {
  Future<Either<Failure, List<UserEntity>>> getAllUsers();
  Future<Either<Failure, UserEntity>> getUserInformation();
  Future<Either<Failure, UserEntity>> getUserInformationByUserId(
      {required String userId});
  Future<Either<Failure, Map<String, dynamic>>> deleteUserByUserId(
      {required String userId});
  Future<Either<Failure, Map<String, dynamic>>> deleteAllUsers();
  Future<Either<Failure, UserEntity>> updateUserInfromation(
      {required UpdateUserInformationUseCaseParams params});
  Future<Either<Failure, UserEntity>> createNewUser(
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
  final String userId;
  final String firstname;
  final String lastName;
  final String email;
  final String phoneNumber;
  final String role;
  final String status;
  UpdateUserInformationUseCaseParams(
      {required this.userId,
      required this.firstname,
      required this.lastName,
      required this.email,
      required this.phoneNumber,
      required this.role,
      required this.status});
}
