class ContactEntity {
  final String id;
  final String firstName;
  final String lataName;
  final String email1;
  final String email2;
  final String address1;
  final String address2;
  final String phoneNumber1;
  final String phoneNumber2;
  final String imageUrl;
  final String isActive;
  final String isFavorite;

  ContactEntity(this.isFavorite, this.id, 
      {required this.firstName,
      required this.lataName,
      required this.email1,
      required this.email2,
      required this.address1,
      required this.address2,
      required this.phoneNumber2,
      required this.phoneNumber1,
      required this.imageUrl,
      required this.isActive});
}
