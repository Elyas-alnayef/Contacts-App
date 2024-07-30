import 'package:contacts_app/core/error/failur.dart';
import 'package:contacts_app/features/contacts/data/datasources/contact_local_data_source.dart';
import 'package:contacts_app/features/contacts/data/datasources/contact_remote_data_source.dart';
import 'package:contacts_app/features/contacts/data/models/contatc_model.dart';
import 'package:contacts_app/features/contacts/domain/entities/contact_entity.dart';
import 'package:contacts_app/features/contacts/domain/repositories/contatc_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class ContactRepositoryImpl extends ContactRepository {
  final ContactLoaclDataSource contactLoaclDataSource;
  final ContactRemoteDataSource contactRemoteDataSource;
  ContactRepositoryImpl(
      {required this.contactLoaclDataSource,
      required this.contactRemoteDataSource});

  @override
  Future<Either<Failure, dynamic>> addContactImage() {
    // TODO: implement addContactImage
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> createNewContatc(
      CreateNewContactUseCaseParams params) async {
    var data;
    try {
      data = await contactRemoteDataSource.createNewContact(params: params);
      return right(data);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailre.fromDioError(e));
      } else {
        return left(UnkownFailre(message: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, dynamic>> deleteAllContacts() {
    // TODO: implement deleteAllContacts
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, dynamic>> delteConatctById(
      {required String contactId}) async {
    var data;
    try {
      data =
          await contactRemoteDataSource.deleteContactById(contactId: contactId);
      return right(data);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailre.fromDioError(e));
      } else {
        return left(UnkownFailre(message: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<ContactEntity>>> getAllContatcs() async {
    var data;
    List<ContactEntity> contacts = [];
    try {
      data = await contactRemoteDataSource.getContacts();
      data.forEach((element) {
        contacts.add(ContactModel.fromJson(element));
      });
      return right(contacts);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailre.fromDioError(e));
      } else {
        return left(UnkownFailre(message: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, dynamic>> getContatcById() {
    // TODO: implement getContatcById
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, dynamic>> sendContatcEmail(
      SendContactEmailUseCaseParams params) async {
    try {
      var response = await contactRemoteDataSource.sendEmail(params: params);
      return right(response);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailre.fromDioError(e));
      } else {
        return left(UnkownFailre(message: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, ContactEntity>> toggleFavorite(
      {required String contactId}) async {
    try {
      var response =
          await contactRemoteDataSource.toggleFavorite(contactId: contactId);
      return right(response);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailre.fromDioError(e));
      } else {
        return left(UnkownFailre(message: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, dynamic>> updateContatc(
      UpdateContactUseCaseParams params) {
    // TODO: implement updateContatc
    throw UnimplementedError();
  }
}
