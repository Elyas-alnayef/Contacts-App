import 'package:flutter/material.dart';

class DropDownCountriesList extends StatelessWidget {
  final String hint;
  final List<DropdownMenuItem> items;
  final Function(String?) function;
  final String? value;
  final String? Function(dynamic)? validator;
  const DropDownCountriesList(
      {super.key,
      required this.hint,
      required this.function,
      required this.items,
      this.value,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16),
      height: 52,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(4.0), topRight: Radius.circular(4.0)),
        color: Color(0xFFF7F7F7),
      ),
      child: DropdownButtonFormField(
        decoration: InputDecoration(border: InputBorder.none),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: validator,
        isExpanded: true,
        hint: Text("$hint"),
        items: items,
        onChanged: (value) {
          function(value);
        },
        value: value,
      ),
    );
  }
}
