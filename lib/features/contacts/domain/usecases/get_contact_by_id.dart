import 'package:contacts_app/core/error/failur.dart';
import 'package:contacts_app/core/usecase/no_parameter_usecase.dart';
import 'package:dartz/dartz.dart';

import '../repositories/contatc_repository.dart';

class GetContactByIdUseCase extends UseCase {
  final ContactRepository contactRepository;

  GetContactByIdUseCase({required this.contactRepository});

  @override
  Future<Either<Failure, dynamic>> call() {
    return contactRepository.getContatcById();
  }
}
