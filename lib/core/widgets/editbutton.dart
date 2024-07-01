import 'package:contacts_app/core/constant/app_colors.dart';
import 'package:contacts_app/core/constant/app_strings.dart';
import 'package:flutter/material.dart';

class EditButton extends StatelessWidget {
  final Function function;
  final double width;
  const EditButton({super.key, required this.function, this.width = 143});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4), color: Colors.transparent),
      height: 48,
      width: width,
      child: TextButton(
        onPressed: () {
          function();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.edit_off_outlined,
              color: AppColors.primaryColor,
              size: 18,
            ),
            SizedBox(width: 8),
            Text(
              AppStrings.edit,
              style: TextStyle(color: Color(0xFF4E73DF), fontSize: 16),
            ),
          ],
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
              side: BorderSide(
                  color: Color(0xFF4E73DF)) // Specify the border radius here
              ),
        ),
      ),
    );
  }
}
