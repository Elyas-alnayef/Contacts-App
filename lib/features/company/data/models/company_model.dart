import '../../domain/entities/company_entity.dart';

class CompanyModel extends CompanyEntity{
  CompanyModel({required super.companName, required super.street1, required super.street2, required super.zip, required super.vatNumber, required super.state, required super.city, required super.countryName});
}