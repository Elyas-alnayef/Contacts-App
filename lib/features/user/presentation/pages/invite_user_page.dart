// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:contacts_app/core/hepres/toast.dart';
import 'package:contacts_app/features/auth/presentation/widgets/auth_submit_button.dart';
import 'package:contacts_app/features/user/data/datasources/local_data_source.dart';
import 'package:contacts_app/features/user/data/datasources/remote_data_source.dart';
import 'package:contacts_app/features/user/data/repositories/user_repository_imp.dart';
import 'package:contacts_app/features/user/domain/repositoies/user_repository.dart';
import 'package:contacts_app/features/user/domain/usecases/create_new_user.dart';
import 'package:contacts_app/features/user/presentation/cubits/invitenewusercubit/invite_new_user_cubit.dart';
import 'package:dio/dio.dart';
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

class InviteNewUserPage extends StatelessWidget {
  const InviteNewUserPage({super.key});
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
                title: "Home / Users /Owner",
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
    create: (context) => InviteNewUserCubit(
        createNewUserUseCase: CreateNewUserUseCase(
            userRepository: UserRepositoryImpl(
                userLocalDataSource: UserLocalDataSourceImpl(),
                userRemoteDtatSource: UserRemoteDtatSourceImpl(dio: Dio())))),
    child: BlocConsumer<InviteNewUserCubit, InviteNewUserState>(
      builder: (context, state) {
        return Form(
          key: context.read<InviteNewUserCubit>().formKey,
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
                Row(
                  children: [
                    const Expanded(
                        child: SectionTitle(title: AppStrings.userDetials)),
                    Expanded(
                        child: TogllerWidget(
                      value: state is InviteNewUserLoadedState
                          ? state.isUnlooked ?? false
                          : false,
                      func: () {
                        context.read<InviteNewUserCubit>().togglerChanged(
                            state is InviteNewUserLoadedState
                                ? state.isUnlooked ?? false
                                : true);
                      },
                      lable: "Unlocked",
                    )),
                  ],
                ),
                AuthTextField(
                  controller: BlocProvider.of<InviteNewUserCubit>(context)
                      .emailController,
                  validate: (value) {
                    if (value.isEmpty) {
                      return ValidatroErrors.requirdFieldsValidagtorError;
                    } else {
                      return null;
                    }
                  },
                  func: () {
                    context.read<InviteNewUserCubit>().emailVauleChanged();
                  },
                  hitn: AppStrings.email,
                  isObscureText: false,
                ),
                const Height_32(),
                Row(
                  children: [
                    Expanded(
                      child: AuthTextField(
                          isEnabled: true,
                          func: () {
                            context
                                .read<InviteNewUserCubit>()
                                .firstNameVauleChanged();
                          },
                          validate: (value) {
                            if (value.isEmpty) {
                              return ValidatroErrors
                                  .requirdFieldsValidagtorError;
                            } else {
                              return null;
                            }
                          },
                          controller:
                              BlocProvider.of<InviteNewUserCubit>(context)
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
                            func: () {
                              context
                                  .read<InviteNewUserCubit>()
                                  .lastNameVauleChanged();
                            },
                            controller:
                                BlocProvider.of<InviteNewUserCubit>(context)
                                    .lastNameController,
                            height: 52,
                            hitn: AppStrings.lastName,
                            isObscureText: false))
                  ],
                ),
                const Height_32(),
                AuthTextField(
                    isEnabled: true,
                    func: () {
                      context.read<InviteNewUserCubit>().phoneVauleChanged();
                    },
                    validate: (value) {
                      if (value.isEmpty) {
                        return ValidatroErrors.requirdFieldsValidagtorError;
                      } else {
                        return null;
                      }
                    },
                    controller: BlocProvider.of<InviteNewUserCubit>(context)
                        .phoneNumberController,
                    height: 52,
                    hitn: AppStrings.phoneNumber,
                    isObscureText: false),
                const Height_32(),
                BlocBuilder<InviteNewUserCubit, InviteNewUserState>(
                  builder: (context, state) {
                    return DropDownCountriesList(
                        value: null,
                        validator: (value) {
                          if (value.isEmpty) {
                            return ValidatroErrors.requirdFieldsValidagtorError;
                          } else {
                            return null;
                          }
                        },
                        hint: "Select User Type",
                        function: (value) {
                          context
                              .read<InviteNewUserCubit>()
                              .userTypeVauleChanged(value!);
                        },
                        items: [
                          DropdownMenuItem(
                              child: Text("Administrator"),
                              value: 'Administrator'),
                          DropdownMenuItem(child: Text("User"), value: 'User'),
                        ]);
                  },
                ),
                SizedBox(height: 44),
                BlocBuilder<InviteNewUserCubit, InviteNewUserState>(
                  builder: (context, state) {
                    return SubmitButton(
                        name: "Save",
                        function: () {
                          if (context
                              .read<InviteNewUserCubit>()
                              .formKey
                              .currentState!
                              .validate()) {
                            if (state is InviteNewUserLoadedState) {
                              context.read<InviteNewUserCubit>().inviteNewUser(
                                  params: CreateNewUserUseCaseParams(
                                      firstname: state.firstName!,
                                      lastName: state.lastName!,
                                      email: state.email!,
                                      phoneNumber: state.phoneNumber!,
                                      role: "User"));
                            }
                          }
                        });
                  },
                ),
                SizedBox(height: 20),
                NavigateButton(
                    width: double.infinity,
                    name: 'Back',
                    function: () {
                      context
                          .read<InviteNewUserCubit>()
                          .backToPrevious(context);
                    }),
              ],
            ),
          ),
        );
      },
      listener: (BuildContext context, InviteNewUserState state) {
        if (state is InviteNewUserSuccessState) {
          showToast("Success", Colors.green);
          Navigator.pop(context);
        } else if (state is InviteNewUserFailureState) {
          showToast(state.message, Colors.red);
        }
      },
    ),
  );
}
