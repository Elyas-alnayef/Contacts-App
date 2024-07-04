import 'package:flutter/material.dart';
import '../../../../core/constant/app_strings.dart';
import '../../../../core/widgets/appbar.dart';
import '../../../../core/widgets/drawer.dart';
import '../../../../core/widgets/page_title.dart';
import '../../../auth/presentation/widgets/auth_textfield.dart';
import '../../../auth/presentation/widgets/spacer_height.dart';
import '../widgets/button_widget.dart';

class SendEmailPage extends StatelessWidget {
  const SendEmailPage({super.key});

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
                title: "Home / Users / Send Email",
              ),
              fromSction(context),
              buttonsSection(),
            ],
          ),
        ),
      ),
    );
  }
}

//form
Widget fromSction(BuildContext context) {
  return Form(
    child: Container(
      width: double.infinity,
      padding: EdgeInsets.only(top: 24, bottom: 40, left: 16, right: 16),
      margin: EdgeInsets.only(bottom: 24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AuthTextField(
            controller: TextEditingController(),
            validate: (value) {
              if (value.isEmpty) {
                return ValidatroErrors.requirdFieldsValidagtorError;
              } else {
                return null;
              }
            },
            func: () {},
            hitn: AppStrings.to,
            isObscureText: false,
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
              controller: TextEditingController(),
              height: 52,
              hitn: AppStrings.subject,
              isObscureText: false),
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
              controller: TextEditingController(),
              height: 52,
              hitn: AppStrings.cc,
              isObscureText: false),
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
              controller: TextEditingController(),
              height: 52,
              hitn: AppStrings.bcc,
              isObscureText: false),
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
              controller: TextEditingController(),
              height: 110,
              hitn: AppStrings.message,
              isObscureText: false),
        ],
      ),
    ),
  );
}

Widget buttonsSection() {
  return Row(
    children: [
      Expanded(
        child: UsersFeatureButton(
          func: () {},
          buttonColor: Color.fromRGBO(252, 118, 106, 1),
          buttonName: AppStrings.discard,
        ),
      ),
      SizedBox(
        width: 16,
      ),
      Expanded(
        child: UsersFeatureButton(
          func: () {},
          buttonColor: Color.fromRGBO(78, 115, 223, 1),
          buttonName: AppStrings.send,
        ),
      ),
    ],
  );
}
