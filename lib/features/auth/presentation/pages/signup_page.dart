import 'package:contacts_app/features/auth/presentation/cubits/signup/signup_cubit.dart';
import 'package:contacts_app/features/auth/presentation/widgets/auth_navigate_button.dart';
import 'package:contacts_app/features/auth/presentation/widgets/auth_submit_button.dart';
import 'package:contacts_app/features/auth/presentation/widgets/auth_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/auth_countries_dropDownList.dart';
import '../widgets/auth_textfield.dart';
import '../widgets/spacer_height.dart';
import '../widgets/toast.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController emialController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController firstnameController = TextEditingController();
  TextEditingController companyNameController = TextEditingController();
  TextEditingController vatController = TextEditingController();
  TextEditingController streetController = TextEditingController();
  TextEditingController street2Controller = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController zipController = TextEditingController();
  String countryName = '';
  @override
  void dispose() {
    emialController.dispose();
    passwordController.dispose();
    lastnameController.dispose();
    firstnameController.dispose();
    companyNameController.dispose();
    vatController.dispose();
    streetController.dispose();
    street2Controller.dispose();
    cityController.dispose();
    stateController.dispose();
    zipController.dispose();
    super.dispose();
  }

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
                                controller: firstnameController,
                                height: 52,
                                hitn: 'First Name',
                                isObscureText: false),
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Expanded(
                              child: AuthTextField(
                                  controller: lastnameController,
                                  height: 52,
                                  hitn: 'Last Name',
                                  isObscureText: false))
                        ],
                      ),
                      height_32(),
                      AuthTextField(
                          controller: emialController,
                          height: 52,
                          hitn: 'Email',
                          isObscureText: false),
                      height_32(),
                      AuthTextField(
                          controller: passwordController,
                          height: 52,
                          hitn: 'Password',
                          isObscureText: true,
                          suffixIcon: Icon(Icons.remove_red_eye)),
                      SectionTitle(title: "Billing Details"),
                      AuthTextField(
                          controller: companyNameController,
                          height: 52,
                          hitn: 'Company Name'),
                      height_32(),
                      AuthTextField(
                          controller: vatController,
                          height: 52,
                          hitn: 'VAT Numer'),
                      height_32(),
                      AuthTextField(
                          controller: streetController,
                          height: 52,
                          hitn: 'Street'),
                      height_32(),
                      AuthTextField(
                          controller: street2Controller,
                          height: 52,
                          hitn: 'Street 2'),
                      height_32(),
                      AuthTextField(
                          controller: cityController, height: 52, hitn: 'City'),
                      height_32(),
                      AuthTextField(
                          controller: stateController,
                          height: 52,
                          hitn: 'State'),
                      height_32(),
                      AuthTextField(
                          controller: zipController, height: 52, hitn: 'Zip'),
                      height_32(),
                      DropDownCountriesList(
                          hint: "Select Your Country",
                          function: (value) {
                            countryName = value.toString();
                            return countryName;
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
                BlocConsumer<SignupCubit, SignupState>(

                  listener: (context, state) {
                    if (state is RegisteFaild) {
                      return buildToast(state.message, Colors.red[200]!);
                    } else if (state is RegisterSuccess) {
                      return buildToast(state.message, Colors.green[400]!);
                    }
                  },
                  builder: (context, state) {
                    if (state is RegisterLoading) {
                      return Center(child: CircularProgressIndicator());
                    } else {

                      return SubmitButton(
                          name: 'Register',
                          function: () {
                            try {
                              context.read<SignupCubit>().signUp({
                                'companyName': companyNameController.text,
                                'city': cityController.text,
                                'country': countryName,
                                'state': stateController.text,
                                'streetOne': streetController.text,
                                'vatNumber': vatController.text,
                                'zip': zipController.text,
                                'phoneNumber': "0531467889",
                                'firstName': firstnameController.text,
                                'lastName': lastnameController.text,
                                'email': emialController.text,
                                'password': passwordController.text
                              });
                            } catch (e) {
                              print(e);
                            }
                          });
                    }

                  },
                ),
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
