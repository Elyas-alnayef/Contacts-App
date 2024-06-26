import 'package:flutter/material.dart';
import '../widgets/auth_submit_button.dart';
import '../widgets/auth_textfield.dart';

class EmailVerificationPage extends StatelessWidget {
  const EmailVerificationPage({super.key});

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
        //           children: [
        //             AuthTextField(
        //                 controller: TextEditingController(),
        //                 height: 52,
        //                 hitn: 'Enter your Email address',
        //                 isObscureText: true,
        //                 suffixIcon: Icon(Icons.remove_red_eye)),
        //             SizedBox(
        //               height: 32,
        //             ),
        //             SubmitButton(
        //                 function: () {
        //                   Navigator.of(context).pushNamed("/resetpassword");
        //                 },
        //                 name: "Send"),
        //             SizedBox(
        //               height: 32,
        //             ),
        //             Center(
        //               child: TextButton(
        //                   onPressed: () {
        //                     Navigator.pop(context);
        //                   },
        //                   child: Text('Back to Login',
        //                       style: TextStyle(
        //                           fontSize: 14,
        //                           color: Color(0xFF4E73DF),
        //                           fontWeight: FontWeight.w400))),
        //             )
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
