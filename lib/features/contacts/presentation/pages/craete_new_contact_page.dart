import 'package:contacts_app/core/hepres/toast.dart';
import 'package:contacts_app/core/widgets/page_title.dart';
import 'package:contacts_app/features/auth/presentation/widgets/auth_navigate_button.dart';
import 'package:contacts_app/features/contacts/data/datasources/contact_local_data_source.dart';
import 'package:contacts_app/features/contacts/data/datasources/contact_remote_data_source.dart';
import 'package:contacts_app/features/contacts/data/repositories/contact_repository_imp.dart';
import 'package:contacts_app/features/contacts/domain/repositories/contatc_repository.dart';
import 'package:contacts_app/features/contacts/domain/usecases/create_new_conatct.dart';
import 'package:contacts_app/features/contacts/presentation/cubits/contactscubit/contacts_cubit.dart';
import 'package:contacts_app/features/contacts/presentation/cubits/createnewcontactcubit/create_new_contact_cubit.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/constant/app_routes.dart';
import '../../../../core/constant/app_strings.dart';
import '../../../../core/widgets/appbar.dart';
import '../../../../core/widgets/drawer.dart';
import '../../../auth/presentation/widgets/auth_submit_button.dart';
import '../../../auth/presentation/widgets/auth_textfield.dart';
import '../../../auth/presentation/widgets/auth_title.dart';
import '../../../auth/presentation/widgets/spacer_height.dart';

class CreateNewContactPage extends StatelessWidget {
  const CreateNewContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateNewContactCubit(
          createNewContatcUseCase: CreateNewContatcUseCase(
              contactRepository: ContactRepositoryImpl(
                  contactLoaclDataSource: ContactLoaclDataSource(),
                  contactRemoteDataSource:
                      ContactRemoteDataSourceImpl(dio: Dio())))),
      child: Scaffold(
        drawer: const DrawerWidget(),
        appBar: const AppBarWidget(),
        backgroundColor: Color(0xFFF7F7F7),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                PageTitle(
                  title: "Home / Contacts /Create New",
                ),
                formsection(context),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//form
Widget formsection(BuildContext context) {
  return Form(
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
          SectionTitle(title: "Contact Details"),
          SizedBox(height: 4),
          textFieldsSection(),
          const Height_32(),
          submitFromSection(context)
        ],
      ),
    ),
  );
}

//sumbmitsection
Widget submitFromSection(BuildContext context) {
  return Column(
    children: [
      BlocBuilder<CreateNewContactCubit, CreateNewContactState>(
        builder: (context, state) {
          if (state is CreateNewContactInitialState) {
            return SubmitButton(
                name: AppStrings.create,
                function: () {
                  if (context
                      .read<CreateNewContactCubit>()
                      .formkey
                      .currentState!
                      .validate()) {
                    context.read<CreateNewContactCubit>().createContact(
                        params: CreateNewContactUseCaseParams(
                            firstName: state.firstName!,
                            lastName: state.lastName!,
                            email: state.email!,
                            phoneNumber: state.phoneNumber!,
                            address: state.address!,
                            addressTwo: state.addressTwo ?? "",
                            emailTwo: state.emailTwo ?? "",
                            phoneNumberTwo: state.mobileNumber ?? "",
                            image: state.image));
                  }
                });
          } else {
            return Container();
          }
        },
      ),
      SizedBox(height: 20),
      NavigateButton(
        name: "Back",
        function: () {
          Navigator.of(context).pop();
        },
        width: double.infinity,
      )
    ],
  );
}

Widget uploadImageSection(BuildContext context) {
  return Column(children: [
    Center(
        child: CircleAvatar(
      child: Image.asset('assets/images/contactavatar.png'),
      radius: 58,
    )),
    SizedBox(height: 11),
    Center(
      child: Text(
        "JPG or PNG no larg than 5MB",
        style: TextStyle(color: Color.fromRGBO(134, 134, 134, 1), fontSize: 18),
      ),
    ),
    SizedBox(height: 11),
    SubmitButton(
        name: AppStrings.upload,
        function: () async {
          final image =
              await ImagePicker().pickImage(source: ImageSource.gallery);
          if (image != null) {
            BlocProvider.of<CreateNewContactCubit>(context)
                .imageSelected(image);
          }
        }),
  ]);
}

