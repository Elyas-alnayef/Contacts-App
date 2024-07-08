import 'package:flutter/material.dart';

class TogllerWidget extends StatelessWidget {
  final bool value;
  final String lable;
  final Function() func;
  const TogllerWidget({super.key, required this.lable, required this.func, this.value=false});

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
          value: value,
          onChanged: (val) {
            func();
          },
        ),
      ],
    );
  }
}
