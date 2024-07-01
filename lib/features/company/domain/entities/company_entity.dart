class CompanyEntity {
  final String companName;
  final String street1;
  final String street2;
  final String zip;
  final String vatNumber;
  final String state;
  final String city;
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
