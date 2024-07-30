import 'package:contacts_app/features/contacts/domain/entities/contact_entity.dart';
import 'package:flutter/material.dart';

class ContactCard extends StatefulWidget {
  final Function func;
  final Function toggleFav;
  final Function(ContactEntity) selectFunc;

  final ContactEntity contact;

  const ContactCard(
      {required this.func,
      required this.toggleFav,
      super.key,
      required this.contact,
      required this.selectFunc});

  @override
  State<ContactCard> createState() => _UserCardState();
}

class _UserCardState extends State<ContactCard> {
  bool isSelected = false;
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
                  value: isSelected,
                  onChanged: (x) {
                    setState(() {
                      isSelected = !isSelected;
                    });
                    isSelected ? widget.selectFunc(widget.contact) : null;
                  },
                )),
                Spacer(),
                IconButton(
                    onPressed: () {
                      widget.toggleFav();
                    },
                    icon: Icon(
                      widget.contact.isFavorite == true
                          ? Icons.star
                          : Icons.star_border,
                      size: 24,
                      color: widget.contact.isFavorite == true
                          ? Colors.yellow
                          : Colors.black,
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
                          widget.contact.firstName +
                              " " +
                              widget.contact.lastName,
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
                          color: widget.contact.isActive == "Pending"
                              ? Color.fromRGBO(255, 243, 205, 1)
                              : Color.fromRGBO(212, 237, 218, 1),
                          borderRadius: BorderRadiusDirectional.circular(4)),
                      child: Text(
                        widget.contact.isActive,
                        style: TextStyle(
                            color: widget.contact.isActive == "Active"
                                ? Color.fromRGBO(21, 87, 36, 1)
                                : widget.contact.isActive == "Pending"
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
            Text(widget.contact.email1),
            Text(widget.contact.phoneNumber1)
          ],
        ),
      ),
    );
  }
}
