import 'package:contacts_app/core/error/failur.dart';
import 'package:contacts_app/features/contacts/domain/repositories/contatc_repository.dart';

import 'package:dartz/dartz.dart';

import '../../../../core/usecase/no_parameter_usecase.dart';

class AddImageUseCase extends UseCase {
  final ContactRepository contactRepository;

  AddImageUseCase({required this.contactRepository});
  @override
  Future<Either<Failure, dynamic>> call() {
    return contactRepository.addContactImage();
  }
}
