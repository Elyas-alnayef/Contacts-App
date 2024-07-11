import 'package:contacts_app/core/hepres/toast.dart';
import 'package:contacts_app/features/auth/presentation/widgets/auth_submit_button.dart';
import 'package:contacts_app/features/user/data/datasources/local_data_source.dart';
import 'package:contacts_app/features/user/data/datasources/remote_data_source.dart';
import 'package:contacts_app/features/user/data/repositories/user_repository_imp.dart';
import 'package:contacts_app/features/user/domain/repositoies/user_repository.dart';
import 'package:contacts_app/features/user/domain/usecases/get_current_user.dart';
import 'package:contacts_app/features/user/domain/usecases/get_user_information.dart';
import 'package:contacts_app/features/user/domain/usecases/update_user_infomation.dart';
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

class UserInformationPage extends StatelessWidget {
  final String userId;
  const UserInformationPage({super.key, required this.userId});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserInfromationCubit(
          updateUserInformationUserCase: UpdateUserInformationUserCase(
              userRepository: UserRepositoryImpl(
                  userLocalDataSource: UserLocalDataSourceImpl(),
                  userRemoteDtatSource: UserRemoteDtatSourceImpl(dio: Dio()))),
          getUserInformationByIdUseCase: GetUserInformationByIdUseCase(
              userRepository: UserRepositoryImpl(
                  userLocalDataSource: UserLocalDataSourceImpl(),
                  userRemoteDtatSource: UserRemoteDtatSourceImpl(dio: Dio()))))
        ..fetchUserById(userId: userId),
      child: Scaffold(
        drawer: const DrawerWidget(),
        appBar: const AppBarWidget(),
        backgroundColor: Color(0xFFF7F7F7),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BlocBuilder<UserInfromationCubit, UserInfromationState>(
                  builder: (context, state) {
                    String name = "";
                    if (state is UserInfromationLoadedState) {
                      name = state.user!.firstName + " " + state.user!.lastName;
                    } else {}
                    return PageTitle(
                      title: "Home / Users /$name",
                    );
                  },
                ),
                fromSction(context, userId),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//form
Widget fromSction(BuildContext context, String userId) {
  return BlocConsumer<UserInfromationCubit, UserInfromationState>(
    builder: (context, state) {
      if (state is UserInfromationInitialState) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is UserInfromationLoadedState) {
        return Form(
          key: context.read<UserInfromationCubit>().formKey,
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
                            lable: "Unlocked",
                            value: state is UserInfromationLoadedState
                                ? state.isUnlooked ?? false
                                : false,
                            func: () {
                              context
                                  .read<UserInfromationCubit>()
                                  .togglerChanged(
                                      state is UserInfromationLoadedState
                                          ? state.isUnlooked ?? false
                                          : true);
                            })),
                  ],
                ),
                AuthTextField(
                  isEnabled: state.isReadOnly! ? false : true,
                  controller: BlocProvider.of<UserInfromationCubit>(context)
                      .emailController,
                  validate: (value) {
                    if (value.isEmpty) {
                      return ValidatroErrors.requirdFieldsValidagtorError;
                    } else {
                      return null;
                    }
                  },
                  func: () {
                    context.read<UserInfromationCubit>().emailChanged();
                  },
                  hitn: AppStrings.email,
                  isObscureText: false,
                ),
                const Height_32(),
                Row(
                  children: [
                    Expanded(
                      child: AuthTextField(
                          isEnabled: state.isReadOnly! ? false : true,
                          func: () {
                            context
                                .read<UserInfromationCubit>()
                                .firstNameChanged();
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
                            isEnabled: state.isReadOnly! ? false : true,
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
                                  .read<UserInfromationCubit>()
                                  .lastNameChanged();
                            },
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
                    isEnabled: state.isReadOnly! ? false : true,
                    func: () {
                      context.read<UserInfromationCubit>().phoneNumberChanged();
                    },
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
                        value: state is UserInfromationLoadedState
                            ? state.userType
                            : null,
                        hint: "Select User Type",
                        function: (value) {
                          context
                              .read<UserInfromationCubit>()
                              .userTypeChanged(value!);
                        },
                        items: [
                          DropdownMenuItem(child: Text("User"), value: 'User'),
                          DropdownMenuItem(
                              child: Text("Owner"),
                              value: 'Owner',
                              enabled: false),
                          DropdownMenuItem(
                              child: Text("Admin"), value: 'Admin'),
                        ]);
                  },
                ),
                SizedBox(height: 44),
                BlocBuilder<UserInfromationCubit, UserInfromationState>(
                  builder: (context, state) {
                    if (state is UserInfromationLoadedState) {
                      if (state.isReadOnly!) {
                        return EditButton(
                            width: double.infinity,
                            function: () {
                              context
                                  .read<UserInfromationCubit>()
                                  .enableEditing();
                            });
                      } else {
                        return SubmitButton(
                            name: "Save",
                            function: () {
                              if (BlocProvider.of<UserInfromationCubit>(context)
                                  .formKey
                                  .currentState!
                                  .validate()) {
                                context
                                    .read<UserInfromationCubit>()
                                    .updateUserInfomation(
                                        UpdateUserInformationUseCaseParams(
                                            userId: userId,
                                            firstname: state.firstName!,
                                            lastName: state.lastName!,
                                            email: state.email!,
                                            phoneNumber: state.phoneNumber!,
                                            role: state.userType!,
                                            status: "Locked"));
                              }
                            });
                      }
                    } else {
                      return SizedBox();
                    }
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
      } else {
        return SizedBox();
      }
    },
    listener: (BuildContext context, UserInfromationState state) {
      if (state is UserInfromationFailureState) {
        showToast(state.message, Colors.red);
        context.read<UserInfromationCubit>().backToPrevious(context);
      } else if (state is UserInfromationSuccessSatet) {
        showToast(state.message, Colors.green);
        context.read<UserInfromationCubit>().backToPrevious(context);
      }
    },
  );
}
