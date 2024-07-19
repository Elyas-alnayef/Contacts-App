import 'package:contacts_app/core/error/failur.dart';
import 'package:dartz/dartz.dart';

abstract class ContactRepository {
  Future<Either<Failure, dynamic>> addContactImage();
  Future<Either<Failure, dynamic>> createNewContatc(
      CreateNewContactUseCaseParams params);
  Future<Either<Failure, dynamic>> deleteAllContacts();
  Future<Either<Failure, dynamic>> delteConatctById();
  Future<Either<Failure, dynamic>> getAllContatcs();
  Future<Either<Failure, dynamic>> getContatcById();
  Future<Either<Failure, dynamic>> sendContatcEmail(
      SendContactEmailUseCaseParams params);
  Future<Either<Failure, dynamic>> updateContatc(
      UpdateContactUseCaseParams params);
  Future<Either<Failure, dynamic>> toggleFavorite();
}

class CreateNewContactUseCaseParams {}

class UpdateContactUseCaseParams {}

class SendContactEmailUseCaseParams {}
