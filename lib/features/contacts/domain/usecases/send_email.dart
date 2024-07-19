import 'package:contacts_app/core/error/failur.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/usecase/usecase.dart';
import '../repositories/contatc_repository.dart';

class SendContactEmailUseCase
    extends UseCase<dynamic, SendContactEmailUseCaseParams> {
  final ContactRepository contactRepository;

  SendContactEmailUseCase({required this.contactRepository});

  @override
  Future<Either<Failure, dynamic>> call(SendContactEmailUseCaseParams params) {
    return contactRepository.sendContatcEmail(params);
  }
}
