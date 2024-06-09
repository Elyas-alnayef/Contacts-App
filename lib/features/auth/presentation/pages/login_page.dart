import 'package:contacts_app/features/auth/presentation/pages/signup_page.dart';
import 'package:flutter/material.dart';
import '../widgets/auth_navigate_button.dart';
import '../widgets/auth_submit_button.dart';
import '../widgets/auth_textfield.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 64,
              ),
              Container(
                width: 145.29,
                height: 151,
                child: Image.asset('assets/images/c.png'),
              ),
              SizedBox(
                height: 57,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                padding: EdgeInsets.symmetric(vertical: 14),
                child: Column(
                  children: [
                    AuthTextField(
                      hitn: 'Email',
                      isObscureText: false,
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    AuthTextField(
                        hitn: 'Password',
                        isObscureText: true,
                        suffixIcon: Icon(Icons.remove_red_eye)),
                    SizedBox(
                      height: 32,
                    ),
                    SubmitButton(function: () {}, name: "Sign in"),
                    SizedBox(
                      height: 32,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child:
                                Divider(color: Colors.black, thickness: 1.0)),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text("Don't have an account ?",
                              style: TextStyle(fontWeight: FontWeight.w600)),
                        ),
                        Expanded(
                            child:
                                Divider(color: Colors.black, thickness: 1.0)),
                      ],
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    NavigateButton(
                        function: () {
                          Navigator.of(context).pushNamed('/signup');
                        },
                        name: "Sign up"),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
