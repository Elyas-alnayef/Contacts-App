import 'dart:io';

import 'package:contacts_app/core/error/failur.dart';
import 'package:contacts_app/features/contacts/domain/entities/contact_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';

abstract class ContactRepository {
  Future<Either<Failure, dynamic>> addContactImage();
  Future<Either<Failure, Map<String, dynamic>>> createNewContatc(
      CreateNewContactUseCaseParams params);
  Future<Either<Failure, dynamic>> deleteAllContacts();
  Future<Either<Failure, dynamic>> delteConatctById(
      {required String contactId});
  Future<Either<Failure, List<ContactEntity>>> getAllContatcs();
  Future<Either<Failure, dynamic>> getContatcById();
  Future<Either<Failure, dynamic>> sendContatcEmail(
      SendContactEmailUseCaseParams params);
  Future<Either<Failure, dynamic>> updateContatc(
      UpdateContactUseCaseParams params);
  Future<Either<Failure, ContactEntity>> toggleFavorite({required String contactId});
}

class CreateNewContactUseCaseParams {
  final XFile? image;
  final String firstName;
  final String lastName;
  final String email;
  final String emailTwo;
  final String phoneNumber;
  final String phoneNumberTwo;
  final String address;
  final String addressTwo;
  CreateNewContactUseCaseParams(
      {this.image,
      required this.firstName,
      required this.lastName,
      required this.email,
      this.emailTwo = "",
      required this.phoneNumber,
      this.phoneNumberTwo = "",
      required this.address,
      this.addressTwo = ""});
}

class UpdateContactUseCaseParams {}

class SendContactEmailUseCaseParams {
  final String to;
  final String cc;
  final String bcc;
  final String subject;
  final String body;

  SendContactEmailUseCaseParams(
      {required this.to,
      required this.cc,
      required this.bcc,
      required this.subject,
      required this.body});
}
