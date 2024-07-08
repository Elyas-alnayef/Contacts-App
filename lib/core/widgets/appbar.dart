import 'package:contacts_app/core/constant/app_routes.dart';
import 'package:contacts_app/core/utils/shared_perferances_service.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(color: Colors.white),
      centerTitle: true,
      title: Container(
          width: 168,
          height: 34,
          child: Image.asset("assets/images/drwarlogo.png")),
      backgroundColor: Colors.blue,
      actions: <Widget>[
        PopupMenuButton<String>(
            constraints: BoxConstraints(
              maxWidth: 210,
            ),
            offset: Offset(0, 40),
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                    child: ListTile(
                  title: Text("Ricardo johnes",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      )),
                  subtitle: Text(
                    "ricardojohnes@gmail.com",
                    style: TextStyle(
                        fontSize: 14, color: Color.fromRGBO(0, 0, 0, 0.6)),
                  ),
                )),
                PopupMenuItem(
                    child: TextButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.settings,
                            color: Color.fromRGBO(0, 0, 0, 0.56), size: 24),
                        label: Text(
                          "Settings",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: Colors.black),
                        ))),
                PopupMenuItem(
                    child: TextButton.icon(
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(RoutesNames.userProfile);
                        },
                        icon: Icon(Icons.person,
                            color: Color.fromRGBO(0, 0, 0, 0.56), size: 24),
                        label: Text("Profile",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: Colors.black)))),
                PopupMenuDivider(),
                PopupMenuItem(
                    child: TextButton.icon(
                        onPressed: () {
                          SharedPrefs.clear("token");
                          Navigator.of(context)
                              .pushReplacementNamed(RoutesNames.logIn);
                        },
                        icon: Icon(
                          Icons.logout_outlined,
                          color: Color.fromRGBO(0, 0, 0, 0.56),
                          size: 24,
                        ),
                        label: Text("Log Out",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: Colors.black)))),
              ];
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Icon(
                Icons.account_circle_outlined,
              ),
            ))
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56);
}
