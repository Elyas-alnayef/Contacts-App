import 'package:contacts_app/core/error/failur.dart';
import 'package:contacts_app/features/user/data/datasources/local_data_source.dart';
import 'package:contacts_app/features/user/data/datasources/remote_data_source.dart';

import 'package:dartz/dartz.dart';

import '../../domain/repositoies/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  final UserLocalDataSource userLocalDataSource;
  final UserRemoteDtatSource userRemoteDtatSource;

  UserRepositoryImpl(
      {required this.userLocalDataSource, required this.userRemoteDtatSource});

  @override
  Future<Either<Failure, Map<String, dynamic>>> createNewUser(
      {required CreateNewUserUseCaseParams params}) {
    // TODO: implement createNewUser
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> deleteAllUsers(
      {required String token}) {
    // TODO: implement deleteAllUsers
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> deleteUserByUserId(
      {required int userId}) {
    // TODO: implement deleteUserByUserId
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> getAllUsers(
      {required String token}) {
    // TODO: implement getAllUsers
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> getUserInformation(
      {required String token}) {
    // TODO: implement getUserInformation
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> getUserInformationByUserId(
      {required int userId}) {
    // TODO: implement getUserInformationByUserId
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> updateUserInfromation(
      {required UpdateUserInformationUseCaseParams params}) {
    // TODO: implement updateUserInfromation
    throw UnimplementedError();
  }
}
