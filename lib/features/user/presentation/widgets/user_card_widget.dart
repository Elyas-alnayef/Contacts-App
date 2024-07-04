import 'package:contacts_app/core/constant/app_routes.dart';
import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  const UserCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 241,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.black26)),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(RoutesNames.userProfile);
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                    child: Checkbox(
                  value: false,
                  onChanged: (x) {},
                )),
                Spacer(),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.star_border,
                      size: 24,
                    )),
              ],
            ),
            Container(height: 1, child: Divider(color: Colors.black26)),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 16, top: 12),
                  alignment: Alignment.center,
                  height: 26,
                  width: 42,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(224, 224, 224, 1),
                      borderRadius: BorderRadiusDirectional.circular(4)),
                  child: Text(
                    "#001",
                    style: TextStyle(color: Colors.black26),
                  ),
                ),
                Stack(
                  children: [
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 12),
                          width: 80,
                          height: 80,
                          child: Image.asset("assets/images/person.png"),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text("Adam Smith")
                      ],
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(right: 16, top: 12),
                  alignment: Alignment.center,
                  height: 26,
                  width: 78,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(255, 243, 205, 1),
                      borderRadius: BorderRadiusDirectional.circular(4)),
                  child: Text(
                    "Pending",
                    style: TextStyle(color: Colors.black26, fontSize: 12),
                  ),
                ),
              ],
            ),
            Container(
              height: 1,
              margin: EdgeInsets.symmetric(vertical: 8),
              padding: EdgeInsets.symmetric(horizontal: 25),
              width: double.infinity,
              child: Divider(color: Colors.black26),
            ),
            Text("admasmith@gmial.com"),
            SizedBox(
              height: 4,
            ),
            Text("+905366789356")
          ],
        ),
      ),
    );
  }
}
