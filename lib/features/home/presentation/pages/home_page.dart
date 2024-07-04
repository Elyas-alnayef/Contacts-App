import 'package:flutter/material.dart';

import '../../../../core/widgets/appbar.dart';
import '../../../../core/widgets/drawer.dart';
import '../../../../core/widgets/page_title.dart';
import '../widgets/home_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarWidget(),
      drawer: DrawerWidget(),
      backgroundColor: Color(0xFFF7F7F7),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PageTitle(
                title: "Statical Dashboard",
              ),
              HomeCard(
                status: "Active",
                arrowIcon: Icons.arrow_upward_outlined,
                cardColor: Color.fromRGBO(26, 188, 156, 1),
              ),
              HomeCard(
                status: "Inactive",
                arrowIcon: Icons.arrow_upward_outlined,
                cardColor: Color.fromRGBO(252, 118, 106, 1),
              ),
              HomeCard(
                status: "With email",
                arrowIcon: Icons.arrow_upward_outlined,
                cardColor: Color.fromRGBO(43, 61, 79, 1),
              ),
              HomeCard(
                status: "Without email",
                arrowIcon: Icons.arrow_upward_outlined,
                cardColor: Color.fromRGBO(91, 132, 177, 1),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
