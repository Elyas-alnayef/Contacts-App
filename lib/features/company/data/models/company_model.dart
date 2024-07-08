import '../../domain/entities/company_entity.dart';

class CompanyModel extends CompanyEntity {
  CompanyModel(
      {required super.companName,
      required super.street1,
      required super.street2,
      required super.zip,
      required super.vatNumber,
      required super.state,
      required super.city,
      required super.countryName});
  factory CompanyModel.fromJson(Map<String, dynamic> json) {
    return  CompanyModel(
        companName: json['companyName'] as String,
        street1: json['streetOne'] as String,
        street2: json['streetTwo'] as String,
        vatNumber: json['vatNumber'] as String? ?? '',
        state: json['state'] as String,
        countryName: json['country'] as String,
        city: json['city'] as String,
        zip: json['zip'] as String,
      );
  }
}
