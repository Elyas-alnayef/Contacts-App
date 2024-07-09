// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../../domain/entities/user_entity.dart';

class UserCard extends StatefulWidget {
  final Function func;
  final UserEntity user;

  const UserCard({required this.func, super.key, required this.user});

  @override
  State<UserCard> createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> {
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 249,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.black26)),
      child: InkWell(
        onTap: () {
          widget.func();
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                    child: Checkbox(
                  value: selected,
                  onChanged: (x) {
                    setState(() {
                      selected = !selected;
                    }); 
                  },
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
            Container(
              width: double.infinity,
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    child: Container(
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
                  ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
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
                        Text(
                          widget.user.firstName + " " + widget.user.lastName,
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      margin: EdgeInsets.only(right: 12, top: 12),
                      alignment: Alignment.center,
                      height: 26,
                      width: 78,
                      decoration: BoxDecoration(
                          color: widget.user.status == "Pending"
                              ? Color.fromRGBO(255, 243, 205, 1)
                              : Color.fromRGBO(212, 237, 218, 1),
                          borderRadius: BorderRadiusDirectional.circular(4)),
                      child: Text(
                        widget.user.status,
                        style: TextStyle(
                            color: widget.user.status == "Active"
                                ? Color.fromRGBO(21, 87, 36, 1)
                                : widget.user.status == "Pending"
                                    ? Color.fromRGBO(133, 100, 4, 1)
                                    : Color.fromRGBO(114, 28, 36, 1),
                            fontSize: 12),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 1,
              margin: EdgeInsets.symmetric(vertical: 8),
              padding: EdgeInsets.symmetric(horizontal: 25),
              width: double.infinity,
              child: Divider(color: Colors.black26),
            ),
            Text(widget.user.email),
            Text(widget.user.phoneNumber)
          ],
        ),
      ),
    );
  }
}
