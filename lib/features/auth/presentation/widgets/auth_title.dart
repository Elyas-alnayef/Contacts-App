import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 16),
      child: Container(
        alignment: Alignment.bottomLeft,
        width: double.infinity,
        height: 36,
        child: Text(
          title,
          style: TextStyle(
              overflow: TextOverflow.visible,
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: Color(0xFF868686)),
        ),
      ),
    );
  }
}
