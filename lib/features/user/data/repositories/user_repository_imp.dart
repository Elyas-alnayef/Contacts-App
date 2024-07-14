import 'package:contacts_app/core/error/failur.dart';
import 'package:contacts_app/features/user/data/datasources/local_data_source.dart';
import 'package:contacts_app/features/user/data/datasources/remote_data_source.dart';
import 'package:contacts_app/features/user/data/model/user_model.dart';
import 'package:contacts_app/features/user/domain/entities/user_entity.dart';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/constant/api_end_points.dart';
import '../../domain/repositoies/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  final UserLocalDataSource userLocalDataSource;
  final UserRemoteDtatSource userRemoteDtatSource;

  UserRepositoryImpl(
      {required this.userLocalDataSource, required this.userRemoteDtatSource});

  @override
  Future<Either<Failure, UserEntity>> createNewUser(
      {required CreateNewUserUseCaseParams params}) async {
    try {
      var data = await userRemoteDtatSource.createNewUser(
          endPoint: ApiEndPoints.usersEndPoint, params: params);
      return right(UserModel.fromJson(data));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailre.fromDioError(e));
      } else {
        return left(UnkownFailre(message: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> deleteAllUsers() async {
    try {
      var data = await userRemoteDtatSource.deleteAllUsers(
          endPoint: ApiEndPoints.usersEndPoint);
      return right(data);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailre.fromDioError(e));
      } else {
        return left(UnkownFailre(message: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, dynamic>> deleteUserByUserId(
      {required String userId}) async {
    try {
      var data = await userRemoteDtatSource.deleteUSerById(
          endPoint: ApiEndPoints.usersEndPoint, userId: userId);
      return right(data);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailre.fromDioError(e));
      } else {
        return left(UnkownFailre(message: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<UserEntity>>> getAllUsers() async {
    var data;
    List<UserEntity> users = [];

    try {
      data = userLocalDataSource.getUsersList();
      users.addAll(data);
      if (data.isEmpty) {
        data = await userRemoteDtatSource.getAllUsers(
            endPoint: ApiEndPoints.usersEndPoint);
        data.forEach(
          (element) {
            users.add(UserModel.fromJson(element));
          },
        );
      }

      return right(users);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailre.fromDioError(e));
      } else {
        return left(UnkownFailre(message: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, UserEntity>> getUserInformation() async {
    try {
      var data = await userRemoteDtatSource.getCurrentUser(
          endPoint: ApiEndPoints.usersCurrentUserEndPoint);
      UserEntity user = UserModel.fromJson(data);
      return right(user);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailre.fromDioError(e));
      } else {
        return left(UnkownFailre(message: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, UserEntity>> getUserInformationByUserId(
      {required String userId}) async {
    var data;
    UserEntity? user;
    try {
      data = userLocalDataSource.getUser(userId);
      user = data;
      if (data == null) {
        data = await userRemoteDtatSource.getUserById(
            endPoint: ApiEndPoints.usersEndPoint, userId: userId);
        user = UserModel.fromJson(data);
      }
      return right(user!);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailre.fromDioError(e));
      } else {
        return left(UnkownFailre(message: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, UserEntity>> updateUserInfromation(
      {required UpdateUserInformationUseCaseParams params}) async {
    try {
      var data = await userRemoteDtatSource.updateUserInformaion(
          userId: params.userId,
          endPoint: ApiEndPoints.usersEndPoint,
          params: params);
      UserEntity user = UserModel.fromJson(data);
      return right(user);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailre.fromDioError(e));
      } else {
        return left(UnkownFailre(message: e.toString()));
      }
    }
  }
}
