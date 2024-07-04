import 'package:flutter/material.dart';

class UsersFeatureButton extends StatelessWidget {
  final String buttonName;
  final Color buttonColor;
  final Function func;
  const UsersFeatureButton(
      {required this.buttonColor,
      required this.buttonName,
      super.key,
      required this.func});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4), color: buttonColor),
      height: 48,
      child: TextButton(
        onPressed: () {
          func();
        },
        child: Text(
          buttonName,
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400),
        ),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ),
    );
  }
}
