import 'package:contacts_app/features/auth/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  String firstName;
  String lastName;
  String role;
  String? id;
  String email;
  String phoneNumber;

  UserModel({
    required this.firstName,
    required this.lastName,
    required this.role,
    this.id,
    required this.email,
    required this.phoneNumber,
  }) : super(
            firstName: firstName,
            lastName: lastName,
            email: email,
            phoneNumber: phoneNumber,
            role: role);
  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        firstName: json['firstName'] as String  ,
        lastName: json['lastName'] as String,
        role: json['role'] as String,
        id: json['id'] as String? ??'',
        email: json['email'] as String,
        phoneNumber: json['phoneNumber'] as String,
      );

  Map<String, dynamic> toJson() => {
        'firstName': firstName,
        'lastName': lastName,
        'role': role,
        'id': id,
        'email': email,
        'phoneNumber': phoneNumber,
      };
}
