import 'package:contacts_app/core/error/failur.dart';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../domain/repositories/company_repository.dart';
import '../datasources/company_local_data_source.dart';
import '../datasources/company_remote_data_source.dart';

class CompanyRepositoryImpl extends CompanyRepository {
  final CompanyRemoteDataSourceImpl companyRemoteDataSourceImpl;
  final CompayLocalDataSourceImpl compayLocalDataSourceImpl;

  CompanyRepositoryImpl(
      {required this.companyRemoteDataSourceImpl,
      required this.compayLocalDataSourceImpl});

  @override
  Future<Either<Failure, Map<String, dynamic>>> editCompany(
      EditCompanyUseCaseParameters params) async {
    try {
      var data =
          await companyRemoteDataSourceImpl.editTheAutUserCompany(params);
      return right(data);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailre.fromDioError(e));
      }
      return left(UnkownFailre(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> getCompany() async {
    try {
      var data = await companyRemoteDataSourceImpl.fetchTheAutUserCompany();
      return right(data);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailre.fromDioError(e));
      }
      return left(UnkownFailre(message: e.toString()));
    }
  }
}
