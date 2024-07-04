import 'package:contacts_app/core/constant/app_strings.dart';
import 'package:contacts_app/features/auth/presentation/widgets/auth_submit_button.dart';
import 'package:contacts_app/features/auth/presentation/widgets/spacer_height.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/appbar.dart';
import '../../../../core/widgets/drawer.dart';

class ExportToPDFPage extends StatelessWidget {
  const ExportToPDFPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerWidget(),
      appBar: const AppBarWidget(),
      backgroundColor: Color(0xFFF7F7F7),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  child: Image.asset("assets/images/exportedPDF.png",
                      fit: BoxFit.fill)),
              Height_32(),
              SubmitButton(name: AppStrings.export, function: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
