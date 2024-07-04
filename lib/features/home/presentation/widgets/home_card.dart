import 'package:flutter/material.dart';

class HomeCard extends StatelessWidget {
  final String status;
  final Color cardColor;
  final IconData arrowIcon;
  const HomeCard(
      {super.key,
      required this.status,
      required this.cardColor,
      required this.arrowIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: cardColor, borderRadius: BorderRadius.circular(10)),
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 19),
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 32),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Text(
                  "101",
                  style: TextStyle(fontSize: 36, color: Colors.white),
                ),
              ),
              Container(
                  margin: EdgeInsets.symmetric(vertical: 25),
                  child: Text(
                    status,
                    style: TextStyle(
                        fontSize: 18,
                        color: Color.fromRGBO(250, 250, 250, 0.5)),
                  )),
              Row(
                children: [
                  Icon(Icons.arrow_upward_sharp,
                      size: 16, color: Color.fromRGBO(250, 250, 250, 0.5)),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "3% form last month",
                    style: TextStyle(
                        fontSize: 16,
                        color: Color.fromRGBO(250, 250, 250, 0.5)),
                  ),
                ],
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Icon(
                    Icons.circle,
                    size: 54,
                    color: Color.fromRGBO(250, 250, 250, 0.5),
                  ),
                  Icon(
                    arrowIcon,
                    size: 34,
                    color: cardColor,
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
