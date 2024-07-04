import 'package:contacts_app/features/contacts/presentation/pages/contacts_home_page.dart';
import 'package:contacts_app/features/contacts/presentation/pages/craete_new_contact_page.dart';
import 'package:contacts_app/features/contacts/presentation/pages/export_to_pdf_page.dart';
import 'package:contacts_app/features/user/presentation/pages/send_email_page.dart';
import 'package:contacts_app/features/user/presentation/pages/user_information_page.dart';
import 'package:contacts_app/features/user/presentation/pages/users_page.dart';
import 'package:flutter/material.dart';

import '../../features/auth/presentation/pages/email_verification_page.dart';
import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/auth/presentation/pages/reset_password_page.dart';
import '../../features/auth/presentation/pages/signup_page.dart';
import '../../features/company/presentation/pages/company_information_page.dart';
import '../../features/home/presentation/pages/home_page.dart';

class RoutesNames {
  static const String logIn = "/login";
  static const String signUp = "/signup";
  static const String emailVerification = "/emailVerification";
  static const String resetpassword = "/resetpassword";
  static const String home = "/home";
  static const String companyProfile = "/companyprofile";
  static const String userProfile = "/userprofile";
  static const String users = "/users";
  static const String contactsHome = "/contactshome";
  static const String createNewContact = "/createnewcontact";
  static const String exportToPDF = "/exporttopdf";
  static const String sendEmail = "/sendemail";
}

Map<String, Widget Function(BuildContext)> routes = {
  RoutesNames.signUp: (context) => SignUpPage(),
  RoutesNames.logIn: (context) => LogInPage(),
  RoutesNames.emailVerification: (context) => EmailVerificationPage(),
  RoutesNames.resetpassword: (context) => ResetPasswordPage(),
  RoutesNames.home: (context) => HomePage(),
  RoutesNames.companyProfile: (context) => CompanyInfomationPage(),
  RoutesNames.userProfile: (context) => UserInformationPage(),
  RoutesNames.users: (context) => UsersPage(),
  RoutesNames.contactsHome: (context) => ContactsHome(),
  RoutesNames.createNewContact: (context) => CreateNewContactPage(),
  RoutesNames.exportToPDF: (context) => ExportToPDFPage(),
  RoutesNames.sendEmail: (context) => SendEmailPage(),
};
