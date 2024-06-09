import 'package:flutter/material.dart';

Widget SectionTitle({
  required String title,
}) =>
    Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 16),
      child: Container(
        alignment: Alignment.bottomLeft,
        width: double.infinity,
        height: 36,
        child: Text(
          title,
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: Color(0xFF868686)),
        ),
      ),
    );
