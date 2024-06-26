import 'package:flutter/material.dart';
import '../widgets/auth_navigate_button.dart';
import '../widgets/auth_submit_button.dart';
import '../widgets/auth_textfield.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        // body: SingleChildScrollView(
        //   child: Column(
        //     crossAxisAlignment: CrossAxisAlignment.center,
        //     children: [
        //       SizedBox(
        //         height: 64,
        //       ),
        //       Container(
        //         width: 145.29,
        //         height: 151,
        //         child: Image.asset('assets/images/c.png'),
        //       ),
        //       SizedBox(
        //         height: 57,
        //       ),
        //       Container(
        //         margin: EdgeInsets.symmetric(horizontal: 16),
        //         padding: EdgeInsets.symmetric(vertical: 14),
        //         child: Column(
        //           crossAxisAlignment: CrossAxisAlignment.start,
        //           children: [
        //             Text(
        //               "Set a Password",
        //               style:
        //                   TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
        //             ),
        //             SizedBox(
        //               height: 32,
        //             ),
        //             AuthTextField(
        //                 controller: TextEditingController(),
        //                 hitn: 'Password',
        //                 isObscureText: true,
        //                 suffixIcon: Icon(Icons.remove_red_eye)),
        //             SizedBox(
        //               height: 24,
        //             ),
        //             AuthTextField(
        //                 controller: TextEditingController(),
        //                 hitn: 'Password',
        //                 isObscureText: true,
        //                 suffixIcon: Icon(Icons.remove_red_eye)),
        //             SizedBox(
        //               height: 32,
        //             ),
        //             SubmitButton(
        //                 function: () {
        //                   Navigator.of(context).pushReplacementNamed("/login");
        //                 },
        //                 name: "Reset Password"),
        //           ],
        //         ),
        //       )
        //     ],
        //   ),
        // ),
      ),
    );
  }
}
