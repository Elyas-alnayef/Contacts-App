class ApiEndPoints {
  static String apiBaseUrl = "https://ms.itmd-b1.com:5123/api/";
  static String loginEndPoint = 'login';
  static String registerEndPoint = 'register';
  static String companyEndPoint = 'Companies';
  static String usersEndPoint = 'Users';
  static String contactsEndPoint = 'Contacts';
  static String usersCurrentUserEndPoint = '"Users/current-user"';
  static String contactsToggleFavoriteEndPoint =
      '$contactsEndPoint/toggle-favorite';
  static String contactsGetImageUrlEndPoint = 'image-url';
  static String contactsSendEmailEndPoint = 'send-email';
}
