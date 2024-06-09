import 'package:flutter/material.dart';

Widget NavigateButton(
        {double width = 143,
        required String name,
        required Function function}) =>
    Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4), color: Colors.transparent),
      height: 48,
      width: width,
      child: TextButton(
        onPressed: () {
          function();
        },
        child: Text(
          "$name",
          style: TextStyle(color: Color(0xFF4E73DF)),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
              side: BorderSide(
                  color: Color(0xFF4E73DF)) // Specify the border radius here
              ),
        ),
      ),
    );
