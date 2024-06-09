import 'package:contacts_app/features/auth/presentation/widgets/auth_navigate_button.dart';
import 'package:contacts_app/features/auth/presentation/widgets/auth_submit_button.dart';
import 'package:contacts_app/features/auth/presentation/widgets/auth_title.dart';
import 'package:flutter/material.dart';

import '../widgets/auth_countries_dropDownList.dart';
import '../widgets/auth_textfield.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFF7F7F7),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 24, top: 8),
                  child: Text(
                    "Create Account",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(
                      top: 0.0, bottom: 16, left: 16, right: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(28),
                    color: Colors.white,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SectionTitle(title: "Account Details"),
                      Row(
                        children: [
                          Expanded(
                            child: AuthTextField(
                                height: 52,
                                hitn: 'First Name',
                                isObscureText: false),
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Expanded(
                              child: AuthTextField(
                                  height: 52,
                                  hitn: 'Last Name',
                                  isObscureText: false))
                        ],
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      AuthTextField(
                          height: 52, hitn: 'Email', isObscureText: false),
                      SizedBox(
                        height: 32,
                      ),
                      AuthTextField(
                          height: 52,
                          hitn: 'Password',
                          isObscureText: true,
                          suffixIcon: Icon(Icons.remove_red_eye)),
                      SectionTitle(title: "Billing Details"),
                      AuthTextField(height: 52, hitn: 'Company Name'),
                      SizedBox(
                        height: 32,
                      ),
                      AuthTextField(height: 52, hitn: 'VAT Numer'),
                      SizedBox(
                        height: 32,
                      ),
                      AuthTextField(height: 52, hitn: 'Street'),
                      SizedBox(
                        height: 32,
                      ),
                      AuthTextField(height: 52, hitn: 'Street 2'),
                      SizedBox(
                        height: 32,
                      ),
                      AuthTextField(height: 52, hitn: 'City'),
                      SizedBox(
                        height: 32,
                      ),
                      AuthTextField(height: 52, hitn: 'State'),
                      SizedBox(
                        height: 32,
                      ),
                      AuthTextField(height: 52, hitn: 'Zip'),
                      SizedBox(
                        height: 32,
                      ),
                      DropDownCountriesList(
                          hint: "Select Your Country",
                          function: (value) {
                            return value;
                          },
                          items: [
                            DropdownMenuItem(
                                child: Text("Syria"), value: 'Syria'),
                            DropdownMenuItem(child: Text("UAE"), value: 'UAE'),
                            DropdownMenuItem(child: Text("USA"), value: 'USA'),
                          ])
                    ],
                  ),
                ),
                SizedBox(height: 29),
                Row(
                  children: [
                    Checkbox(value: false, onChanged: (value) {}),
                    SizedBox(
                      width: 16,
                    ),
                    Text("I agree to the website terms end\n conditions",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w400))
                  ],
                ),
                SizedBox(
                  height: 22.5,
                ),
                NavigateButton(
                    width: double.infinity,
                    name: 'Back',
                    function: () {
                      Navigator.pop(context);
                    }),
                SizedBox(
                  height: 24,
                ),
                SubmitButton(name: 'Register', function: () {}),
                SizedBox(
                  height: 24,
                ),
                Center(
                  child: TextButton(
                      onPressed: () {},
                      child: Text('Sign in instead',
                          style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF4E73DF),
                              fontWeight: FontWeight.w400))),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
