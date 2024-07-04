import 'package:flutter/material.dart';

import '../../../../core/widgets/appbar.dart';
import '../../../../core/widgets/drawer.dart';

class ContactProfilePage extends StatelessWidget {
  const ContactProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      drawer: const DrawerWidget(),
      appBar: const AppBarWidget(),
    );
  }
}
