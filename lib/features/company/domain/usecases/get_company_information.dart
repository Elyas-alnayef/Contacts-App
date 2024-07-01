import 'package:contacts_app/core/error/failur.dart';
import 'package:contacts_app/core/usecase/no_parameter_usecase.dart';
import 'package:dartz/dartz.dart';

import '../repositories/company_repository.dart';

class GetCompanyInformationUseCase
    extends UseCase {
  final CompanyRepository companyRepository;

  GetCompanyInformationUseCase({required this.companyRepository});

  @override
  Future<Either<Failure, dynamic>> call() {
    return companyRepository.getCompany();
  }
}
