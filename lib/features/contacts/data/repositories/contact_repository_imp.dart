import 'package:contacts_app/core/error/failur.dart';
import 'package:contacts_app/features/contacts/data/datasources/contact_local_data_source.dart';
import 'package:contacts_app/features/contacts/data/datasources/contact_remote_data_source.dart';
import 'package:contacts_app/features/contacts/domain/repositories/contatc_repository.dart';
import 'package:dartz/dartz.dart';

class ContactRepositoryImpl extends ContactRepository{
  final ContactLoaclDataSource contactLoaclDataSource;
  final ContactRemoteDataSource contactRemoteDataSource;
  ContactRepositoryImpl({required this.contactLoaclDataSource, required this.contactRemoteDataSource});

  @override
  Future<Either<Failure, dynamic>> addContactImage() {
    // TODO: implement addContactImage
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, dynamic>> createNewContatc(CreateNewContactUseCaseParams params) {
    // TODO: implement createNewContatc
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, dynamic>> deleteAllContacts() {
    // TODO: implement deleteAllContacts
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, dynamic>> delteConatctById() {
    // TODO: implement delteConatctById
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, dynamic>> getAllContatcs() {
    // TODO: implement getAllContatcs
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, dynamic>> getContatcById() {
    // TODO: implement getContatcById
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, dynamic>> sendContatcEmail(SendContactEmailUseCaseParams params) {
    // TODO: implement sendContatcEmail
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, dynamic>> toggleFavorite() {
    // TODO: implement toggleFavorite
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, dynamic>> updateContatc(UpdateContactUseCaseParams params) {
    // TODO: implement updateContatc
    throw UnimplementedError();
  }
}
