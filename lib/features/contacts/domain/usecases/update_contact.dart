import 'package:contacts_app/core/error/failur.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/usecase/usecase.dart';
import '../repositories/contatc_repository.dart';

class UpdateContactUseCase
    extends UseCase<dynamic, UpdateContactUseCaseParams> {
  final ContactRepository contactRepository;

  UpdateContactUseCase({required this.contactRepository});

  @override
  Future<Either<Failure, dynamic>> call(UpdateContactUseCaseParams params) {
    return contactRepository.updateContatc(params);
  }
}
