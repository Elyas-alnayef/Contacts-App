import 'package:contacts_app/core/error/failur.dart';
import 'package:contacts_app/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:contacts_app/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../domain/repositories/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthLocalDataSource authLocalDataSource;
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImpl(
      {required this.authLocalDataSource, required this.authRemoteDataSource});
 

  @override
  Future<Either<Failure, Map<String, dynamic>>> logIn(
      LogInUseCaseParameters params) async {
    try {
      var data =
          await authRemoteDataSource.logIn(params.email, params.password);
      return right(data);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailre.fromDioError(e));
      }
      return left(UnkownFailre(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> resetPassword() {
    // TODO: implement resetPassword
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> signUp(SignUpUseCaseParameters params) async {
    try {
      var data = await authRemoteDataSource.signUp(params);
      return right(data);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailre.fromDioError(e));
      }
      return left(UnkownFailre(message: e.toString()));
    }
  }
}
