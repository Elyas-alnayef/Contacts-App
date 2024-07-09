import '../../domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  String firstName;
  String lastName;
  String role;
  String id;
  String email;
  String phoneNumber;
  String status;

  UserModel({
    required this.status,
    required this.firstName,
    required this.lastName,
    required this.role,
    required this.id,
    required this.email,
    required this.phoneNumber,
  }) : super(
            firstName: firstName,
            lastName: lastName,
            email: email,
            phoneNumber: phoneNumber,
            role: role,
            id: id,
            status: status);
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      status: json['status']??"",
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      role: json['role'] as String,
      id: json['id'] as String? ?? '',
      email: json['email'] as String,
      phoneNumber: json['phoneNumber'] as String,
    );
  }
  Map<String, dynamic> toJson() => {
        'firstName': firstName,
        'lastName': lastName,
        'role': role,
        'id': id,
        'email': email,
        'phoneNumber': phoneNumber,
      };
}
