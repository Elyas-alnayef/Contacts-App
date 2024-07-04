import 'package:contacts_app/core/constant/app_routes.dart';
import 'package:contacts_app/core/constant/app_strings.dart';
import 'package:contacts_app/core/widgets/page_title.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/appbar.dart';
import '../../../../core/widgets/drawer.dart';
import '../widgets/button_widget.dart';
import '../widgets/user_card_widget.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PageTitle(
                title: "Home / Users ",
              ),
              Row(
                children: [
                  Expanded(
                    child: UsersFeatureButton(
                      func: () {},
                      buttonColor: Color.fromRGBO(252, 118, 106, 1),
                      buttonName: AppStrings.delete,
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: UsersFeatureButton(
                      func: () {
                        Navigator.of(context).pushNamed(RoutesNames.sendEmail);
                      },
                      buttonColor: Color.fromRGBO(78, 115, 223, 1),
                      buttonName: "Invite New User",
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24),
              TextFormField(
                decoration: InputDecoration(hintText: "Search"),
              ),
              usersListSection(context),
            ],
          ),
        ),
      ),
    );
  }
}

//userslist
Widget usersListSection(BuildContext context) {
  return Container(
      height: 1060,
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 24),
      padding: EdgeInsets.only(top: 24, bottom: 24, left: 16, right: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        color: Colors.white,
      ),
      child: ListView.separated(
          primary: false,
          itemBuilder: (context, index) {
            return UserCard(
              func: () {
                Navigator.of(context).pushNamed(RoutesNames.userProfile);
              },
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(height: 16);
          },
          itemCount: 4));
}
