
import 'package:flutter/material.dart';

import '../../features/auth/presentation/pages/email_verification_page.dart';
import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/auth/presentation/pages/reset_password_page.dart';
import '../../features/auth/presentation/pages/signup_page.dart';
import '../../home_page.dart';
class RoutesNames{
  static const String logIn = "/login";
  static const String signUp = "/signup";
  static const String emailVerification = "/emailVerification";
  static const String resetpassword = "/resetpassword";
  static const String home = "/home";

  
}
Map<String, Widget Function(BuildContext)> routes = {
  RoutesNames.signUp: (context) => SignUpPage(),
  RoutesNames.logIn: (context) => LogInPage(),
  RoutesNames.emailVerification: (context) => EmailVerificationPage(),
  RoutesNames.resetpassword: (context) => ResetPasswordPage(),
  RoutesNames.home: (context) => HomePage(),
};
