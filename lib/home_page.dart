import 'package:contacts_app/core/constant/app_strings.dart';
import 'package:flutter/material.dart';

import 'core/widgets/appbar.dart';
import 'core/widgets/drawer.dart';
import 'core/widgets/drawer_navigation_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      drawer: DrawerWidget(),
      body: const Center(
        child: Text(
          "Hello Home",
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
