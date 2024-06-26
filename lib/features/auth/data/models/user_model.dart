import 'package:contacts_app/features/auth/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  String firstName;
  String lastName;
  String? status;
  String role;
  int? companyId;
  dynamic company;
  String? id;
  String? userName;
  String? normalizedUserName;
  String email;
  String? normalizedEmail;
  bool? emailConfirmed;
  String? passwordHash;
  String? securityStamp;
  String? concurrencyStamp;
  String phoneNumber;
  bool? phoneNumberConfirmed;
  bool? twoFactorEnabled;
  dynamic lockoutEnd;
  bool? lockoutEnabled;
  int? accessFailedCount;

  UserModel({
    required this.firstName,
    required this.lastName,
    this.status,
    required this.role,
    this.companyId,
    this.company,
    this.id,
    this.userName,
    this.normalizedUserName,
    required this.email,
    this.normalizedEmail,
    this.emailConfirmed,
    this.passwordHash,
    this.securityStamp,
    this.concurrencyStamp,
    required this.phoneNumber,
    this.phoneNumberConfirmed,
    this.twoFactorEnabled,
    this.lockoutEnd,
    this.lockoutEnabled,
    this.accessFailedCount,
  }) : super(
            firstName: firstName,
            lastName: lastName,
            email: email,
            phoneNumber: phoneNumber,
            role: role);
  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        firstName: json['firstName'] as String ,
        lastName: json['lastName'] as String,
        status: json['status'] as String?,
        role: json['role'] as String,
        companyId: json['companyId'] as int?,
        company: json['company'] as dynamic,
        id: json['id'] as String?,
        userName: json['userName'] as String?,
        normalizedUserName: json['normalizedUserName'] as String?,
        email: json['email'] as String,
        normalizedEmail: json['normalizedEmail'] as String?,
        emailConfirmed: json['emailConfirmed'] as bool?,
        passwordHash: json['passwordHash'] as String?,
        securityStamp: json['securityStamp'] as String?,
        concurrencyStamp: json['concurrencyStamp'] as String?,
        phoneNumber: json['phoneNumber'] as String,
        phoneNumberConfirmed: json['phoneNumberConfirmed'] as bool?,
        twoFactorEnabled: json['twoFactorEnabled'] as bool?,
        lockoutEnd: json['lockoutEnd'] as dynamic,
        lockoutEnabled: json['lockoutEnabled'] as bool?,
        accessFailedCount: json['accessFailedCount'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'firstName': firstName,
        'lastName': lastName,
        'status': status,
        'role': role,
        'companyId': companyId,
        'company': company,
        'id': id,
        'userName': userName,
        'normalizedUserName': normalizedUserName,
        'email': email,
        'normalizedEmail': normalizedEmail,
        'emailConfirmed': emailConfirmed,
        'passwordHash': passwordHash,
        'securityStamp': securityStamp,
        'concurrencyStamp': concurrencyStamp,
        'phoneNumber': phoneNumber,
        'phoneNumberConfirmed': phoneNumberConfirmed,
        'twoFactorEnabled': twoFactorEnabled,
        'lockoutEnd': lockoutEnd,
        'lockoutEnabled': lockoutEnabled,
        'accessFailedCount': accessFailedCount,
      };
}
