import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constant/app_strings.dart';
import '../../../../core/widgets/appbar.dart';
import '../../../../core/widgets/drawer.dart';
import '../../../auth/presentation/cubits/signup/signup_cubit.dart';
import '../../../auth/presentation/widgets/auth_countries_dropDownList.dart';
import '../../../auth/presentation/widgets/auth_navigate_button.dart';
import '../../../auth/presentation/widgets/auth_textfield.dart';
import '../../../auth/presentation/widgets/auth_title.dart';
import '../../../auth/presentation/widgets/spacer_height.dart';

class CompanyInfomationPage extends StatelessWidget {
  const CompanyInfomationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBarWidget(),
      backgroundColor: Color(0xFFF7F7F7),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 24, bottom: 0),
                child: Text(
                  "Home / Company Profile",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  bottom: 24,
                ),
                child: Divider(
                  color: Colors.black26,
                ),
              ),
              fromSction(context),
            ],
          ),
        ),
      ),
    );
  }
}

//title
Widget titleSection() {
  return Padding(
    padding: const EdgeInsets.only(bottom: 24, top: 8),
    child: Text(
      AppStrings.myprofile,
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
    ),
  );
}

Widget fromSction(BuildContext context) {
  return Form(
    key: BlocProvider.of<SignupCubit>(context).formKey,
    child: Container(
      width: double.infinity,
      padding: EdgeInsets.only(top: 0.0, bottom: 16, left: 16, right: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionTitle(title: AppStrings.myprofile),
          AuthTextField(
            controller: BlocProvider.of<SignupCubit>(context).emailController,
            validate: (value) {
              if (value.isEmpty || !value.contains('@gmail.com')) {
                return ValidatroErrors.emailValidagtorError;
              } else {
                return null;
              }
            },
            func: () {
              context.read<SignupCubit>().emailTextFieldChanged();
            },
            hitn: AppStrings.companyName,
            isObscureText: false,
          ),
          const Height_32(),
          Row(
            children: [
              Expanded(
                child: AuthTextField(
                    func: () {
                      context.read<SignupCubit>().firstNameTextFieldChanged();
                    },
                    validate: (value) {
                      if (value.isEmpty) {
                        return ValidatroErrors.firstNameValidagtorError;
                      } else {
                        return null;
                      }
                    },
                    controller: BlocProvider.of<SignupCubit>(context)
                        .firstNameController,
                    height: 52,
                    hitn: AppStrings.street1,
                    isObscureText: false),
              ),
              SizedBox(
                width: 16,
              ),
              Expanded(
                  child: AuthTextField(
                      validate: (value) {
                        if (value.isEmpty) {
                          return ValidatroErrors.lastNameValidagtorError;
                        } else {
                          return null;
                        }
                      },
                      func: () {
                        context.read<SignupCubit>().lastNameTextFieldChanged();
                      },
                      controller: BlocProvider.of<SignupCubit>(context)
                          .lastNameController,
                      height: 52,
                      hitn: AppStrings.street2,
                      isObscureText: false))
            ],
          ),
          const Height_32(),
          Row(
            children: [
              Expanded(
                child: AuthTextField(
                    func: () {
                      context.read<SignupCubit>().firstNameTextFieldChanged();
                    },
                    validate: (value) {
                      if (value.isEmpty) {
                        return ValidatroErrors.firstNameValidagtorError;
                      } else {
                        return null;
                      }
                    },
                    controller: BlocProvider.of<SignupCubit>(context)
                        .firstNameController,
                    height: 52,
                    hitn: AppStrings.vatNumber,
                    isObscureText: false),
              ),
              SizedBox(
                width: 16,
              ),
              Expanded(
                  child: AuthTextField(
                      validate: (value) {
                        if (value.isEmpty) {
                          return ValidatroErrors.lastNameValidagtorError;
                        } else {
                          return null;
                        }
                      },
                      func: () {
                        context.read<SignupCubit>().lastNameTextFieldChanged();
                      },
                      controller: BlocProvider.of<SignupCubit>(context)
                          .lastNameController,
                      height: 52,
                      hitn: AppStrings.zip,
                      isObscureText: false))
            ],
          ),
          const Height_32(),
          Row(
            children: [
              Expanded(
                child: AuthTextField(
                    func: () {
                      context.read<SignupCubit>().firstNameTextFieldChanged();
                    },
                    validate: (value) {
                      if (value.isEmpty) {
                        return ValidatroErrors.firstNameValidagtorError;
                      } else {
                        return null;
                      }
                    },
                    controller: BlocProvider.of<SignupCubit>(context)
                        .firstNameController,
                    height: 52,
                    hitn: AppStrings.city,
                    isObscureText: false),
              ),
              SizedBox(
                width: 16,
              ),
              Expanded(
                  child: AuthTextField(
                      validate: (value) {
                        if (value.isEmpty) {
                          return ValidatroErrors.lastNameValidagtorError;
                        } else {
                          return null;
                        }
                      },
                      func: () {
                        context.read<SignupCubit>().lastNameTextFieldChanged();
                      },
                      controller: BlocProvider.of<SignupCubit>(context)
                          .lastNameController,
                      height: 52,
                      hitn: AppStrings.state,
                      isObscureText: false))
            ],
          ),
          const Height_32(),
          DropDownCountriesList(
              hint: "Select Your Country",
              function: (value) {
                BlocProvider.of<SignupCubit>(context)
                    .countryNameSelected(value.toString());
              },
              items: [
                DropdownMenuItem(child: Text("Syria"), value: 'Syria'),
                DropdownMenuItem(child: Text("UAE"), value: 'UAE'),
                DropdownMenuItem(child: Text("USA"), value: 'USA'),
              ]),
          SizedBox(height: 44),
          NavigateButton(width: double.infinity, name: 'Edit', function: () {}),
          SizedBox(height: 20),
          NavigateButton(width: double.infinity, name: 'Back', function: () {}),
        ],
      ),
    ),
  );
}
