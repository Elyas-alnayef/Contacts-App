import 'package:contacts_app/features/contacts/domain/entities/contact_entity.dart';

class ContatcModel extends ContactEntity {
  ContatcModel(super.isFavorite, super.id,
      {required super.firstName,
      required super.lataName,
      required super.email1,
      required super.email2,
      required super.address1,
      required super.address2,
      required super.phoneNumber2,
      required super.phoneNumber1,
      required super.imageUrl,
      required super.isActive});
}
