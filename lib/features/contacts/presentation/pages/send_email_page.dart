import 'package:contacts_app/core/hepres/toast.dart';
import 'package:contacts_app/features/contacts/data/datasources/contact_local_data_source.dart';
import 'package:contacts_app/features/contacts/data/datasources/contact_remote_data_source.dart';
import 'package:contacts_app/features/contacts/data/repositories/contact_repository_imp.dart';
import 'package:contacts_app/features/contacts/domain/repositories/contatc_repository.dart';
import 'package:contacts_app/features/contacts/domain/usecases/send_email.dart';
import 'package:contacts_app/features/contacts/presentation/cubits/endemailcubit/send_email_cubit.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constant/app_strings.dart';
import '../../../../core/widgets/appbar.dart';
import '../../../../core/widgets/drawer.dart';
import '../../../../core/widgets/page_title.dart';
import '../../../auth/presentation/widgets/auth_textfield.dart';
import '../../../auth/presentation/widgets/spacer_height.dart';
import '../../../user/presentation/widgets/button_widget.dart';

class SendEmailPage extends StatelessWidget {
  const SendEmailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SendEmailCubit(
          sendContactEmailUseCase: SendContactEmailUseCase(
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PageTitle(
                  title: "Home / Contacts / Send Email",
                ),
                fromSction(context),
                buttonsSection(context),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//form
Widget fromSction(BuildContext context) {
  return BlocConsumer<SendEmailCubit, SendEmailState>(
    listener: (context, state) {
      if (state is SendEmailFailureState) {
        showToast(state.message, Colors.red);
      } else if (state is SendEmailSuccesState) {
        showToast(state.message, Colors.green);
        Navigator.pop(context);
      }
    },
    builder: (context, state) {
      return Form(
        key: context.read<SendEmailCubit>().formkey,
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
                controller: context.read<SendEmailCubit>().toController,
                validate: (value) {
                  if (value.isEmpty) {
                    return ValidatroErrors.requirdFieldsValidagtorError;
                  } else {
                    return null;
                  }
                },
                func: () {
                  context.read<SendEmailCubit>().toVauleChanged();
                },
                hitn: AppStrings.to,
                isObscureText: false,
              ),
              const Height_32(),
              AuthTextField(
                  isEnabled: true,
                  func: () {
                    context.read<SendEmailCubit>().subjectVauleChanged();
                  },
                  validate: (value) {
                    if (value.isEmpty) {
                      return ValidatroErrors.requirdFieldsValidagtorError;
                    } else {
                      return null;
                    }
                  },
                  controller: context.read<SendEmailCubit>().subjectController,
                  height: 52,
                  hitn: AppStrings.subject,
                  isObscureText: false),
              const Height_32(),
              AuthTextField(
                  isEnabled: true,
                  func: () {
                    context.read<SendEmailCubit>().ccVauleChanged();
                  },
                  validate: (value) {
                    return null;
                  },
                  controller: context.read<SendEmailCubit>().ccController,
                  height: 52,
                  hitn: AppStrings.cc,
                  isObscureText: false),
              const Height_32(),
              AuthTextField(
                  isEnabled: true,
                  func: () {
                    context.read<SendEmailCubit>().bccVauleChanged();
                  },
                  validate: (value) {
                    return null;
                  },
                  controller: context.read<SendEmailCubit>().bccController,
                  height: 52,
                  hitn: AppStrings.bcc,
                  isObscureText: false),
              const Height_32(),
              AuthTextField(
                  isEnabled: true,
                  func: () {
                    context.read<SendEmailCubit>().bodyVauleChanged();
                  },
                  validate: (value) {
                    if (value.isEmpty) {
                      return ValidatroErrors.requirdFieldsValidagtorError;
                    } else {
                      return null;
                    }
                  },
                  controller: context.read<SendEmailCubit>().bodyController,
                  height: 110,
                  hitn: AppStrings.message,
                  isObscureText: false),
            ],
          ),
        ),
      );
    },
  );
}

Widget buttonsSection(BuildContext context) {
  return Row(
    children: [
      Expanded(
        child: UsersFeatureButton(
          func: () {
            Navigator.pop(context);
          },
          buttonColor: Color.fromRGBO(252, 118, 106, 1),
          buttonName: AppStrings.discard,
        ),
      ),
      SizedBox(
        width: 16,
      ),
      Expanded(
        child: BlocBuilder<SendEmailCubit, SendEmailState>(
          builder: (context, state) {
            return UsersFeatureButton(
              func: () {
                if (state is SendEmailInitialState) {
                  if (context
                      .read<SendEmailCubit>()
                      .formkey
                      .currentState!
                      .validate()) {
                    context.read<SendEmailCubit>().sendEmail(
                        params: SendContactEmailUseCaseParams(
                            to: state.to!,
                            cc: state.cc!,
                            bcc: state.bcc!,
                            subject: state.subject!,
                            body: state.body!));
                  }
                }
              },
              buttonColor: Color.fromRGBO(78, 115, 223, 1),
              buttonName: AppStrings.send,
            );
          },
        ),
      ),
    ],
  );
}
