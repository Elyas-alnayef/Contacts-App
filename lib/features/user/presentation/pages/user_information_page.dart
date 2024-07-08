
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constant/app_strings.dart';
import '../../../../core/widgets/appbar.dart';
import '../../../../core/widgets/drawer.dart';
import '../../../../core/widgets/editbutton.dart';
import '../../../../core/widgets/page_title.dart';
import '../../../auth/presentation/widgets/auth_countries_dropDownList.dart';
import '../../../auth/presentation/widgets/auth_navigate_button.dart';
import '../../../auth/presentation/widgets/auth_textfield.dart';
import '../../../auth/presentation/widgets/auth_title.dart';
import '../../../auth/presentation/widgets/spacer_height.dart';
import '../cubits/userinformationcubit/user_infromation_cubit.dart';
import '../widgets/togller_widget.dart';

class UserInformationPage extends StatelessWidget {
  const UserInformationPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerWidget(),
      appBar: const AppBarWidget(),
      backgroundColor: Color(0xFFF7F7F7),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PageTitle(
                title: "Home / Users /username",
              ),
              fromSction(context),
            ],
          ),
        ),
      ),
    );
  }
}

//form
Widget fromSction(BuildContext context) {
  return BlocProvider(
    create: (context) => UserInfromationCubit(),
    child: BlocConsumer<UserInfromationCubit, UserInfromationState>(
      builder: (context, state) {
        // ignore: dead_code
        if (false) {
        } else {
          return Form(
            key: context.read<UserInfromationCubit>().formKey,
            child: Container(
              width: double.infinity,
              padding:
                  EdgeInsets.only(top: 0.0, bottom: 16, left: 16, right: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28),
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Expanded(
                          child: SectionTitle(title: AppStrings.userDetials)),
                      Expanded(
                          child: TogllerWidget(
                        func: () {
                          context
                              .read<UserInfromationCubit>()
                              .changeLookState(false);
                        },
                        lable: "Unlocked",
                      )),
                    ],
                  ),
                  AuthTextField(
                    controller: BlocProvider.of<UserInfromationCubit>(context)
                        .emailController,
                    validate: (value) {
                      if (value.isEmpty) {
                        return ValidatroErrors.requirdFieldsValidagtorError;
                      } else {
                        return null;
                      }
                    },
                    func: () {},
                    hitn: AppStrings.email,
                    isObscureText: false,
                  ),
                  const Height_32(),
                  Row(
                    children: [
                      Expanded(
                        child: AuthTextField(
                            isEnabled: true,
                            func: () {},
                            validate: (value) {
                              if (value.isEmpty) {
                                return ValidatroErrors
                                    .requirdFieldsValidagtorError;
                              } else {
                                return null;
                              }
                            },
                            controller:
                                BlocProvider.of<UserInfromationCubit>(context)
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
                              isEnabled: true,
                              validate: (value) {
                                if (value.isEmpty) {
                                  return ValidatroErrors
                                      .requirdFieldsValidagtorError;
                                } else {
                                  return null;
                                }
                              },
                              func: () {},
                              controller:
                                  BlocProvider.of<UserInfromationCubit>(context)
                                      .lastNameController,
                              height: 52,
                              hitn: AppStrings.lastName,
                              isObscureText: false))
                    ],
                  ),
                  const Height_32(),
                  AuthTextField(
                      isEnabled: true,
                      func: () {},
                      validate: (value) {
                        if (value.isEmpty) {
                          return ValidatroErrors.requirdFieldsValidagtorError;
                        } else {
                          return null;
                        }
                      },
                      controller: BlocProvider.of<UserInfromationCubit>(context)
                          .phoneNumberController,
                      height: 52,
                      hitn: AppStrings.phoneNumber,
                      isObscureText: false),
                  const Height_32(),
                  BlocBuilder<UserInfromationCubit, UserInfromationState>(
                    builder: (context, state) {
                      return DropDownCountriesList(
                          value: null,
                          hint: "Select User Type",
                          function: (value) {},
                          items: [
                            DropdownMenuItem(
                                child: Text("Owner"), value: 'Owner'),
                            DropdownMenuItem(
                                child: Text("Normal User"),
                                value: 'Normal User'),
                            DropdownMenuItem(
                                child: Text("Admin"), value: 'Admin'),
                          ]);
                    },
                  ),
                  SizedBox(height: 44),
                  BlocBuilder<UserInfromationCubit, UserInfromationState>(
                    builder: (context, state) {
                      return EditButton(
                          width: double.infinity, function: () {});
                    },
                  ),
                  SizedBox(height: 20),
                  NavigateButton(
                      width: double.infinity,
                      name: 'Back',
                      function: () {
                        context
                            .read<UserInfromationCubit>()
                            .backToPrevious(context);
                      }),
                ],
              ),
            ),
          );
        }
      },
      listener: (BuildContext context, UserInfromationState state) {},
    ),
  );
}
