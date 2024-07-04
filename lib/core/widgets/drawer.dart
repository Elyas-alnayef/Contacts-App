import 'package:contacts_app/core/constant/app_routes.dart';
import 'package:flutter/material.dart';

import '../constant/app_strings.dart';
import 'drawer_navigation_button.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: Colors.white,
        child: Column(
          children: [
            SizedBox(height: 26),
            Container(
              margin: const EdgeInsets.only(bottom: 15),
              color: Colors.blue,
              child: Row(children: [
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 13, horizontal: 18),
                    child: Container(
                      child: Container(
                          width: 168,
                          height: 34,
                          child: Image.asset("assets/images/drwarlogo.png")),
                    ),
                  ),
                ),
                Spacer(),
                Expanded(
                  child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.close,
                        color: Colors.white,
                      )),
                )
              ]),
            ),
            DrawerNavigationButton(
              buttonName: AppStrings.home,
              func: () {
                Navigator.of(context).pushNamed(RoutesNames.home);
              },
            ),
            SizedBox(
              height: 4,
            ),
            DrawerNavigationButton(
              buttonName: AppStrings.contacts,
              func: () {
                Navigator.of(context).pushNamed(RoutesNames.contactsHome);
              },
            ),
            SizedBox(
              height: 4,
            ),
            DrawerNavigationButton(
              buttonName: AppStrings.companyProfile,
              func: () {
                //BlocProvider.of<CompanyCubit>(context).getCompanyInfomation();
                Navigator.of(context).pushNamed(RoutesNames.companyProfile);
              },
            ),
            SizedBox(
              height: 4,
            ),
            DrawerNavigationButton(
              buttonName: AppStrings.user,
              func: () {
                Navigator.of(context).pushNamed(RoutesNames.users);
              },
            ),
            SizedBox(
              height: 4,
            ),
            DrawerNavigationButton(
              buttonName: AppStrings.userName,
              func: () {},
            ),
          ],
        ));
  }
}
