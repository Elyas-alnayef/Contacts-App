import 'package:hive/hive.dart';

part 'company_entity.g.dart';

@HiveType(typeId: 1)
class CompanyEntity {
  @HiveField(0)
  final String companName;
  @HiveField(1)
  final String street1;
  @HiveField(2)
  final String street2;
  @HiveField(3)
  final String zip;
  @HiveField(4)
  final String vatNumber;
  @HiveField(5)
  final String state;
  @HiveField(6)
  final String city;
  @HiveField(7)
  final String countryName;

  CompanyEntity(
      {required this.companName,
      required this.street1,
      required this.street2,
      required this.zip,
      required this.vatNumber,
      required this.state,
      required this.city,
      required this.countryName});
}
