import 'package:contacts_app/features/contacts/domain/entities/contact_entity.dart';

class ContactModel extends ContactEntity {
  int id;
  String firstName;
  String lastName;
  String email1;
  String email2;
  String address1;
  String address2;
  String phoneNumber1;
  String phoneNumber2;
  String imageUrl;
  String isActive;
  bool isFavorite;
  ContactModel(
      {required this.isFavorite,
      required this.id,
      required this.firstName,
      required this.lastName,
      required this.email1,
      required this.email2,
      required this.address1,
      required this.address2,
      required this.phoneNumber2,
      required this.phoneNumber1,
      required this.imageUrl,
      required this.isActive})
      : super(
            address1: address1,
            address2: address2,
            email1: email1,
            email2: email2,
            firstName: firstName,
            lastName: lastName,
            phoneNumber1: phoneNumber1,
            phoneNumber2: phoneNumber2,
            id: id,
            imageUrl: imageUrl,
            isActive: isActive,
            isFavorite: isFavorite);
  factory ContactModel.fromJson(Map<String, dynamic> json) {
    return ContactModel(
      id: json['id']??0,
      firstName: json['firstName']??"",
      lastName: json['lastName']??"",
      email1: json['email']??"",
      email2: json['emailTwo']??"",
      address1: json['address']??"",
      address2: json['addressTwo']??"",
      phoneNumber1: json['phoneNumber'],
      phoneNumber2: json['mobileNumber']??"",
      imageUrl: json['imageUrl']??"",
      isActive: json['status']??"",
      isFavorite: json['isFavorite']??false,
    );
  }
}
