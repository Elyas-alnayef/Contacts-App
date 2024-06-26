import 'package:flutter/material.dart';
class SubmitButton extends StatelessWidget {
  final String name ;
  final Function function ;
  const SubmitButton({super.key,required this.name,required this.function});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Color(0xFF4E73DF),
      ),
      height: 48,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          function();
        },
        child: Text(
          "$name",
          style: TextStyle(color: Colors.white),
        ),
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(4), // Specify the border radius here
            ),
            backgroundColor: Color(0xFF4E73DF)),
      ),
    );
  }
}
  
