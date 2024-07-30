import 'package:contacts_app/core/error/failur.dart';
import 'package:contacts_app/core/usecase/usecase.dart';
import 'package:dartz/dartz.dart';

import '../repositories/contatc_repository.dart';

class DeleteContactByIdUseCase extends UseCase<dynamic,String> {
  final ContactRepository contactRepository;

  DeleteContactByIdUseCase({required this.contactRepository});

  @override
  Future<Either<Failure, dynamic>> call(String params) {
    return contactRepository.delteConatctById(contactId: params);
  }
}
