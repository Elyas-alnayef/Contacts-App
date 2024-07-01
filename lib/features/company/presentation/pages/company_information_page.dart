import 'package:contacts_app/features/auth/presentation/widgets/auth_submit_button.dart';
import 'package:contacts_app/features/company/domain/repositories/company_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constant/app_strings.dart';
import '../../../../core/widgets/appbar.dart';
import '../../../../core/widgets/drawer.dart';
import '../../../../core/widgets/editbutton.dart';
import '../../../auth/presentation/widgets/auth_countries_dropDownList.dart';
import '../../../auth/presentation/widgets/auth_navigate_button.dart';
import '../../../auth/presentation/widgets/auth_textfield.dart';
import '../../../auth/presentation/widgets/auth_title.dart';
import '../../../auth/presentation/widgets/spacer_height.dart';
import '../cubits/cubit/company_cubit.dart';

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
  return BlocConsumer<CompanyCubit, CompanyState>(
    builder: (context, state) {
      if (state is CompanyLoadingState) {
        return Center(child: CircularProgressIndicator());
      } else {
        return Form(
          key: context.read<CompanyCubit>().formKey,
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
                  isEnabled: context.read<CompanyCubit>().isEditingMode,
                  controller: BlocProvider.of<CompanyCubit>(context)
                      .companyNameController,
                  validate: (value) {
                    if (value.isEmpty) {
                      return ValidatroErrors.requirdFieldsValidagtorError;
                    } else {
                      return null;
                    }
                  },
                  func: () {
                    context.read<CompanyCubit>().companyNameTextFieldChanged();
                  },
                  hitn: AppStrings.companyName,
                  isObscureText: false,
                ),
                const Height_32(),
                Row(
                  children: [
                    Expanded(
                      child: AuthTextField(
                          isEnabled: context.read<CompanyCubit>().isEditingMode,
                          func: () {
                            context
                                .read<CompanyCubit>()
                                .street1TextFieldChanged();
                          },
                          validate: (value) {
                            if (value.isEmpty) {
                              return ValidatroErrors
                                  .requirdFieldsValidagtorError;
                            } else {
                              return null;
                            }
                          },
                          controller: BlocProvider.of<CompanyCubit>(context)
                              .streetController,
                          height: 52,
                          hitn: AppStrings.street1,
                          isObscureText: false),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                        child: AuthTextField(
                            isEnabled:
                                context.read<CompanyCubit>().isEditingMode,
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
                                  .read<CompanyCubit>()
                                  .street2TextFieldChanged();
                            },
                            controller: BlocProvider.of<CompanyCubit>(context)
                                .street2Controller,
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
                          isEnabled: context.read<CompanyCubit>().isEditingMode,
                          func: () {
                            context.read<CompanyCubit>().vatTextFieldChanged();
                          },
                          validate: (value) {
                            if (value.isEmpty) {
                              return ValidatroErrors
                                  .requirdFieldsValidagtorError;
                            } else {
                              return null;
                            }
                          },
                          controller: BlocProvider.of<CompanyCubit>(context)
                              .vatController,
                          height: 52,
                          hitn: AppStrings.vatNumber,
                          isObscureText: false),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                        child: AuthTextField(
                            isEnabled:
                                context.read<CompanyCubit>().isEditingMode,
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
                                  .read<CompanyCubit>()
                                  .zipTextFieldChanged();
                            },
                            controller: BlocProvider.of<CompanyCubit>(context)
                                .zipController,
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
                          isEnabled: context.read<CompanyCubit>().isEditingMode,
                          func: () {
                            context.read<CompanyCubit>().cityTextFieldChanged();
                          },
                          validate: (value) {
                            if (value.isEmpty) {
                              return ValidatroErrors
                                  .requirdFieldsValidagtorError;
                            } else {
                              return null;
                            }
                          },
                          controller: BlocProvider.of<CompanyCubit>(context)
                              .cityController,
                          height: 52,
                          hitn: AppStrings.city,
                          isObscureText: false),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                        child: AuthTextField(
                            isEnabled:
                                context.read<CompanyCubit>().isEditingMode,
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
                                  .read<CompanyCubit>()
                                  .stateTextFieldChanged();
                            },
                            controller: BlocProvider.of<CompanyCubit>(context)
                                .stateController,
                            height: 52,
                            hitn: AppStrings.state,
                            isObscureText: false))
                  ],
                ),
                const Height_32(),
                BlocBuilder<CompanyCubit, CompanyState>(
                  builder: (context, state) {
                    return DropDownCountriesList(
                        hint: "Select Your Country",
                        function: (value) {
                          BlocProvider.of<CompanyCubit>(context)
                              .countryNameSelected(value.toString());
                        },
                        value: state is TextFieldChangedCompleteState
                            ? state.countryName
                            : state is CompanyLoadedState
                                ? state.company['country']
                                : BlocProvider.of<CompanyCubit>(context)
                                    .countryName,
                        items: [
                          DropdownMenuItem(
                              child: Text("Syria"), value: 'Syria'),
                          DropdownMenuItem(child: Text("UAE"), value: 'UAE'),
                          DropdownMenuItem(child: Text("USA"), value: 'USA'),
                          DropdownMenuItem(
                              child: Text("Sodan"), value: 'sodan'),
                        ]);
                  },
                ),
                SizedBox(height: 44),
                BlocBuilder<CompanyCubit, CompanyState>(
                  builder: (context, state) {
                    if (BlocProvider.of<CompanyCubit>(context).isEditingMode) {
                      if (state is CompanyLoadingState) {
                        return const CircularProgressIndicator();
                      } else {
                        return SubmitButton(
                            name: "Save",
                            function: () {
                              if (context.read<CompanyCubit>().formKey.currentState!.validate()) {
                                if (state is TextFieldChangedCompleteState) {
                                  context.read<CompanyCubit>().onSaveChages(
                                      EditCompanyUseCaseParameters(
                                          companyName: state.companyName!,
                                          vatNumber: state.vat!,
                                          streetOne: state.street1!,
                                          streetTwo: state.street2!,
                                          city: state.city!,
                                          state: state.state!,
                                          zip: state.zip!,
                                          country: state.countryName!));
                                }
                              }
                            });
                      }
                    } else {
                      return EditButton(
                          width: double.infinity,
                          function: () {
                            context.read<CompanyCubit>().onEditMode();
                          });
                    }
                  },
                ),
                SizedBox(height: 20),
                NavigateButton(
                    width: double.infinity,
                    name: 'Back',
                    function: () {
                      context.read<CompanyCubit>().backToPrevious(context);
                    }),
              ],
            ),
          ),
        );
      }
    },
    listener: (BuildContext context, CompanyState state) {
      if (state is CompanyLoadedState) {
        BlocProvider.of<CompanyCubit>(context).companyNameController.text =
            state.company['companyName'];
        BlocProvider.of<CompanyCubit>(context).streetController.text =
            state.company['streetOne'];
        BlocProvider.of<CompanyCubit>(context).street2Controller.text =
            state.company['streetTwo'];
        BlocProvider.of<CompanyCubit>(context).vatController.text =
            state.company['vatNumber'];
        BlocProvider.of<CompanyCubit>(context).zipController.text =
            state.company['zip'];
        BlocProvider.of<CompanyCubit>(context).cityController.text =
            state.company['city'];
        BlocProvider.of<CompanyCubit>(context).stateController.text =
            state.company['state'];
        BlocProvider.of<CompanyCubit>(context).countryName =
            state.company['country'];
        print(BlocProvider.of<CompanyCubit>(context).countryName);
      } else {}
    },
  );
}
