import 'package:flutter/material.dart';

Widget DropDownCountriesList({
  required String hint,
  required List<DropdownMenuItem> items,
  required Function(String) function,
}) =>
    Container(
      padding: EdgeInsets.only(left: 16),
      height: 52,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(4.0), topRight: Radius.circular(4.0)),
        color: Color(0xFFF7F7F7),
      ),
      child: DropdownButton(
        isExpanded: true,
        hint: Text("$hint"),
        items: items,
        onChanged: (value) {
          function(value);
        },
        value: null,
      ),
    );
