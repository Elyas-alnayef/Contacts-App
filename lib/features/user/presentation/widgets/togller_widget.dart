import 'package:flutter/material.dart';

class TogllerWidget extends StatelessWidget {
  final String lable;
  final Function(bool) func;
  const TogllerWidget({super.key, required this.lable, required this.func});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(lable),
        SizedBox(
          width: 8,
        ),
        Switch(
          value: true,
          onChanged: (value) {
            func(value);
          },
        ),
      ],
    );
  }
}
