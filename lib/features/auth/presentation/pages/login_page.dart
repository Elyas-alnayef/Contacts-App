import 'package:contacts_app/features/auth/presentation/widgets/toast.dart';
import 'package:flutter/material.dart';
import '../cubits/login/login_cubit.dart';
import '../widgets/auth_navigate_button.dart';
import '../widgets/auth_submit_button.dart';
import '../widgets/auth_textfield.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/spacer_height.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  bool visible = false;
  TextEditingController emialController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  void dispose() {
    emialController.dispose();
    passwordController.dispose();
    super.dispose();
  }

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
              Container(
                width: 145.29,
                height: 151,
                child: Image.asset('assets/images/c.png'),
              ),
              const SizedBox(
                height: 57,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                padding: const EdgeInsets.symmetric(vertical: 14),
                child: Column(
                  children: [
                    AuthTextField(
                      controller: emialController,
                      hitn: 'Email',
                      isObscureText: false,
                    ),
                    height_32(),
                    AuthTextField(
                        controller: passwordController,
                        hitn: 'Password',
                        isObscureText: !visible,
                        suffixIcon: visible
                            ? InkWell(
                                onTap: () {
                                  setState(() {
                                    visible = !visible;
                                  });
                                },
                                child: Icon(Icons.visibility))
                            : InkWell(
                                onTap: () {
                                  setState(() {
                                    visible = !visible;
                                  });
                                },
                                child: Icon(Icons.visibility_off))),
                    height_8(),
                    Container(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed("/emailVerification");
                        },
                        child: const Text("forget your password ?",
                            textAlign: TextAlign.right,
                            style: TextStyle(fontSize: 10, color: Colors.blue)),
                      ),
                    ),
                    height_32(),
                    BlocConsumer<LoginCubit, LoginState>(
                      listener: (context, state) {
                        if (state is LoginFaild) {
                          return buildToast(state.message, Colors.red[200]!);
                        } else if (state is LoginSuccess) {
                          return buildToast("welcome !", Colors.green[400]!);
                        }
                      },
                      builder: (context, state) {
                        if (state is LoginLoading) {
                          return CircularProgressIndicator();
                        } else {
                          return SubmitButton(
                              function: () {
                                context.read<LoginCubit>().LogIn(
                                    emialController.text,
                                    passwordController.text);
                              },
                              name: "Sign in");
                        }
                      },
                    ),
                    height_32(),
                    const Row(
                      children: [
                        Expanded(
                            child:
                                Divider(color: Colors.black, thickness: 1.0)),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text("Don't have an account ?",
                              style: TextStyle(fontWeight: FontWeight.w600)),
                        ),
                        Expanded(
                            child:
                                Divider(color: Colors.black, thickness: 1.0)),
                      ],
                    ),
                    height_32(),
                    NavigateButton(
                        function: () {
                          Navigator.of(context).pushNamed('/signup');
                        },
                        name: "Sign up"),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