Widget textFieldsSection() {
  return BlocConsumer<CreateNewContactCubit, CreateNewContactState>(
    listener: (context, state) {
      if (state is CreateNewContactSuccesState) {
        showToast(state.message, Colors.green);
        Navigator.of(context).pushReplacementNamed(RoutesNames.contactsHome);
      } else if (state is CreateNewContactFailureState) {
        showToast(state.message, Colors.red);
        print(state.message);
      }
    },
    builder: (context, state) {
      return Form(
        key: context.read<CreateNewContactCubit>().formkey,
        child: Column(
          children: [
            uploadImageSection(context),
            SizedBox(height: 19),
            Row(
              children: [
                Expanded(
                  child: AuthTextField(
                      func: () {
                        context
                            .read<CreateNewContactCubit>()
                            .firstNameVauleChanged();
                      },
                      validate: (value) {
                        if (value.isEmpty) {
                          return ValidatroErrors.requirdFieldsValidagtorError;
                        } else {
                          return null;
                        }
                      },
                      controller: context
                          .read<CreateNewContactCubit>()
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
                            return ValidatroErrors.requirdFieldsValidagtorError;
                          } else {
                            return null;
                          }
                        },
                        func: () {
                          context
                              .read<CreateNewContactCubit>()
                              .lastNameVauleChanged();
                        },
                        controller: context
                            .read<CreateNewContactCubit>()
                            .lastNameController,
                        height: 52,
                        hitn: AppStrings.lastName,
                        isObscureText: false))
              ],
            ),
            const Height_32(),
            AuthTextField(
              controller: context.read<CreateNewContactCubit>().emailController,
              validate: (value) {
                if (value.isEmpty) {
                  return ValidatroErrors.emailValidagtorError;
                } else {
                  return null;
                }
              },
              func: () {
                context.read<CreateNewContactCubit>().emailVauleChanged();
              },
              hitn: AppStrings.email,
              isObscureText: false,
            ),
            const Height_32(),
            AuthTextField(
                validate: (value) {
                  if (value.isEmpty) {
                    return ValidatroErrors.requirdFieldsValidagtorError;
                  } else {
                    return null;
                  }
                },
                func: () {
                  context.read<CreateNewContactCubit>().phoneVauleChanged();
                },
                controller:
                    context.read<CreateNewContactCubit>().phoneNumberController,
                height: 52,
                hitn: AppStrings.phoneNumber),
            const Height_32(),
            AuthTextField(
                func: () {
                  context.read<CreateNewContactCubit>().emailTwoVauleChanged();
                },
                validate: (value) {
                  return null;
                },
                controller:
                    context.read<CreateNewContactCubit>().emailTwoController,
                height: 52,
                hitn: AppStrings.email + "Two"),
            const Height_32(),
            AuthTextField(
                func: () {
                  context
                      .read<CreateNewContactCubit>()
                      .mobileNumberVauleChanged();
                },
                validate: (value) {
                  return null;
                },
                controller: context
                    .read<CreateNewContactCubit>()
                    .phoneNumberTwoController,
                height: 52,
                hitn: AppStrings.mobile),
            const Height_32(),
            AuthTextField(
                func: () {
                  context.read<CreateNewContactCubit>().addressVauleChanged();
                },
                validate: (value) {
                  if (value.isEmpty) {
                    return ValidatroErrors.requirdFieldsValidagtorError;
                  } else {
                    return null;
                  }
                },
                controller:
                    context.read<CreateNewContactCubit>().addressController,
                height: 102,
                hitn: AppStrings.address1),
            const Height_32(),
            AuthTextField(
                func: () {
                  context
                      .read<CreateNewContactCubit>()
                      .addressTwoVauleChanged();
                },
                validate: (value) {
                  return null;
                },
                controller:
                    context.read<CreateNewContactCubit>().addressTwoController,
                height: 102,
                hitn: AppStrings.address2),
          ],
        ),
      );
    },
  );
}
