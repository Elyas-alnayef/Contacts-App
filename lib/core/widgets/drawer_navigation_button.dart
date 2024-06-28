import 'package:flutter/material.dart';

class DrawerNavigationButton extends StatelessWidget {
  final String buttonName;
  final Function func;
  const DrawerNavigationButton(
      {super.key, required this.buttonName, required this.func});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.black26))),
      height: 44,
      width: double.infinity,
      padding: EdgeInsets.only(top: 4, bottom: 16, left: 24, right: 24),
      child: InkWell(
          onTap: () {
            func();
          },
          child: Text(
            buttonName,
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
          )),
    );
  }
}
