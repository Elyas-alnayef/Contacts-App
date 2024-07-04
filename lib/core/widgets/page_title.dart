import 'package:flutter/material.dart';

class PageTitle extends StatelessWidget {
  final String title;
  const PageTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 24, bottom: 0),
          child: Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            bottom: 24,
          ),
          child: Divider(
            color: Colors.black26,
          ),
        ),
      ],
    );
  }
}
