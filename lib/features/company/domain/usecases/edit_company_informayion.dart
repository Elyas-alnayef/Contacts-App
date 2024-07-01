import 'package:contacts_app/core/error/failur.dart';
import 'package:contacts_app/core/usecase/usecase.dart';
import 'package:dartz/dartz.dart';

import '../repositories/company_repository.dart';

class EditCompanyInformationUseCase
    extends UseCase<dynamic, EditCompanyUseCaseParameters> {
  final CompanyRepository companyRepository;

  EditCompanyInformationUseCase({required this.companyRepository});

  @override
  Future<Either<Failure, dynamic>> call(EditCompanyUseCaseParameters params) {
    return companyRepository.editCompany(params);
  }
}
