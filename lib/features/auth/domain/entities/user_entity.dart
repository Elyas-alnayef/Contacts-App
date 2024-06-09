// we use this entity to show the user details in the profile page
import 'package:hive/hive.dart';
part 'user_entity.g.dart';

@HiveType(typeId: 0)
class UserEntity {
  @HiveField(0)
  final String firstName;
  @HiveField(1)
  final String lastName;
  @HiveField(2)
  final String email;
  @HiveField(3)
  final String phoneNumber;
  @HiveField(4)
  final String role;
  UserEntity(
      {required this.firstName,
      required this.lastName,
      required this.email,
      required this.phoneNumber,
      required this.role});
}
