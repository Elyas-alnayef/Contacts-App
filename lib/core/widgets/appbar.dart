import 'package:contacts_app/core/constant/app_routes.dart';
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
      actions: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.account_circle_outlined,
            ))
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56);
}
