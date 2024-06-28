import 'package:contacts_app/core/error/failur.dart';
import 'package:contacts_app/core/usecase/usecase.dart';
import 'package:dartz/dartz.dart';

import '../repositories/company_repository.dart';

class GetCompanyInformationUseCase
    extends UseCase<dynamic, EditCompanyUseCaseParameters> {
  final CompanyRepository companyRepository;

  GetCompanyInformationUseCase({required this.companyRepository});

  @override
  Future<Either<Failure, dynamic>> call(EditCompanyUseCaseParameters params) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
