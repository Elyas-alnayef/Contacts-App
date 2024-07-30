import 'package:contacts_app/core/error/failur.dart';
import 'package:contacts_app/features/contacts/domain/entities/contact_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/usecase/usecase.dart';
import '../repositories/contatc_repository.dart';

class ToggleFavoriteUseCase extends UseCase<dynamic,String> {
  final ContactRepository contactRepository;

  ToggleFavoriteUseCase({required this.contactRepository});

  @override
  Future<Either<Failure, ContactEntity>> call(String params) {
    return contactRepository.toggleFavorite(contactId: params);
  }
}
