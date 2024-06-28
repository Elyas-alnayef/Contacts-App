import 'package:contacts_app/core/hepres/toast.dart';
import 'package:flutter/material.dart';
import '../../../../core/constant/app_strings.dart';
import '../cubits/login/login_cubit.dart';
import '../widgets/auth_navigate_button.dart';
import '../widgets/auth_submit_button.dart';
import '../widgets/auth_textfield.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/spacer_height.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 64,
              ),
              logoSection(),
              const SizedBox(
                height: 57,
              ),
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  child: formSection(context))
            ],
          ),
        ),
      ),
    );
  }
}

//log in logo
Widget logoSection() {
  return Container(
    width: 145.29,
    height: 151,
    child: Image.asset('assets/images/c.png'),
  );
}

//form section
Widget formSection(BuildContext context) {
  return Form(
    key: BlocProvider.of<LoginCubit>(context).formKey,
    child: Column(
      children: [
        AuthTextField(
          controller: BlocProvider.of<LoginCubit>(context).emailController,
          validate: (value) {
            if (value.isEmpty) {
              return ValidatroErrors.requirdFieldsValidagtorError;
            } else {
              return null;
            }
          },
          func: () {
            context.read<LoginCubit>().emailTextFieldChanged();
          },
          hitn: AppStrings.email,
          isObscureText: false,
        ),
        const Height_32(),
        BlocBuilder<LoginCubit, LoginState>(
          builder: (context, state) {
            return AuthTextField(
              validate: (value) {
                if (value.isEmpty || value.length < 8) {
                  return ValidatroErrors.passwordValidagtorError;
                } else {
                  return null;
                }
              },
              controller: context.read<LoginCubit>().passwordController,
              func: () {
                context.read<LoginCubit>().passwordTextFieldChanged();
              },
              hitn: AppStrings.password,
              isObscureText:
                  !BlocProvider.of<LoginCubit>(context).isPasswordshown,
              suffixIcon: InkWell(
                  onTap: () {
                    context.read<LoginCubit>().chagePasswordVisibility();
                  },
                  child: Icon(
                      BlocProvider.of<LoginCubit>(context).suffixPasswordIcon)),
            );
          },
        ),
        const Height_8(),
        Container(
          alignment: Alignment.centerRight,
          child: InkWell(
            onTap: () {
              BlocProvider.of<LoginCubit>(context)
                  .navigateToResetPasswordPage(context);
            },
            child: const Text(AppStrings.forgetpassword,
                textAlign: TextAlign.right,
                style: TextStyle(fontSize: 10, color: Colors.blue)),
          ),
        ),
        const Height_32(),
        BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginFaildState) {
              return showToast(state.message, Colors.red[200]!);
            } else if (state is LoginSuccessState) {
              context.read<LoginCubit>().navigateToHomePage(context);
              return showToast(HelpersMessages.welcome, Colors.green[400]!);
            }
          },
          builder: (context, state) {
            if (state is LoginLoadingState) {
              return const CircularProgressIndicator();
            } else {
              return SubmitButton(
                  function: () {
                    if (context
                        .read<LoginCubit>()
                        .formKey
                        .currentState!
                        .validate()) {
                      if (state is TextFieldChangedCompleteState) {
                        context
                            .read<LoginCubit>()
                            .LogIn(state.email!, state.password!);
                      }
                    }
                  },
                  name: AppStrings.signIn);
            }
          },
        ),
        const Height_32(),
        const Row(
          children: [
            Expanded(child: Divider(color: Colors.black, thickness: 1.0)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(AppStrings.donthaveaccount,
                  style: TextStyle(fontWeight: FontWeight.w600)),
            ),
            Expanded(child: Divider(color: Colors.black, thickness: 1.0)),
          ],
        ),
        const Height_32(),
        NavigateButton(
            function: () {
              context.read<LoginCubit>().navigateToSignUpPage(context);
            },
            name: AppStrings.signUp),
      ],
    ),
  );
}
