import 'package:contacts_app/core/error/failur.dart';
import 'package:contacts_app/core/usecase/usecase.dart';
import 'package:contacts_app/features/contacts/domain/repositories/contatc_repository.dart';
import 'package:dartz/dartz.dart';

class CreateNewContatcUseCase
    extends UseCase<dynamic, CreateNewContactUseCaseParams> {
  final ContactRepository contactRepository;

  CreateNewContatcUseCase({required this.contactRepository});

  @override
  Future<Either<Failure, dynamic>> call(CreateNewContactUseCaseParams params) {
    return contactRepository.createNewContatc(params);
  }
}
