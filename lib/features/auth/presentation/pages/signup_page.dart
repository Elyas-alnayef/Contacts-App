import 'package:contacts_app/features/auth/presentation/cubits/signup/signup_cubit.dart';
import 'package:contacts_app/features/auth/presentation/widgets/auth_navigate_button.dart';
import 'package:contacts_app/features/auth/presentation/widgets/auth_submit_button.dart';
import 'package:contacts_app/features/auth/presentation/widgets/auth_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constant/app_strings.dart';
import '../../domain/repositories/auth_repository.dart';
import '../widgets/auth_countries_dropDownList.dart';
import '../widgets/auth_textfield.dart';
import '../widgets/spacer_height.dart';
import '../../../../core/hepres/toast.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

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
                titleSection(),
                fromSction(context),
                const Height_29(),
                Row(
                  children: [
                    Checkbox(value: true, onChanged: (value) {}),
                    SizedBox(
                      width: 16,
                    ),
                    Text("I agree to the website terms end\n conditions",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w400))
                  ],
                ),
                const Height_22(),
                NavigateButton(
                    width: double.infinity,
                    name: 'Back',
                    function: () {
                      Navigator.pop(context);
                    }),
                const Height_24(),
                submitSection(context),
                const Height_24(),
                Center(
                  child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
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

//title
Widget titleSection() {
  return Padding(
    padding: const EdgeInsets.only(bottom: 24, top: 8),
    child: Text(
      AppStrings.createAccount,
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
    ),
  );
}

//form
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
          SectionTitle(title: "Account Details"),
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
                    hitn: AppStrings.firstName,
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
                      hitn: AppStrings.lastName,
                      isObscureText: false))
            ],
          ),
          const Height_32(),
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
            hitn: AppStrings.email,
            isObscureText: false,
          ),
          const Height_32(),
          BlocBuilder<SignupCubit, SignupState>(
            builder: (context, state) {
              return AuthTextField(
                validate: (value) {
                  if (value.isEmpty || value.length < 8) {
                    return ValidatroErrors.passwordValidagtorError;
                  } else {
                    return null;
                  }
                },
                controller: context.read<SignupCubit>().passwordController,
                func: () {
                  context.read<SignupCubit>().passwordTextFieldChanged();
                },
                hitn: AppStrings.password,
                isObscureText:
                    !BlocProvider.of<SignupCubit>(context).isPasswordshown,
                suffixIcon: InkWell(
                    onTap: () {
                      context.read<SignupCubit>().chagePasswordVisibility();
                    },
                    child: Icon(BlocProvider.of<SignupCubit>(context)
                        .suffixPasswordIcon)),
              );
            },
          ),
          SectionTitle(title: "Billing Details"),
          AuthTextField(
              validate: (value) {
                if (value.isEmpty) {
                  return ValidatroErrors.requirdFieldsValidagtorError;
                } else {
                  return null;
                }
              },
              func: () {
                context.read<SignupCubit>().companyNameTextFieldChanged();
              },
              controller: context.read<SignupCubit>().companyNameController,
              height: 52,
              hitn: AppStrings.companyName),
          const Height_32(),
          AuthTextField(
              func: () {
                context.read<SignupCubit>().vatTextFieldChanged();
              },
              validate: (value) {
                if (value.isEmpty) {
                  return ValidatroErrors.requirdFieldsValidagtorError;
                } else {
                  return null;
                }
              },
              controller: BlocProvider.of<SignupCubit>(context).vatController,
              height: 52,
              hitn: AppStrings.vatNumber),
          const Height_32(),
          AuthTextField(
              func: () {
                context.read<SignupCubit>().street1TextFieldChanged();
              },
              validate: (value) {
                if (value.isEmpty) {
                  return ValidatroErrors.requirdFieldsValidagtorError;
                } else {
                  return null;
                }
              },
              controller:
                  BlocProvider.of<SignupCubit>(context).streetController,
              height: 52,
              hitn: AppStrings.street1),
          const Height_32(),
          AuthTextField(
              func: () {
                context.read<SignupCubit>().street2TextFieldChanged();
              },
              validate: (value) {
                return null;
              },
              controller:
                  BlocProvider.of<SignupCubit>(context).street2Controller,
              height: 52,
              hitn: AppStrings.street2),
          const Height_32(),
          AuthTextField(
              func: () {
                context.read<SignupCubit>().cityTextFieldChanged();
              },
              validate: (value) {
                if (value.isEmpty) {
                  return ValidatroErrors.requirdFieldsValidagtorError;
                } else {
                  return null;
                }
              },
              controller: BlocProvider.of<SignupCubit>(context).cityController,
              height: 52,
              hitn: AppStrings.city),
          const Height_32(),
          AuthTextField(
              func: () {
                context.read<SignupCubit>().stateTextFieldChanged();
              },
              validate: (value) {
                if (value.isEmpty) {
                  return ValidatroErrors.requirdFieldsValidagtorError;
                } else {
                  return null;
                }
              },
              controller: BlocProvider.of<SignupCubit>(context).stateController,
              height: 52,
              hitn: AppStrings.state),
          const Height_32(),
          AuthTextField(
              func: () {
                context.read<SignupCubit>().zipTextFieldChanged();
              },
              validate: (value) {
                if (value.isEmpty) {
                  return ValidatroErrors.requirdFieldsValidagtorError;
                } else {
                  return null;
                }
              },
              controller: BlocProvider.of<SignupCubit>(context).zipController,
              height: 52,
              hitn: AppStrings.zip),
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
              ])
        ],
      ),
    ),
  );
}

//sumbmitsection
Widget submitSection(BuildContext context) {
  return BlocConsumer<SignupCubit, SignupState>(
    listener: (context, state) {
      if (state is RegisteFaild) {
        return showToast(state.message, Colors.red[200]!);
      } else if (state is RegisterSuccess) {
        return showToast(state.message, Colors.green[400]!);
      }
    },
    builder: (context, state) {
      if (state is RegisterLoading) {
        return Center(child: CircularProgressIndicator());
      } else {
        return SubmitButton(
            name: AppStrings.register,
            function: () {
              if (context
                  .read<SignupCubit>()
                  .formKey
                  .currentState!
                  .validate()) {
                if (state is TextFieldChangedCompleteState) {
                  context.read<SignupCubit>().signUp(SignUpUseCaseParameters(
                      cityName: state.city!,
                      companyName: state.companyName!,
                      countryName: state.countryName!,
                      satte: state.state!,
                      street1: state.street1!,
                      vat: state.vat!,
                      zip: state.zip!,
                      firstname: state.firstName!,
                      lastname: state.lastName!,
                      email: state.email!,
                      password: state.password!));
                }
              }
            });
      }
    },
  );
}
