import 'package:flutter/material.dart';

Widget AuthTextField({
  required String hitn,
  bool isObscureText = false,
  Icon? suffixIcon,
  double height = 56,
}) =>
    Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(4.0), topRight: Radius.circular(4.0)),
            color: Color(0xFFF7F7F7),
          ),
          height: height,
          alignment: Alignment.bottomCenter,
          child: TextFormField(
            obscureText: isObscureText,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(horizontal: 16),
              filled: true,
              fillColor: Color(0xFFF7F7F7),
              labelText: hitn,
              floatingLabelStyle: TextStyle(fontSize: 14),
              hintStyle: TextStyle(color: Color(0xFF868686)),
              suffixIcon: isObscureText ? suffixIcon : null,
              suffixIconColor: Color(0xFF868686),
            ),
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Divider(
          height: 0,
          color: Colors.black,
          thickness: 1,
        )
      ],
    );

// enabledBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(4.0),
//                   topRight: Radius.circular(4.0),
//                 ),
//                 borderSide: BorderSide(
//                   color: Colors.transparent,
//                 ),
//               ),
//               focusedBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(4.0),
//                   topRight: Radius.circular(4.0),
//                 ),
//                 borderSide: BorderSide(
//                   color: Colors.transparent,
//                 ),
//               ),
//               errorBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(20.0),
//                   topRight: Radius.circular(20.0),
//                 ),
//                 borderSide: BorderSide(
//                   color: Colors.transparent,
//                 ),
//               ),
//               focusedErrorBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(4.0),
//                   topRight: Radius.circular(4.0),
//                 ),
//                 borderSide: BorderSide(
//                   color: Colors.transparent,
//                 ),
//               ),

//  Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(4.0), topRight: Radius.circular(4.0)),
//             color: Color(0xFFF7F7F7),
//           ),
//           height: 56,
//           alignment: Alignment.bottomCenter,)
