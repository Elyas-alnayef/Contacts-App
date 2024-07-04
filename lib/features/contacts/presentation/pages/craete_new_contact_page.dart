import 'package:contacts_app/core/widgets/page_title.dart';
import 'package:contacts_app/features/auth/presentation/widgets/auth_navigate_button.dart';
import 'package:flutter/material.dart';
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
    return Scaffold(
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
          uploadImageSection(),
          SizedBox(height: 19),
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
      SubmitButton(name: AppStrings.create, function: () {}),
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

Widget uploadImageSection() {
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
    SubmitButton(name: AppStrings.upload, function: () {}),
  ]);
}

Widget textFieldsSection() {
  return Column(
    children: [
      Row(
        children: [
          Expanded(
            child: AuthTextField(
                func: () {},
                validate: (value) {
                  if (value.isEmpty) {
                    return ValidatroErrors.requirdFieldsValidagtorError;
                  } else {
                    return null;
                  }
                },
                controller: TextEditingController(),
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
                  func: () {},
                  controller: TextEditingController(),
                  height: 52,
                  hitn: AppStrings.lastName,
                  isObscureText: false))
        ],
      ),
      const Height_32(),
      AuthTextField(
        controller: TextEditingController(),
        validate: (value) {
          if (value.isEmpty) {
            return ValidatroErrors.emailValidagtorError;
          } else {
            return null;
          }
        },
        func: () {},
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
          func: () {},
          controller: TextEditingController(),
          height: 52,
          hitn: AppStrings.phoneNumber),
      const Height_32(),
      AuthTextField(
          func: () {},
          validate: (value) {
            if (value.isEmpty) {
              return ValidatroErrors.requirdFieldsValidagtorError;
            } else {
              return null;
            }
          },
          controller: TextEditingController(),
          height: 52,
          hitn: AppStrings.email),
      const Height_32(),
      AuthTextField(
          func: () {},
          validate: (value) {
            if (value.isEmpty) {
              return ValidatroErrors.requirdFieldsValidagtorError;
            } else {
              return null;
            }
          },
          controller: TextEditingController(),
          height: 52,
          hitn: AppStrings.mobile),
      const Height_32(),
      AuthTextField(
          func: () {},
          validate: (value) {
            return null;
          },
          controller: TextEditingController(),
          height: 102,
          hitn: AppStrings.address1),
      const Height_32(),
      AuthTextField(
          func: () {},
          validate: (value) {
            if (value.isEmpty) {
              return ValidatroErrors.requirdFieldsValidagtorError;
            } else {
              return null;
            }
          },
          controller: TextEditingController(),
          height: 102,
          hitn: AppStrings.address2),
    ],
  );
}
